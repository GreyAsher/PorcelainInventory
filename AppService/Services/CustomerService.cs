using AppService.Interfaces;
using AppService.Interfaces.Repository;
using Domain.Entities;

namespace AppService.Services
{
    public class CustomerService : ICustomerService
    {
        private readonly ICustomerRepository _customerRepository;
        public CustomerService(ICustomerRepository customerRepository)
        {
            _customerRepository = customerRepository;
        }

        private async Task<IEnumerable<Customer>> GetAllCustomersAsync()
        {
            return await _customerRepository.GetAllCustomersAsync();
        }
        private async Task AddCustomerAsync(Customer customer)
        {
            await _customerRepository.AddCustomerAsync(customer);
        }
        private async Task UpdateCustomerAsync(Customer customer)
        {
            await _customerRepository.UpdateCustomerAsync(customer);
        }
        private async Task DeleteCustomerAsync(int customerID)
        {
            await _customerRepository.DeleteCustomerAsync(customerID);
        }

        Task<IEnumerable<Customer>> ICustomerService.GetAllCustomersAsync()
        {
            return GetAllCustomersAsync();
        }

        Task ICustomerService.AddCustomerAsync(Customer customer)
        {
            return AddCustomerAsync(customer);
        }

        Task ICustomerService.UpdateCustomerAsync(Customer customer)
        {
            return UpdateCustomerAsync(customer);
        }

        Task ICustomerService.DeleteCustomerAsync(int customerID)
        {
            return DeleteCustomerAsync(customerID);
        }
        Task<bool> ICustomerService.CustomerExistsAsync(string customerName)
        {
            return _customerRepository.CustomerExistsAsync(customerName);
        }
    }


}
