using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Domain.Entities;

namespace AppService.Interfaces.Repository
{
    public interface IInvoiceRepository
    {
        Task AddInvoiceAsync(Invoice invoice);
        Task<List<Invoice>> GetAllInvoicesAsync();
        Task<Customer?> GetCustomerByIdAsync(int value);
    }
}
