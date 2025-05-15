using System.Windows;
using System.Windows.Controls;
using AppService.Interfaces;
using Domain.Entities;
using System.Threading;
using System.Threading.Tasks;
using PorcelainInventoryApp.ViewModels;
using System.Linq;
using PorcelainInventoryApp.Views.AddWindows;

namespace PorcelainInventoryApp.Views
{
    public partial class StockManagementControl : UserControl
    {
        private readonly IProductService _productService;
        private readonly SemaphoreSlim _loadSemaphore = new SemaphoreSlim(1, 1);

        public StockManagementControl(IProductService productService)
        {
            InitializeComponent();
            _productService = productService;
            DataContext = new ProductViewModel(productService);
            // Loaded += ProductUserLoaded_Loaded;
        }

        private void SortComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ApplyCurrentSort();
        }

        private void ApplyCurrentSort()
        {
            if (DataContext is ProductViewModel vm)
            {
                var selected = (SortComboBox.SelectedItem as ComboBoxItem)?.Content as string;
                if (string.IsNullOrEmpty(selected)) return;

                var sorted = vm.Products.ToList();

                switch (selected)
                {
                    case "Name":
                        sorted = sorted.OrderBy(p => p.ProductName).ToList();
                        break;
                    case "Stock Quantity":
                        sorted = sorted.OrderByDescending(p => p.StockQuantity).ToList();
                        break;
                    case "Last Updated":
                        sorted = sorted.OrderByDescending(p => p.DateUpdated).ToList();
                        break;
                }

                vm.Products.Clear();
                foreach (var p in sorted)
                    vm.Products.Add(p);
            }
        }

        private void ProductControl_Loaded(object sender, RoutedEventArgs e)
        {
            throw new NotImplementedException();
        }

        private async void ProductUserLoaded_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                await LoadProducts();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error");
            }
        }

        private async Task LoadProducts()
        {
            await _loadSemaphore.WaitAsync();
            try
            {
                if (DataContext is ProductViewModel vm)
                {
                    var products = await _productService.GetAllProductsAsync();

                    Application.Current.Dispatcher.Invoke(() =>
                    {
                        vm.Products.Clear();
                        foreach (var p in products)
                            vm.Products.Add(p);

                        // Re-apply current sort after reload
                        ApplyCurrentSort();
                    });
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error loading products: " + ex.Message, "Error");
            }
            finally
            {
                _loadSemaphore.Release();
            }
        }

        private async void openAddStock_Click(object sender, RoutedEventArgs e)
        {
            if (dgStockItems.SelectedItem is Product selectedProduct)
            {
                AddStockWindow addStockWindow = new AddStockWindow(selectedProduct.ProductName, selectedProduct, _productService);
                addStockWindow.ShowDialog();

                // Reload the products to reflect the updated stock quantity
                await LoadProducts();
            }
            else
            {
                MessageBox.Show("Please select a product to add stock.", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
    }
}
