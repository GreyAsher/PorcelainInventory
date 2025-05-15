using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppService.Interfaces.Repository;
using Domain.Entities;
using Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories
{
    public class InvoiceRepository : IInvoiceRepository
    {
        private readonly AppDbContext _context;

        public InvoiceRepository(AppDbContext context)
        {
            _context = context;
        }
        public async Task AddInvoiceAsync(Invoice invoice)
        {
            if (invoice == null)
            {
                throw new ArgumentNullException(nameof(invoice));
            }
            try
            {
                // Add the invoice to the database
                _context.Invoices.Add(invoice);

                // Ensure all InvoiceItems are added to the database
                if (invoice.InvoiceItems != null && invoice.InvoiceItems.Any())
                {
                    foreach (var item in invoice.InvoiceItems)
                    {
                        _context.InvoiceItems.Add(item);
                    }
                }

                // Save changes to the database
                await _context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                // Handle exceptions (e.g., log the error)
                throw new InvalidOperationException("Error adding invoice to the database.", ex);
            }
        }
        public async Task<List<Invoice>> GetAllInvoicesAsync()
        {
            return await _context.Invoices
                .Include(i => i.Customer) // Eager load Customer
                .Include(i => i.InvoiceItems) // Eager load InvoiceItems
                .ToListAsync();
        }
        public async Task<Customer?> GetCustomerByIdAsync(int value)
        {
            return await _context.Customers.FindAsync(value);
        }
    }
}
