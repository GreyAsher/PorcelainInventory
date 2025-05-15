using System;
using System.Collections.ObjectModel;
using System.Threading;
using System.Threading.Tasks;
using AppService.Interfaces;
using Domain.Entities;
using System.Windows.Input;
using MvvmHelpers;
using System.Windows;

namespace PorcelainInventoryApp.ViewModels
{
    public class SupplierViewModel : BaseViewModel
    {
        public readonly ISupplierService _supplierService;
        private readonly SemaphoreSlim _loadSemaphore = new SemaphoreSlim(1, 1);

        public ObservableCollection<Supplier> Suppliers { get; set; }

        public ICommand RefreshCommand { get; }
        public SupplierViewModel DataContext { get; private set; }

        public SupplierViewModel(ISupplierService supplierService)
        {
            _supplierService = supplierService;
            Suppliers = new ObservableCollection<Supplier>();
            RefreshCommand = new RelayCommand(async () => await LoadSuppliers());
            _ = LoadSuppliers();
        }

        private async Task LoadSuppliers()
        {
            await _loadSemaphore.WaitAsync();
            try
            {
                var supplierList = await _supplierService.GetAllSuppliersAsync();

                // Update the collection on the UI thread
                Application.Current.Dispatcher.Invoke(() =>
                {
                    Suppliers.Clear();
                    foreach (var supplier in supplierList)
                    {
                        Suppliers.Add(supplier);
                    }
                });
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error loading suppliers: " + ex.Message);
            }
            finally
            {
                _loadSemaphore.Release();
            }
        }

        public async Task DeleteSupplier(Supplier supplier)
        {
            if (supplier == null) return;
            try
            {
                await _supplierService.DeleteSupplierAsync(supplier.SupplierID);

                Application.Current.Dispatcher.Invoke(() =>
                {
                    Suppliers.Remove(supplier);
                });
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error deleting supplier: " + ex.Message);
            }
        }
    }
}
