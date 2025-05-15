using System.Windows;
using System.IO; // <-- Add this line
// ... other usings
using AppService.Interfaces;
using AppService.Interfaces.Repository;
using AppService.Services;
using Infrastructure.Persistence;
using Infrastructure.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using PorcelainInventoryApp.ViewModels;
using PorcelainInventoryApp.Views;
using PorcelainInventoryApp.Views.AddWindows;
using System.Globalization;

namespace PorcelainInventoryApp;

public partial class App : Application
{
    public static IServiceProvider ServiceProvider { get; private set; }

    protected override void OnStartup(StartupEventArgs e)
    {
        AppDomain.CurrentDomain.UnhandledException += CurrentDomain_UnhandledException;
        DispatcherUnhandledException += App_DispatcherUnhandledException;

        try
        {
            var services = new ServiceCollection();
            ConfigureServices(services);
            ServiceProvider = services.BuildServiceProvider();

            var mainWindow = ServiceProvider.GetRequiredService<MainWindow>();
            mainWindow.Show();
        }
        catch (Exception ex)
        {
            MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            Shutdown();
        }

        CultureInfo culture = new CultureInfo("en-PH");
        Thread.CurrentThread.CurrentCulture = culture;
        Thread.CurrentThread.CurrentUICulture = culture;

        CultureInfo.DefaultThreadCurrentCulture = culture;
        CultureInfo.DefaultThreadCurrentUICulture = culture;

        base.OnStartup(e);
    }

    private void ConfigureServices(ServiceCollection services)
    {
        try
        {
            // Load configuration from appsettings.json
            var config = new ConfigurationBuilder()
                .SetBasePath(AppDomain.CurrentDomain.BaseDirectory)
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                .Build();

            var connectionString = config.GetConnectionString("DefaultConnection");

            // Use SQLite
            services.AddDbContext<AppDbContext>(options =>
                options.UseSqlite(connectionString));

            services.AddScoped<ICustomerService, CustomerRepository>();
            services.AddScoped<ICategoryRepository, CategoryRepository>();
            services.AddScoped<ICategoryService, CategoryService>();
            services.AddScoped<IProductService, ProductRepository>();
            //services.AddScoped<ISupplierRepository, SupplierRepository>();
            services.AddScoped<ISalesReportRepository, SalesReportRepository>();
            services.AddScoped<ISalesReportService, SalesReportService>();
            services.AddScoped<ISupplierService, SupplierRepository>();
            services.AddScoped<IUserService, UserRepository>();
            services.AddScoped<IInvoiceRepository, InvoiceRepository>();
            services.AddSingleton<IInvoiceService, InvoiceService>();
            services.AddScoped<ISalesTransactionRepository, SalesTransactionRepository>();
            services.AddScoped<ISalesTransactionService, SalesTransactionService>();
            services.AddScoped<SalesTransactionViewModel>();
            services.AddScoped<CategoryViewModel>();
            services.AddScoped<StockManagementControl>();
            services.AddScoped<CompUserControl>();
            services.AddScoped<SupplierControl>();
            services.AddScoped<ProductControl>();
            services.AddScoped<CategoryManagementControl>();
            services.AddScoped<CustomerControl>();
            services.AddTransient<AddInvoiceWindow>();
            services.AddTransient<MainWindow>();
            services.AddTransient<DashboardViewModel>();
            services.AddTransient<DashboardControl>();
        }
        catch (Exception ex)
        {
            MessageBox.Show($"An error occurred while configuring services: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            throw;
        }
    }

    private void CurrentDomain_UnhandledException(object sender, UnhandledExceptionEventArgs e)
    {
        MessageBox.Show($"An unhandled exception occurred: {(e.ExceptionObject as Exception)?.Message}", "Unhandled Exception", MessageBoxButton.OK, MessageBoxImage.Error);
    }

    private void App_DispatcherUnhandledException(object sender, System.Windows.Threading.DispatcherUnhandledExceptionEventArgs e)
    {
        MessageBox.Show($"An unhandled dispatcher exception occurred: {e.Exception.Message}", "Dispatcher Unhandled Exception", MessageBoxButton.OK, MessageBoxImage.Error);
        e.Handled = true;
    }
}
