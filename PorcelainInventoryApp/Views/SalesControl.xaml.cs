using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Controls;
using AppService.Interfaces;
using Domain.Entities;
using Infrastructure.Persistence;
using Microsoft.Extensions.DependencyInjection;
using PorcelainInventoryApp.ViewModels;
using PorcelainInventoryApp.Views.AddWindows;
using PorcelainInventoryApp.Views.ViewWindows;

namespace PorcelainInventoryApp.Views
{
    /// <summary>
    /// Interaction logic for SalesControl.xaml
    /// </summary>
    public partial class SalesControl : UserControl
    {
        private readonly IInvoiceService _invoiceService;
        private readonly IProductService _productService;
        private readonly Invoice invoice;

        public SalesControl(IInvoiceService invoiceService, IProductService productService)
        {
            InitializeComponent();
            _invoiceService = invoiceService;
            _productService = productService;
            DataContext = new InvoiceViewModel(invoiceService);
        }

        private void AddInvoiceButton_Click(object sender, RoutedEventArgs e)
        {
            var addInvoiceWindow = App.ServiceProvider.GetRequiredService<AddInvoiceWindow>();

            // Subscribe to the InvoiceSaved event
            addInvoiceWindow.InvoiceSaved += async (s, e) =>
            {
                // Reload the sales data
                await LoadSalesData();
            };

            addInvoiceWindow.Show();
        }

        private async Task LoadSalesData()
        {
            try
            {
                // Fetch and bind the updated sales data to the DataGrid with eager loading of Customer data
                var salesData = await _invoiceService.GetAllInvoicesAsync();

                // Ensure Customer data is included (eager loading)
                foreach (var invoice in salesData)
                {
                    if (invoice.Customer == null && invoice.CustomerID.HasValue)
                    {
                        invoice.Customer = await _invoiceService.GetCustomerByIdAsync(invoice.CustomerID.Value);
                    }
                }

                dgSales.ItemsSource = salesData;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error loading sales data: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }



        private void ViewInvoiceInfo_Click(object sender, RoutedEventArgs e)
        {
            var selectedInvoice = dgSales.SelectedItem as Invoice;
            if (selectedInvoice == null)
            {
                MessageBox.Show("No invoice selected.", "Error", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }
            InvoiceInfoWindow invoiceInfoWindow = new InvoiceInfoWindow(selectedInvoice);
            invoiceInfoWindow.Show();
        }

    }
}



