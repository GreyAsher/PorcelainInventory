using System.Windows;
using AppService.Interfaces;
using AppService.Services;
using Domain.Entities;

namespace PorcelainInventoryApp.Views.AddWindows
{
    public partial class AddStockWindow : Window
    {
        private int _quantity = 0;
        private readonly Product _product;
        private readonly IProductService _productService;

        public AddStockWindow(string productName, Product product, IProductService productService)
        {

            InitializeComponent();
            _product = product;
            _productService = productService;
            txtProductName.Text = productName; // Set the prod
            UpdateQuantityDisplay();
        }

        private void IncrementQuantity_Click(object sender, RoutedEventArgs e)
        {
            _quantity++;
            UpdateQuantityDisplay();
        }

        private void DecrementQuantity_Click(object sender, RoutedEventArgs e)
        {
            if (_quantity > 0)
            {
                _quantity--;
            }
            UpdateQuantityDisplay();
        }

        private void UpdateQuantityDisplay()
        {
            txtQuantityToAdd.Text = _quantity.ToString();
        }

        private async void UpdateButton_Click(object sender, RoutedEventArgs e)
        {
            if (_quantity > 0)
            {
                // Update the product's stock quantity
                _product.StockQuantity += _quantity;
                _product.DateUpdated = DateTime.Now;

                try
                {
                    // Persist the changes using the product service
                    await _productService.UpdateProductAsync(_product);
                    MessageBox.Show("Stock updated successfully!", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                    this.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error updating stock: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                MessageBox.Show("Please add a valid quantity before updating.", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = false;
            this.Close();
        }   
    }
}
