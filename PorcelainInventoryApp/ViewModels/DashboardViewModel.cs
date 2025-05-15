using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Threading.Tasks;
using AppService.Interfaces;
using Domain.Entities;
using MvvmHelpers;
using LiveChartsCore;
using LiveChartsCore.SkiaSharpView;
using LiveChartsCore.SkiaSharpView.WPF;
using LiveChartsCore.Measure;

namespace PorcelainInventoryApp.ViewModels
{
    public class DashboardViewModel : BaseViewModel
    {
        private ObservableCollection<string> _bestSellingProducts = new ObservableCollection<string>();
        public ObservableCollection<string> BestSellingProducts
        {
            get => _bestSellingProducts;
            set { _bestSellingProducts = value; OnPropertyChanged(nameof(BestSellingProducts)); }
        }

        private readonly IProductService _productService;
        private readonly ISalesTransactionService _salesService;
        private readonly IInvoiceService _invoiceService;
        private readonly ISupplierService _supplierService;
        private readonly SemaphoreSlim _semaphore = new SemaphoreSlim(1, 1);

        private decimal _totalSales;
        private int _totalProducts;
        private int _outOfStock;
        private int _suppliers;

        public decimal TotalSales
        {
            get => _totalSales;
            set { _totalSales = value; OnPropertyChanged(nameof(TotalSales)); }
        }

        public int TotalProducts
        {
            get => _totalProducts;
            set { _totalProducts = value; OnPropertyChanged(nameof(TotalProducts)); }
        }

        public int OutOfStock
        {
            get => _outOfStock;
            set { _outOfStock = value; OnPropertyChanged(nameof(OutOfStock)); }
        }

        public int Suppliers
        {
            get => _suppliers;
            set { _suppliers = value; OnPropertyChanged(nameof(Suppliers)); }
        }

        // LiveCharts2 properties
        public IEnumerable<ISeries> SalesTrendSeries { get; set; }
        public IEnumerable<Axis> SalesTrendXAxes { get; set; }
        public IEnumerable<Axis> SalesTrendYAxes { get; set; }

        public DashboardViewModel(
            IProductService productService,
            ISalesTransactionService salesTransactionService,
            IInvoiceService invoiceService,
            ISupplierService supplierService)
        {
            _productService = productService;
            _salesService = salesTransactionService;
            _invoiceService = invoiceService;
            _supplierService = supplierService;

            SalesTrendSeries = new List<ISeries>();
            SalesTrendXAxes = new List<Axis>();
            SalesTrendYAxes = new List<Axis>();
        }

        public async Task InitializeAsync()
        {
            await LoadData();
            await LoadBestSellingProducts();
            await LoadSalesTrend();
        }

        private async Task LoadBestSellingProducts()
        {
            try
            {
                var invoices = await _invoiceService.GetAllInvoicesAsync();
                var bestSelling = invoices
                    .SelectMany(invoice => invoice.InvoiceItems)
                    .GroupBy(item => item.ProductName)
                    .Select(group => new
                    {
                        ProductName = group.Key,
                        TotalQuantity = group.Sum(item => item.Quantity)
                    })
                    .OrderByDescending(product => product.TotalQuantity)
                    .Take(10)
                    .ToList();

                BestSellingProducts.Clear();
                foreach (var product in bestSelling)
                {
                    BestSellingProducts.Add($"{product.ProductName} - {product.TotalQuantity} units");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error loading best-selling products: {ex.Message}");
            }
        }

        private async Task LoadSalesTrend()
        {
            try
            {
                var invoices = await _invoiceService.GetAllInvoicesAsync();
                var groupedData = invoices
                    .Where(invoice => invoice.DateIssued > DateTime.Now.AddMonths(-6))
                    .GroupBy(invoice => new { invoice.DateIssued.Year, invoice.DateIssued.Month })
                    .OrderBy(group => group.Key.Year)
                    .ThenBy(group => group.Key.Month)
                    .Select(group => new
                    {
                        Month = new DateTime(group.Key.Year, group.Key.Month, 1).ToString("MMM"),
                        TotalSales = group.Sum(invoice => invoice.TotalAmount)
                    })
                    .ToList();

                var salesValues = groupedData.Select(data => Convert.ToDouble(data.TotalSales)).ToArray();
                var monthLabels = groupedData.Select(data => data.Month).ToArray();

                SalesTrendSeries = new List<ISeries>
                {
                    new LineSeries<double>
                    {
                        Name = "Sales",
                        Values = salesValues
                    }
                };

                SalesTrendXAxes = new List<Axis>
                {
                    new Axis
                    {
                        Name = "Month",
                        Labels = monthLabels,
                       
                    }
                };

                SalesTrendYAxes = new List<Axis>
                {
                    new Axis
                    {
                        Name = "Sales Amount",
                        Labeler = value => $"₱{value:N2}"
                    }
                };

                OnPropertyChanged(nameof(SalesTrendSeries));
                OnPropertyChanged(nameof(SalesTrendXAxes));
                OnPropertyChanged(nameof(SalesTrendYAxes));
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error loading sales trend: {ex.Message}");
            }
        }

        private async Task LoadData()
        {
            await _semaphore.WaitAsync();
            try
            {
                await LoadTotalSales();
                await LoadTotalProducts();
                await LoadOutOfStock();
                await LoadSuppliers();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error loading dashboard data: {ex.Message}");
            }
            finally
            {
                _semaphore.Release();
            }
        }

        private async Task LoadTotalSales()
        {
            try
            {
                var invoices = await _invoiceService.GetAllInvoicesAsync();
                TotalSales = invoices.Sum(invoice => invoice.TotalAmount);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error loading TotalSales: {ex.Message}");
            }
        }

        private async Task LoadTotalProducts()
        {
            var products = await _productService.GetAllProductsAsync();
            TotalProducts = products.Count();
        }

        private async Task LoadOutOfStock()
        {
            var products = await _productService.GetAllProductsAsync();
            OutOfStock = products.Count(product => product.StockQuantity == 0);
        }

        private async Task LoadSuppliers()
        {
            var suppliers = await _supplierService.GetAllSuppliersAsync();
            Suppliers = suppliers.Count();
        }
    }
}
