using System.Collections.ObjectModel;
using System.Linq;
using System.Threading.Tasks;
using AppService.Interfaces;
using Domain.Entities;
using MvvmHelpers;

namespace PorcelainInventoryApp.ViewModels
{
    public class ReportViewModel : BaseViewModel
    {
        private readonly IInvoiceService _invoiceService;
        private readonly ICustomerService _customerService;
        private readonly SemaphoreSlim _semaphore = new SemaphoreSlim(1, 1);
        private ObservableCollection<string> _mostPurchasedProductImages;
        private decimal _totalSales;
        private int _totalCustomers;
        private string _bestSellingProduct;

        public decimal TotalSales
        {
            get => _totalSales;
            set
            {
                _totalSales = value;
                OnPropertyChanged(nameof(TotalSales));
            }
        }

        public ObservableCollection<Invoice> SalesReports { get; set; } = new ObservableCollection<Invoice>();

        public int TotalCustomers
        {
            get => _totalCustomers;
            set
            {
                _totalCustomers = value;
                OnPropertyChanged(nameof(TotalCustomers));
            }
        }

        public ReportViewModel(IInvoiceService invoiceService, ICustomerService customerService)
        {
            _invoiceService = invoiceService;
            _customerService = customerService;
        }

        public async Task InitializeAsync()
        {
            await LoadData();
            await LoadTotalCustomers();
            CalculateBestSellingProduct();
        }

        private async Task LoadData()
        {
            await _semaphore.WaitAsync();
            try
            {
                await LoadInvoices();
                CalculateTotalSales();
            }
            finally
            {
                _semaphore.Release();
            }
        }
        private async Task LoadInvoices()
        {
            var invoices = await _invoiceService.GetAllInvoicesAsync();
            SalesReports.Clear();
            foreach (var invoice in invoices)
            {
                SalesReports.Add(invoice);
            }
        }
        private void CalculateTotalSales()
        {
            TotalSales = SalesReports.Sum(invoice => invoice.TotalAmount);
        }

        private async Task LoadTotalCustomers()
        {
            await _semaphore.WaitAsync();
            try
            {
                var customers = await _customerService.GetAllCustomersAsync();
                TotalCustomers = customers.Count();
            }
            finally
            {
                _semaphore.Release();
            }
        }

        public string BestSellingProduct
        {
            get => _bestSellingProduct;
            set
            {
                _bestSellingProduct = value;
                OnPropertyChanged(nameof(BestSellingProduct));
            }
        }
        public void CalculateBestSellingProduct()
        {
            if (SalesReports == null || !SalesReports.Any())
            {
                BestSellingProduct = "N/A";
                return;
            }

            var bestSellingProduct = SalesReports
                .SelectMany(report => report.InvoiceItems) // Flatten the list of InvoiceItems
                .GroupBy(item => item.ProductName) // Group by product name
                .Select(group => new
                {
                    ProductName = group.Key,
                    TotalQuantity = group.Sum(item => item.Quantity)
                })
                .OrderByDescending(product => product.TotalQuantity) // Order by total quantity sold
                .FirstOrDefault();

            BestSellingProduct = bestSellingProduct?.ProductName ?? "N/A";
        }

    }

}
