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
    
    public class SupplierService : ISupplierService
    {
        public readonly ISupplierRepository _supplierRepository;

        public SupplierService(ISupplierRepository supplierRepository)
        {

            _supplierRepository = supplierRepository;
        }

        public async Task<IEnumerable<Supplier>> GetAllSuppliersAsync()
        {
            return await _supplierRepository.GetAllSuppliersAsync();
        }

        public async Task AddSupplierAsync(Supplier supplier)
        {
            await _supplierRepository.AddSupplierAsync(supplier);
        }
        public async Task UpdateSupplierAsync(Supplier supplier)
        {
            await _supplierRepository.UpdateSupplierAsync(supplier);
        }
       public async Task DeleteSupplierAsync(int supplierID)
        {
            await _supplierRepository.DeleteSupplierAsync(supplierID);
        }
    }
}

