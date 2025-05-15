using AppService.Interfaces;
using Domain.Entities;
using MvvmHelpers;
using System.Collections.ObjectModel;
using System.Windows.Input;

public class SalesTransactionViewModel : BaseViewModel
{
    private readonly ISalesTransactionService _salesTransactionService;
    public ObservableCollection<SalesTransaction> SalesTransactions { get; set; }
    public ICommand RefreshCommand { get; }

    public SalesTransactionViewModel(ISalesTransactionService salesTransactionService)
    {
        _salesTransactionService = salesTransactionService;
        SalesTransactions = new ObservableCollection<SalesTransaction>();
        RefreshCommand = new RelayCommand(async () => await LoadSalesTransactions());
        _ = LoadSalesTransactions();
    }

    private async Task LoadSalesTransactions()
    {
        try
        {
            SalesTransactions.Clear();
            var salesTransactionList = await _salesTransactionService.GetAllSalesTransactionAsync();
            if (salesTransactionList == null)
            {
                Console.WriteLine("No sales transactions found in the database.");
                return;
            }
            foreach (var salesTransaction in salesTransactionList)
            {
                SalesTransactions.Add(salesTransaction);
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine("Error fetching sales transactions from database: " + ex.Message);
        }
    }
}
