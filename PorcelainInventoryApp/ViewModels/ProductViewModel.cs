using AppService.Interfaces;
using Domain.Entities;
using System.Collections.ObjectModel;
using MvvmHelpers;
using System.Windows.Input;
using System.Windows;

namespace PorcelainInventoryApp.ViewModels
{
    public class ProductViewModel : BaseViewModel
    {
        private readonly IProductService _productService;
        private readonly SemaphoreSlim _loadSemaphore = new SemaphoreSlim(1, 1);

        public ObservableCollection<Product> Products { get; set; }

        public ICommand RefreshCommand { get; }
        // public ICommand DeleteCommand { get; }
        // public ICommand EditCommand { get; }
        public ProductViewModel DataContext { get; private set; }

        public ProductViewModel(IProductService productService)
        {
            _productService = productService;
            Products = new ObservableCollection<Product>();
            RefreshCommand = new RelayCommand(async () => await LoadProducts());
            // DeleteCommand = new RelayCommand<Product>(async (product) => await DeleteProduct(product));
            // EditCommand = new RelayCommand<Product>(async (product) => await EditProduct(product));

            _ = LoadProducts();
        }

        private async Task LoadProducts()
        {
            await _loadSemaphore.WaitAsync();
            try
            {
                var productList = await _productService.GetAllProductsAsync();

                // Update the collection on the UI thread
                Application.Current.Dispatcher.Invoke(() =>
                {
                    Products.Clear();
                    foreach (var product in productList)
                    {
                        if (product.ProductImage == null || product.ProductImage.Length == 0)
                        {
                            Console.WriteLine($"Product {product.ProductName} has NO image data!");
                        }
                        Products.Add(product);
                    }
                });
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error loading products: " + ex.Message);
            }
            finally
            {
                _loadSemaphore.Release();
            }
        }

        /*
        private async Task DeleteProduct(Product product)
        {
            if (MessageBox.Show($"Delete product: {product.ProductName}?", "Confirm", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                await _productService.DeleteProductAsync(product.ProductID);
                Products.Remove(product);
            }
        }
        */

        private async Task EditProduct(Product product)
        {
            await _productService.UpdateProductAsync(product);
            await LoadProducts();
        }
    }
}
