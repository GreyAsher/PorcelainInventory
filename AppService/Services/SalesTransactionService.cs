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
    public class SalesTransactionService : ISalesTransactionService
    {
        private readonly ISalesTransactionRepository _salesTransactionRepository;
        public SalesTransactionService(ISalesTransactionRepository salesTransactionRepository)
        {
            _salesTransactionRepository = salesTransactionRepository;
        }
        public async Task<IEnumerable<SalesTransaction>> GetAllSalesTransactionAsync()
        {
            return await _salesTransactionRepository.GetAllSalesTransactionAsync();
        }
        public async Task AddSalesTransactionAsync(SalesTransaction salesTransaction)
        {
            await _salesTransactionRepository.AddSalesTransactionAsync(salesTransaction); 
        }
    } 
}