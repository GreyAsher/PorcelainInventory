using System.Collections.ObjectModel;
using System.Globalization;
using System.Windows;
using System.Windows.Controls;
using AppService.Interfaces;
using Domain.Entities;
using PorcelainInventoryApp.Views.ConfirmWindows;

namespace PorcelainInventoryApp.Views.AddWindows
{
    /// <summary>
    /// Interaction logic for AddInvoiceWindow.xaml
    /// </summary>
    public partial class AddInvoiceWindow : Window
    {
        private readonly IInvoiceService _invoiceService;
        private readonly IProductService _productService;
        private readonly ICustomerService _customerService;
        public event EventHandler InvoiceSaved;

       // private readonly Invoice _invoice;
        public ObservableCollection<Product> CartProducts { get; set; } = new ObservableCollection<Product>();
        //private readonly List<Product> _cartProducts = new List<Product>(); // Stores selected products

        public List<Product> Products { get; set; } = new List<Product>();
        public AddInvoiceWindow(IInvoiceService invoiceService, IProductService productService, ICustomerService customerService)
        {
            InitializeComponent();
            _invoiceService = invoiceService;
            _productService = productService;
            _customerService = customerService;
            DataContext = this; // Set the DataContext for binding
            LoadProducts();
            
        }
        private void CartProducts_CollectionChanged(object sender, System.Collections.Specialized.NotifyCollectionChangedEventArgs e)
        {
            UpdateCartLabel();
            UpdateTotalAmount();
        }

        private async void LoadProducts()
        {
            try
            {
                var productList = await _productService.GetAllProductsAsync();
                Products = new List<Product>(productList.Where(p => p.StockQuantity > 0));
                dgProducts.ItemsSource = Products;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error loading products: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        // Add to Cart button click
        // Add to Cart button click
        private void AddToCart_Click(object sender, RoutedEventArgs e)
        {
            if (dgProducts.SelectedItem is Product selectedProduct)
            {
                var existingProduct = CartProducts.FirstOrDefault(p => p.ProductID == selectedProduct.ProductID);

                if (existingProduct != null)
                {
                    // Check if adding one more exceeds the available stock
                    if (existingProduct.Quantity + 1 > selectedProduct.StockQuantity)
                    {
                        MessageBox.Show($"Cannot add more of {selectedProduct.ProductName}. Available stock: {selectedProduct.StockQuantity}.",
                                        "Stock Limit Exceeded",
                                        MessageBoxButton.OK,
                                        MessageBoxImage.Warning);
                        return;
                    }

                    existingProduct.Quantity++; // UI updates automatically
                }
                else
                {
                    // Check if the stock is available for the first addition
                    if (selectedProduct.StockQuantity <= 0)
                    {
                        MessageBox.Show($"No stock available for {selectedProduct.ProductName}.",
                                        "Out of Stock",
                                        MessageBoxButton.OK,
                                        MessageBoxImage.Warning);
                        return;
                    }


                    CartProducts.Add(new Product
                    {
                        ProductID = selectedProduct.ProductID,
                        ProductName = selectedProduct.ProductName,
                        RetailPrice = selectedProduct.RetailPrice,
                        Quantity = 1
                    });
                }

                UpdateCartLabel();
                UpdateTotalAmount();
            }
            else
            {
                MessageBox.Show("Please select a product to add to the cart.",
                        "No Product Selected",
                        MessageBoxButton.OK,
                        MessageBoxImage.Warning);
            }
        }


        // Remove from Cart button click
        private void RemoveFromCart_Click(object sender, RoutedEventArgs e)
        {
            if (sender is Button btn && btn.DataContext is Product selectedProduct)
            {
                var existingProduct = CartProducts.FirstOrDefault(p => p.ProductID == selectedProduct.ProductID);

                if (existingProduct != null)
                {
                    if (existingProduct.Quantity > 1)
                    {
                        existingProduct.Quantity--; // UI updates automatically
                    }
                    else
                    {
                        CartProducts.Remove(existingProduct);
                    }

                    UpdateCartLabel();
                    UpdateTotalAmount();
                }
            }
            else
            {
                MessageBox.Show("Select a product to remove!", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
        private void UpdateCartLabel()
        {
            lblCartCount.Content = $"Cart: {CartProducts.Sum(p => p.Quantity)} items";
        }

        private void UpdateTotalAmount()
        {
            decimal total = CartProducts.Sum(p => p.RetailPrice * p.Quantity);
            txtTotalAmount.Text = total.ToString("C", new CultureInfo("fil-PH"));
        }

        private void ProceedButton_Click(object sender, RoutedEventArgs e)
        {
            if (CartProducts.Count == 0)
            {
                MessageBox.Show("Cart is empty! Add products before proceeding.", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            decimal totalAmount = CartProducts.Sum(p => p.RetailPrice * p.Quantity);

            var confirmWindow = new ConfirmInvoiceWindow(CartProducts.ToList(), _invoiceService, _productService, _customerService, totalAmount);

            // Subscribe to the InvoiceSaved event
            confirmWindow.InvoiceSaved += (s, e) =>
            {
                // Raise the InvoiceSaved event for SalesControl
                InvoiceSaved?.Invoke(this, EventArgs.Empty);
            };

            confirmWindow.ShowDialog();
            this.Close();
        }
        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
        private void dgProducts_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
    
}
