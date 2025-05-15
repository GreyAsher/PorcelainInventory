using System.Windows;
using System.Windows.Controls;
using AppService.Interfaces;
using Domain.Entities;
using PorcelainInventoryApp.ViewModels;
using PorcelainInventoryApp.Views.AddWindows;

namespace PorcelainInventoryApp.Views
{
    /// <summary>
    /// Interaction logic for CategoryManagementControl.xaml
    /// </summary>
    public partial class CategoryManagementControl : UserControl
    {
        private readonly CategoryViewModel _categoryViewModel;
        private readonly ICategoryService _categoryService;
        private readonly Category _category;
        //private ICategorySevice categoryService;

        public CategoryManagementControl(CategoryViewModel categoryViewModel, ICategoryService categoryService, Category category)
        {
            InitializeComponent();
            _categoryViewModel = categoryViewModel;
            _categoryService = categoryService;
            _category = category;
            DataContext = _categoryViewModel;

            // 🔥 Fetch fresh data every time the UserControl is loaded
        this.Loaded += async (s, e) => await _categoryViewModel.LoadCategories();
        }

        public void AddCategory_Click(object sender, RoutedEventArgs e)
        {
            AddCategoryWindow addCategoryWindow = new AddCategoryWindow(_categoryService, _category);
            addCategoryWindow.ShowDialog();
            DataContext = new CategoryViewModel(_categoryService);
        }


        private async void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            if (sender is FrameworkElement frameworkElement && frameworkElement.DataContext is Category category)
            {
                var confirm = MessageBox.Show($"Are you sure you want to delete '{category.CategoryName}'?",
                                               "Confirm Delete",
                                               MessageBoxButton.YesNo,
                                               MessageBoxImage.Warning);

                if (confirm == MessageBoxResult.Yes)
                {
                    await _categoryViewModel.DeleteCategory(category);
                    MessageBox.Show("Category deleted successfully!", "Deleted", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                DataContext = new CategoryViewModel(_categoryService);
            }
        }

        private async void EditButton_Click(object sender, RoutedEventArgs e)
        {
            if (sender is FrameworkElement frameworkElement && frameworkElement.DataContext is Category category)
            {
                var editWindow = new AddCategoryWindow(_categoryService, category);
                editWindow.ShowDialog();
                DataContext = new CategoryViewModel(_categoryService);
            }
        }

        
    }
}

