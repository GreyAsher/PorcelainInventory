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
    public class SalesReportService : ISalesReportService
    {
        private readonly ISalesReportRepository _salesReportRepository;

        public SalesReportService(ISalesReportRepository salesReportRepository)
        {
            _salesReportRepository = salesReportRepository;
        }

        public async Task<IEnumerable<SalesReport>> GetSalesReportsAsync(DateTime? startDate, DateTime? endDate, string category)
        {
            return await _salesReportRepository.GetSalesReportsAsync(startDate, endDate, category);
        }
        public async Task<decimal> GetTotalSalesAsync()
        {
            return await _salesReportRepository.GetTotalSalesAsync();
        }
        public async Task<int> GetTotalCustomersAsync()
        {
            return await _salesReportRepository.GetTotalCustomersAsync();
        }
        public async Task<string> GetBestSellingProductAsync()
        {
            return await _salesReportRepository.GetBestSellingProductAsync();
        }

        public async Task<IEnumerable<SalesReport>> GetAllSalesReportsAsync()
        {
            return await _salesReportRepository.GetAllSalesReportsAsync();
        }

    }

}
