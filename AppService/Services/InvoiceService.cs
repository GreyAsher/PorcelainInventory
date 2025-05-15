using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppService.Interfaces;
using AppService.Interfaces.Repository;
using Domain.Entities;

namespace AppService.Services
{
    public class InvoiceService : IInvoiceService
    {
        private readonly IInvoiceRepository _invoiceRepository;

        public InvoiceService(IInvoiceRepository invoiceRepository)
        {
            _invoiceRepository = invoiceRepository;
        }
        public async Task AddInvoiceAsync(Invoice invoice)
        {
            await _invoiceRepository.AddInvoiceAsync(invoice);
        }
        public async Task<List<Invoice>> GetAllInvoicesAsync()
        {
            return await _invoiceRepository.GetAllInvoicesAsync();
        }
        public async Task<Customer?> GetCustomerByIdAsync(int value)
        {
            return await _invoiceRepository.GetCustomerByIdAsync(value);
        }

    }
}
