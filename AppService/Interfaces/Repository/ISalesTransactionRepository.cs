using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Domain.Entities;

namespace AppService.Interfaces.Repository
{
    public interface ISalesTransactionRepository
    {
        Task<IEnumerable<SalesTransaction>> GetAllSalesTransactionAsync();
        Task AddSalesTransactionAsync(SalesTransaction salesTransaction);
    }
}

