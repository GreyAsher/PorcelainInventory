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
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using AppService.Interfaces;
using Domain.Entities;
using PorcelainInventoryApp.Views.AddWindows;
using static Azure.Core.HttpHeader;

namespace PorcelainInventoryApp.Views.AddWindows
{
    /// <summary>
    /// Interaction logic for AddCategoryWindow.xaml
    /// </summary>
    public partial class AddCategoryWindow : Window
    {
        private readonly ICategoryService _categoryService;
        private readonly Category _categoryToEdit;
        private readonly bool _isEditMode;

        public AddCategoryWindow(ICategoryService categoryService, Category? category)
        {
            InitializeComponent();
            _categoryService = categoryService;
            if (category != null)
            {
                _isEditMode = true;
                _categoryToEdit = category;
                txtCategoryTitle.Text = _isEditMode ? "Edit Category" : "Add Category";
                btnSave.Content = "Update";
                txtCategoryName.Text = category.CategoryName;
               
            }

            btnCancel.Click += (s, e) => this.Close();
        }

        private async void SaveCategory_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtCategoryName.Text))
            {
                MessageBox.Show("Category Name is required.");
                return;
            }

            try
            {
                // Check for duplicate category names
                var existingCategories = await _categoryService.GetAllCategoriesAsync();
                bool isDuplicate = existingCategories.Any(c =>
                    c.CategoryName.Equals(txtCategoryName.Text, StringComparison.OrdinalIgnoreCase) &&
                    (!_isEditMode || c.CategoryID != _categoryToEdit.CategoryID)); // Exclude the current category in edit mode

                if (isDuplicate)
                    {
                        MessageBox.Show("A category with the same name already exists.", "Duplicate Category", MessageBoxButton.OK, MessageBoxImage.Warning);
                        return;
                    }

                if (_isEditMode)
                {
                    _categoryToEdit.CategoryName = txtCategoryName.Text;
                   
                    await _categoryService.UpdateCategoryAsync(_categoryToEdit);
                    MessageBox.Show("Category updated successfully!", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                else
                {

                    var newCategory = new Category
                    {
                        CategoryName = txtCategoryName.Text,
                       
                    };

                    await _categoryService.AddCategoryAsync(newCategory);
                    MessageBox.Show("Category added successfully!", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                this.DialogResult = true;

                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            // Close the window without saving changes
            DialogResult = false; // Indicate that the operation was canceled
            Close();
        }

    }
}
