using System.Windows;
using System.Windows.Controls;
using AppService.Interfaces;
using AppService.Services;
using Domain.Entities;
using PorcelainInventoryApp.ViewModels;
using PorcelainInventoryApp.Views.AddWindows;

namespace PorcelainInventoryApp.Views
{
    /// <summary>
    /// Interaction logic for CustomerControl.xaml
    /// </summary>
    public partial class CustomerControl : UserControl
    {
        private readonly Customer _customer;
        private readonly ICustomerService _customerService;
        private readonly CustomerViewModel _customerViewModel;
        public CustomerControl(CustomerViewModel customerViewModel, ICustomerService customerService, Customer customer)
        {
            InitializeComponent();
            _customerService = customerService;
            _customerViewModel = customerViewModel;
            _customer = customer;
            DataContext = new CustomerViewModel(customerService);
        }

        public void AddCustomer_Click(object sender, RoutedEventArgs e)
        {
            AddCustomerWindow addCustomerWindow = new AddCustomerWindow(_customerService, _customer);
            addCustomerWindow.ShowDialog();
            DataContext = new CustomerViewModel(_customerService);
        }

        private async void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            if (sender is FrameworkElement frameworkElement && frameworkElement.DataContext is Customer customer)
            {
                var confirm = MessageBox.Show($"Are you sure you want to delete '{customer.FullName}'?",
                                               "Confirm Delete",
                                               MessageBoxButton.YesNo,
                                               MessageBoxImage.Warning);
                if (confirm == MessageBoxResult.Yes)
                {
                    await _customerService.DeleteCustomerAsync(customer.CustomerID);
                    DataContext = new CustomerViewModel(_customerService);
                    MessageBox.Show("Customer deleted successfully!", "Deleted", MessageBoxButton.OK, MessageBoxImage.Information);
                    
                }
            }
        }

        private async void EditButton_Click(object sender, RoutedEventArgs e)
        {
            if (sender is FrameworkElement frameworkElement && frameworkElement.DataContext is Customer customer)
            {
                AddCustomerWindow addCustomerWindow = new AddCustomerWindow(_customerService, customer);
                addCustomerWindow.ShowDialog();
                DataContext = new CustomerViewModel(_customerService);
            }
        }

    }
}

