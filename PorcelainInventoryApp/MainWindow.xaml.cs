using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using AppService.Interfaces;
using AppService.Services;
using Domain.Entities;
using PorcelainInventoryApp.ViewModels;
using PorcelainInventoryApp.Views;

namespace PorcelainInventoryApp;

/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class MainWindow : Window
{
    private readonly ICustomerService _customerService;
    private readonly IProductService _productService;
    private readonly ISupplierService _supplierService;
    private readonly ICategoryService _categoryService;
    private readonly ISalesTransactionService _salesTransactionService;
    private readonly ISalesReportService _salesReportService;
    private readonly IInvoiceService _invoiceService;
    private readonly IUserService _userRepository;
    private readonly CategoryViewModel _categoryViewModel;
    private readonly SupplierViewModel _supplierViewModel;
    private readonly CustomerViewModel _customerViewModel;
    private readonly Customer _customer;
    private readonly Supplier _supplier;
    private readonly Invoice _invoice;


    public MainWindow(ICustomerService customerService, IProductService productService, ICategoryService categoryService, ISupplierService supplierService, ISalesReportService salesReportService, IInvoiceService invoiceService, ISalesTransactionService salesTransactionService, CategoryViewModel categoryViewModel)
    {
        InitializeComponent();

        // Assign services
        _customerService = customerService ?? throw new ArgumentNullException(nameof(customerService));
        _productService = productService ?? throw new ArgumentNullException(nameof(productService));
        _supplierService = supplierService ?? throw new ArgumentNullException(nameof(supplierService));
        _categoryService = categoryService ?? throw new ArgumentNullException(nameof(categoryService));
        _salesReportService = salesReportService ?? throw new ArgumentNullException(nameof(salesReportService));
        _invoiceService = invoiceService ?? throw new ArgumentNullException(nameof(invoiceService));
        _salesTransactionService = salesTransactionService ?? throw new ArgumentNullException(nameof(salesTransactionService));
        _categoryViewModel = categoryViewModel ?? throw new ArgumentNullException(nameof(categoryViewModel));

        // Initialize the dashboard
        var dashboardViewModel = new DashboardViewModel(_productService, _salesTransactionService,_invoiceService, _supplierService);
        MainContent.Content = new DashboardControl(dashboardViewModel);
    }

    public MainWindow()
    {
        InitializeComponent();
        // Optionally, set up default/mock services for design-time
    }


    private void DashboardButton_Click(object sender, RoutedEventArgs e)
    {
        if (_productService == null || _salesTransactionService == null || _supplierService == null)
        {
            MessageBox.Show("Services are not initialized.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            return;
        }

        var dashboardViewModel = new DashboardViewModel(_productService, _salesTransactionService, _invoiceService, _supplierService);
        MainContent.Content = new DashboardControl(dashboardViewModel);
    }
    private void CustomerButton_Click(object sender, RoutedEventArgs e)
    {
        MainContent.Content = new CustomerControl(_customerViewModel, _customerService, _customer);
    }
    private void ProductButton_Click(object sender, RoutedEventArgs e)
    {
        MainContent.Content = new ProductControl(_productService, _categoryService, _categoryViewModel);
    }
    private void SupplierButton_Click(object sender, RoutedEventArgs e)
    {
        MainContent.Content = new SupplierControl(_supplierViewModel, _supplierService, _supplier);
    }
    private void StockButton_Click(object sender, RoutedEventArgs e)
    {
        MainContent.Content = new StockManagementControl(_productService);
    }
    private void SalesButton_Click(object sender, RoutedEventArgs e)
    {
        MainContent.Content = new SalesControl(_invoiceService, _productService);
    }
    private void ReportButton_Click(object sender, RoutedEventArgs e)
    {
        MainContent.Content = new ReportControl(_invoiceService, _customerService);
    }
    private void UserButton_Click(object sender, RoutedEventArgs e)
    {
        MainContent.Content = new CompUserControl(_userRepository);
    }
    private void Border_MouseDown(object sender, MouseButtonEventArgs e)
    {
        if (e.ChangedButton == MouseButton.Left)
        {
            this.DragMove();

        }
    }
    private bool IsMaximized = false;
    private DashboardViewModel _viewModel;

    private void Border_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
    {
        if (e.ClickCount == 2)
        {
            if (IsMaximized)
            {
                this.WindowState = WindowState.Normal;
                this.Width = 1000;
                this.Height = 720;

                IsMaximized = false;
            }
            else
            {
                this.WindowState = WindowState.Maximized;

                IsMaximized = true;
            }
        }
    }
}