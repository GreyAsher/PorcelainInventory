using System.Windows.Controls;
using System.Windows;
using PorcelainInventoryApp.ViewModels;

namespace PorcelainInventoryApp.Views
{
    public partial class DashboardControl : UserControl
    {
        private readonly DashboardViewModel _viewModel;

        public DashboardControl(DashboardViewModel viewModel)
        {
            InitializeComponent();
            _viewModel = viewModel;
            DataContext = _viewModel;
            Loaded += DashboardControl_Loaded;
        }

        private async void DashboardControl_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                Console.WriteLine("DashboardControl Loaded event triggered.");
                await _viewModel.InitializeAsync();
                Console.WriteLine("DashboardViewModel initialized successfully.");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error initializing DashboardViewModel: {ex.Message}");
            }
        }
    }
}
