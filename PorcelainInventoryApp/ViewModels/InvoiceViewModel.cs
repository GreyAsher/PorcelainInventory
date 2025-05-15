using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using AppService.Interfaces;
using Domain.Entities;
using MvvmHelpers;

namespace PorcelainInventoryApp.ViewModels
{
    public class InvoiceViewModel : BaseViewModel
    {
        private readonly IInvoiceService _invoiceService;
        public ObservableCollection<Invoice> Invoices { get; set; }
        public ICommand RefreshCommand { get; }
        public InvoiceViewModel(IInvoiceService invoiceService)
        {
            _invoiceService = invoiceService;
            Invoices = new ObservableCollection<Invoice>();
            RefreshCommand = new RelayCommand(async () => await LoadInvoices());
            _ = LoadInvoices();
        }
        private async Task LoadInvoices()
        {
            try
            {
                Invoices.Clear();
                var invoiceList = await _invoiceService.GetAllInvoicesAsync();
                if (invoiceList == null)
                {
                    Console.WriteLine("No invoices found in the database.");
                    return;
                }
                foreach (var invoice in invoiceList)
                {
                    Invoices.Add(invoice);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error fetching invoices from database: " + ex.Message);
            }
        }
    }
}
