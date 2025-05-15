using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Windows;
using AppService.Interfaces;
using AppService.Services;
using Domain.Entities;
using PorcelainInventoryApp.ViewModels;
using PorcelainInventoryApp.Views.AddWindows;

namespace PorcelainInventoryApp.Views.ConfirmWindows
{
    /// <summary>
    /// Interaction logic for ConfirmInvoiceWindow.xaml
    /// </summary>
    public partial class ConfirmInvoiceWindow : Window
    {
        private readonly IInvoiceService _invoiceService;
        private readonly IProductService _productService;
        private readonly ICustomerService _customerService;
        private readonly List<Product> _confirmedCart;

        public event EventHandler InvoiceSaved;

        public ConfirmInvoiceWindow(List<Product> cartItems, IInvoiceService invoiceService, IProductService productService, ICustomerService customerService, decimal totalAmount)
        {
            InitializeComponent();
            _confirmedCart = cartItems ?? throw new ArgumentNullException(nameof(cartItems));
            _invoiceService = invoiceService ?? throw new ArgumentNullException(nameof(invoiceService));
            _productService = productService ?? throw new ArgumentNullException(nameof(productService));
            _customerService = customerService;

            dgInvoiceSummary.ItemsSource = cartItems;
            txtTotalAmount.Text = totalAmount.ToString("C", new CultureInfo("fil-PH"));
        }

        private async void AddInvoiceButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                // Ensure the cart is not empty
                if (_confirmedCart == null || !_confirmedCart.Any())
                {
                    MessageBox.Show("No items in the cart to create an invoice.", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                // Get the customer ID
                string customerName = txtCustomerName.Text.Trim();
                int? customerId = null;

                if (!string.IsNullOrEmpty(customerName))
                {
                    var customer = (await _customerService.GetAllCustomersAsync())
                        .FirstOrDefault(c => c.FullName.Equals(customerName, StringComparison.OrdinalIgnoreCase));

                    if (customer != null)
                    {
                        customerId = customer.CustomerID;
                    }
                    else
                    {
                        MessageBox.Show($"Customer '{customerName}' does not exist. Please add the customer first.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                }

                // Update product quantities in the database
                foreach (var cartItem in _confirmedCart)
                {
                    var product = await _productService.GetProductByIdAsync(cartItem.ProductID);
                    if (product != null)
                    {
                        if (product.StockQuantity < cartItem.Quantity)
                        {
                            MessageBox.Show($"Insufficient stock for {product.ProductName}. Available: {product.StockQuantity}, Required: {cartItem.Quantity}.",
                                            "Stock Error",
                                            MessageBoxButton.OK,
                                            MessageBoxImage.Error);
                            return;
                        }

                        product.StockQuantity -= cartItem.Quantity;
                        await _productService.UpdateProductAsync(product);
                    }
                }

                // Parse the total amount using the same culture used for formatting
                if (!decimal.TryParse(txtTotalAmount.Text, NumberStyles.Currency, new CultureInfo("fil-PH"), out decimal totalAmount))
                {
                    MessageBox.Show("Invalid total amount. Please check the input.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }


                // Create the invoice
                var invoice = new Invoice
                {
                    CustomerID = customerId,
                    TotalAmount = totalAmount,
                    DateIssued = DateTime.Now,
                    InvoiceItems = _confirmedCart.Select(p => new InvoiceItem
                    {
                        ProductName = p.ProductName,
                        Quantity = p.Quantity,
                        Price = p.RetailPrice,
                    }).ToList()
                };

                // Debugging output for invoice items
                foreach (var item in invoice.InvoiceItems)
                {
                    Debug.WriteLine($"Product: {item.ProductName}, Quantity: {item.Quantity}, Price: {item.Price}");
                }

                // Save the invoice to the database
                await _invoiceService.AddInvoiceAsync(invoice);

                InvoiceSaved?.Invoke(this, EventArgs.Empty);

                MessageBox.Show("Invoice added successfully!", "Success", MessageBoxButton.OK, MessageBoxImage.Information);

                // Update the DataContext to refresh the UI
                DataContext = new InvoiceViewModel(_invoiceService);

                // Close the window
                this.Close();
            }
            catch (Exception ex)
            {
                // Handle exceptions and display the error message
                Exception inner = ex.InnerException;
                while (inner != null)
                {
                    ex = inner;
                    inner = ex.InnerException;
                }

                MessageBox.Show($"Error: {ex.Message}\n\nStackTrace: {ex.StackTrace}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private async void txtCustomerName_LostFocus(object sender, RoutedEventArgs e)
        {
            string customerName = txtCustomerName.Text.Trim();

            if (!string.IsNullOrEmpty(customerName))
            {
                try
                {
                    // Check if the customer exists in the database
                    var customer = (await _customerService.GetAllCustomersAsync())
                        .FirstOrDefault(c => c.FullName.Equals(customerName, StringComparison.OrdinalIgnoreCase));

                    if (customer == null)
                    {
                        // Show confirmation dialog
                        MessageBoxResult result = MessageBox.Show(
                            $"Customer '{customerName}' does not exist. Would you like to add them?",
                            "Add Customer",
                            MessageBoxButton.YesNo,
                            MessageBoxImage.Question);

                        if (result == MessageBoxResult.Yes)
                        {
                            // Open the Add Customer window
                            AddCustomerWindow addCustomerWindow = new AddCustomerWindow(_customerService, new Customer { FullName = customerName });
                            addCustomerWindow.ShowDialog();

                            // Refresh customer list and update the field
                            var addedCustomer = (await _customerService.GetAllCustomersAsync())
                                .FirstOrDefault(c => c.FullName.Equals(customerName, StringComparison.OrdinalIgnoreCase));

                            if (addedCustomer != null)
                            {
                                txtCustomerName.Text = addedCustomer.FullName;
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle exceptions and display the error message
                    MessageBox.Show($"An error occurred while checking the customer: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
