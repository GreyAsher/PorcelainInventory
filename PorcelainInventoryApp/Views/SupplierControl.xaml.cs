using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
using Domain.Entities;
using Infrastructure.Repositories;
using PorcelainInventoryApp.ViewModels;
using PorcelainInventoryApp.Views;
using PorcelainInventoryApp.Views.AddWindows;

namespace PorcelainInventoryApp.Views
{
    /// <summary>
    /// Interaction logic for SupplierControl.xaml
    /// </summary>
    public partial class SupplierControl : UserControl
    {
        private readonly ISupplierService _supplierService;
        private readonly SupplierViewModel _supplierViewModel;
        private readonly Supplier _supplier;
        public SupplierControl(SupplierViewModel supplierViewModel, ISupplierService supplierService, Supplier supplier)
        {
            InitializeComponent();
            _supplierService = supplierService;
            _supplier = supplier;
            _supplierViewModel = supplierViewModel;
            DataContext = new SupplierViewModel(_supplierService);
        }

      
        private void AddSupplier_Click(object sender, RoutedEventArgs e)
        {
            var addSupplierWindow = new AddSupplierWindow(_supplierService, _supplier);
            addSupplierWindow.ShowDialog();
            DataContext = new SupplierViewModel(_supplierService);
        }

        private async void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            if (sender is FrameworkElement frameworkElement && frameworkElement.DataContext is Supplier supplier)
            {
                var confirm = MessageBox.Show($"Are you sure you want to delete '{supplier.SupplierName}'?",
                                               "Confirm Delete",
                                               MessageBoxButton.YesNo,
                                               MessageBoxImage.Warning);
                if (confirm == MessageBoxResult.Yes)
                {
                    await _supplierService.DeleteSupplierAsync(supplier.SupplierID);
                    DataContext = new SupplierViewModel(_supplierService);
                    MessageBox.Show("Supplier deleted successfully!", "Deleted", MessageBoxButton.OK, MessageBoxImage.Information);
                }
               
            }
        }

        private async void EditButton_Click(object sender, RoutedEventArgs e)
        {
            if (sender is FrameworkElement frameworkElement && frameworkElement.DataContext is Supplier supplier)
            {
                var editSupplierWindow = new AddSupplierWindow(_supplierService, supplier);
                editSupplierWindow.ShowDialog();
                DataContext = new SupplierViewModel(_supplierService);
            }
        }
    }
}
