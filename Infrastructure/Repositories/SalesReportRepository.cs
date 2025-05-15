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
    public class SalesReportRepository : ISalesReportRepository
    {
        private readonly AppDbContext _context;

        public SalesReportRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<SalesReport>> GetSalesReportsAsync(DateTime? startDate, DateTime? endDate, string category)
        {
            var query = _context.SalesReports
                .Where(s => (!startDate.HasValue || s.SaleDate >= startDate) &&
                            (!endDate.HasValue || s.SaleDate <= endDate))
                .Select(s => new SalesReport
                {
                    InvoiceNumber = s.InvoiceNumber,
                    CustomerName = s.CustomerName,
                    TotalAmount = s.TotalAmount,
                    SaleDate = s.SaleDate,
                    Status = "Completed" // Assume completed for now, you can add real status
                });

            return await query.ToListAsync();
        }

        public async Task<decimal> GetTotalSalesAsync()
        {
            return await _context.SalesReports.SumAsync(s => s.TotalAmount);
        }

        public async Task<int> GetTotalCustomersAsync()
        {
            return await _context.SalesReports.Select(s => s.CustomerName).Distinct().CountAsync();
        }

        public async Task<string> GetBestSellingProductAsync()
        {
            return await _context.SalesReports
                .GroupBy(s => s.CustomerName)
                .OrderByDescending(g => g.Sum(s => s.TotalAmount))
                .Select(g => g.Key)
                .FirstOrDefaultAsync();
        }



        public async Task<IEnumerable<SalesReport>> GetAllSalesReportsAsync()
        {
            return await _context.SalesReports.ToListAsync();
        }

    }
}
