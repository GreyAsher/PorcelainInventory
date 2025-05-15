using System;
using System.Collections.ObjectModel;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using AppService.Interfaces;
using Domain.Entities;
using MvvmHelpers;

namespace PorcelainInventoryApp.ViewModels
{
    public class CustomerViewModel : BaseViewModel
    {
        private readonly ICustomerService _customerService;
        private readonly SemaphoreSlim _loadSemaphore = new SemaphoreSlim(1, 1);

        public ObservableCollection<Customer> Customers { get; set; }
        public ICommand RefreshCommand { get; }
        public Customer DataContext { get; private set; }

        public CustomerViewModel(ICustomerService customerService)
        {
            _customerService = customerService;
            Customers = new ObservableCollection<Customer>();
            RefreshCommand = new RelayCommand(async () => await LoadCustomers());

            _ = LoadCustomers();
        }

        public async Task LoadCustomers()
        {
            await _loadSemaphore.WaitAsync();
            try
            {
                var customerList = await _customerService.GetAllCustomersAsync();

                // Update the collection on the UI thread
                Application.Current.Dispatcher.Invoke(() =>
                {
                    Customers.Clear();
                    foreach (var customer in customerList)
                    {
                        Customers.Add(customer);
                    }
                });
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error loading customers: " + ex.Message);
            }
            finally
            {
                _loadSemaphore.Release();
            }
        }

        private async Task AddCustomer(Customer customer)
        {
            if (customer == null) return;
            try
            {
                await _customerService.AddCustomerAsync(customer);
                Application.Current.Dispatcher.Invoke(() =>
                {
                    Customers.Add(customer);
                });
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error adding customer: " + ex.Message);
            }
        }

        private async Task EditCustomer(Customer customer)
        {
            if (customer == null) return;
            try
            {
                await _customerService.UpdateCustomerAsync(customer);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error updating customer: " + ex.Message);
            }
        }

        private async Task DeleteCustomer(Customer customer)
        {
            if (customer == null) return;
            try
            {
                await _customerService.DeleteCustomerAsync(customer.CustomerID);
                Application.Current.Dispatcher.Invoke(() =>
                {
                    Customers.Remove(customer);
                });
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error deleting customer: " + ex.Message);
            }
        }
    }
}
