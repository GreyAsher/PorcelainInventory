using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using AppService.Interfaces;
using Domain.Entities;
using Infrastructure.Repositories;

namespace PorcelainInventoryApp.Views
{
    /// <summary>
    /// Interaction logic for CompUserControl.xaml
    /// </summary>
    public partial class CompUserControl : UserControl
    {
        private readonly IUserService _userRepository;
        public CompUserControl(IUserService userRepository)
        {
            InitializeComponent();
            _userRepository = userRepository;
            Loaded += UserControl_Loaded;
        }

        private async void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                await LoadUsers();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error");
            }
        }

        private async Task LoadUsers()
        {
            IEnumerable<User> users = await _userRepository.GetAllUsersAsync();
            dgUsers.ItemsSource = users;
        }
    }
}
