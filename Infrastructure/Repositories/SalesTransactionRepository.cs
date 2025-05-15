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
    public class SalesTransactionRepository : ISalesTransactionRepository
    {
        private readonly AppDbContext _context;
        public SalesTransactionRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<SalesTransaction>> GetAllSalesTransactionAsync()
        {
            return await _context.SalesTransactions.ToListAsync();
        }
        public async Task AddSalesTransactionAsync(SalesTransaction salesTransaction)
        {
            await _context.SalesTransactions.AddAsync(salesTransaction);
            await _context.SaveChangesAsync();
        }
    }
}
