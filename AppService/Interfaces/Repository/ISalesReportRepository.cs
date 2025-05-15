using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Domain.Entities;

namespace AppService.Interfaces.Repository
{
    public interface ISalesReportRepository
    {
        Task<IEnumerable<SalesReport>> GetAllSalesReportsAsync();
        Task<IEnumerable<SalesReport>> GetSalesReportsAsync(DateTime? startDate, DateTime? endDate, string category);
        Task<decimal> GetTotalSalesAsync();
        Task<int> GetTotalCustomersAsync();
        Task<string> GetBestSellingProductAsync();
    }
}
