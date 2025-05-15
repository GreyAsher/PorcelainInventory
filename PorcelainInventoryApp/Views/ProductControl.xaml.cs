using System.Windows;
using System.Windows.Controls;
using AppService.Interfaces;
using AppService.Services;
using Domain.Entities;
using Infrastructure.Repositories;
using PorcelainInventoryApp.ViewModels;
using PorcelainInventoryApp.Views.AddWindows;
using System.Threading;
using System.Threading.Tasks;
using System.Linq;

namespace PorcelainInventoryApp.Views
{
    /// <summary>
    /// Interaction logic for ProductControl.xaml
    /// </summary>
    public partial class ProductControl : UserControl
    {
        private readonly ICategoryService _categoryService;
        private readonly IProductService _productService;
        private CategoryViewModel _categoryViewModel;
        private Category _category;
        private readonly SemaphoreSlim _loadSemaphore = new SemaphoreSlim(1, 1);

        public ProductControl(IProductService productService, ICategoryService categoryService, CategoryViewModel categoryViewModel)
        {
            InitializeComponent();
            _productService = productService;
            _categoryService = categoryService;
            _categoryViewModel = categoryViewModel;
            DataContext = new ProductViewModel(productService);
           // Loaded += ProductControl_Loaded;
        }

        private async void ProductControl_Loaded(object sender, RoutedEventArgs e)
        {
            await LoadProducts();
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
                if (string.IsNullOrEmpty(selected)) selected = "Name"; // Default sort

                var sorted = vm.Products.ToList();

                switch (selected)
                {
                    case "Name":
                        sorted = sorted.OrderBy(p => p.ProductName).ToList();
                        break;
                    case "Category":
                        sorted = sorted.OrderBy(p => p.Category?.CategoryName).ToList();
                        break;
                    case "Price":
                        sorted = sorted.OrderBy(p => p.RetailPrice).ToList();
                        break;
                    case "Date Added":
                        sorted = sorted.OrderByDescending(p => p.DateAdded).ToList();
                        break;
                }

                vm.Products.Clear();
                foreach (var p in sorted)
                    vm.Products.Add(p);
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

                        // Always sort after loading
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

        private void OpenCategoryManagement_Click(object sender, RoutedEventArgs e)
        {
            Window mainWindow = Application.Current.MainWindow;
            if (mainWindow != null)
            {
                ContentControl? mainContent = mainWindow.FindName("MainContent") as ContentControl;
                if (mainContent != null)
                {
                    if (_categoryViewModel == null)
                    {
                        _categoryViewModel = new CategoryViewModel(_categoryService);
                    }
                    mainContent.Content = new CategoryManagementControl(_categoryViewModel, _categoryService, _category);
                }
            }
        }

        private async void AddProduct_Click(object sender, RoutedEventArgs e)
        {
            AddProductWindow addProduct = new AddProductWindow(_productService, _categoryService);
            addProduct.ShowDialog();
            await LoadProducts();
        }

        private async void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            if (sender is FrameworkElement frameworkElement && frameworkElement.DataContext is Product product)
            {
                var confirm = MessageBox.Show($"Are you sure you want to delete '{product.ProductName}'?",
                                               "Confirm Delete",
                                               MessageBoxButton.YesNo,
                                               MessageBoxImage.Warning);
                if (confirm == MessageBoxResult.Yes)
                {
                    await _productService.DeleteProductAsync(product.ProductID);
                    MessageBox.Show("Product deleted successfully!", "Deleted", MessageBoxButton.OK, MessageBoxImage.Information);
                    await LoadProducts();
                }
            }
        }

        private async void EditButton_Click(object sender, RoutedEventArgs e)
        {
            if (sender is FrameworkElement frameworkElement && frameworkElement.DataContext is Product product)
            {
                AddProductWindow addProduct = new AddProductWindow(_productService, _categoryService, product);
                addProduct.ShowDialog();

                product.DateUpdated = DateTime.Now;
                await _productService.UpdateProductAsync(product);
                await LoadProducts();
            }
        }
    }
}
