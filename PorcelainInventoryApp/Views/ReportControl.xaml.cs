using System.Windows.Controls;
using AppService.Interfaces;
using PorcelainInventoryApp.ViewModels;

namespace PorcelainInventoryApp.Views
{
    public partial class ReportControl : UserControl
    {
        public ReportControl(IInvoiceService invoiceService, ICustomerService customerService)
        {
            InitializeComponent();
            DataContext = new ReportViewModel(invoiceService, customerService);

            Loaded += async (s, e) =>
            {
                if (DataContext is ReportViewModel viewModel)
                {
                    await viewModel.InitializeAsync();
                }
            };
        }
    }
}
