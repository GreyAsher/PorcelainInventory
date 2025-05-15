using System.IO;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Imaging;
using AppService.Interfaces;
using Domain.Entities;
using Microsoft.Win32;

namespace PorcelainInventoryApp.Views.AddWindows
{
    /// <summary>
    /// Interaction logic for AddProductWindow.xaml
    /// </summary>
    public partial class AddProductWindow : Window
    {
        private readonly IProductService _productService;
        private readonly ICategoryService _categoryService;
        private Product selectedProduct;
        private readonly bool _isEditMode;
        private readonly Product _productToEdit;
        private Product _product;
        private byte[]? productImageBytes;

        public AddProductWindow(IProductService productService, ICategoryService categoryService, Product? product = null)
        {
            InitializeComponent();
           
            _productService = productService;
            _categoryService = categoryService;
            _product = product ?? new Product { ProductName = string.Empty };
            Loaded += CategoryManagementControl_Loaded;

            if (product != null)
            {
                _isEditMode = true;
                txtTitle.Text = _isEditMode ? "Edit Product" : "Add Product";
                _productToEdit = product;
                PopulateFields();
            }
        }

        private void PopulateFields()
        {
            txtProductName.Text = _product.ProductName;
           // txtOriginalPrice.Text = _product.OriginalPrice.ToString();
            txtRetailPrice.Text = _product.RetailPrice.ToString();
            cbCategory.SelectedItem = _product.Category;
            //imageProduct.Source = _product.ProductImage != null ? ConvertByteArrayToImage(_product.ProductImage) : null;

            /*if (_product.CategoryID != null)
            {
                cbCategory.SelectedItem = cbCategory.Items
                    .Cast<Category>()
                    .FirstOrDefault(c => c.CategoryID == _product.CategoryID);
            }*/
        }

        public AddProductWindow(IProductService productService, Product selectedProduct)
        {
            _productService = productService;
            this.selectedProduct = selectedProduct ?? throw new ArgumentNullException(nameof(selectedProduct));
        }

        private async void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtProductName.Text) ||
                //string.IsNullOrWhiteSpace(txtOriginalPrice.Text) ||
                string.IsNullOrWhiteSpace(txtRetailPrice.Text) ||
                cbCategory.SelectedItem == null)
            {
                MessageBox.Show("Please fill in all fields!", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            try
            {
                if (_isEditMode)
                {
                    // Updating existing product
                    _productToEdit.ProductName = txtProductName.Text;
                    //_productToEdit.OriginalPrice = decimal.Parse(txtOriginalPrice.Text);
                    _productToEdit.RetailPrice = decimal.Parse(txtRetailPrice.Text);

                    // Get selected category
                    var selectedCategory = cbCategory.SelectedItem as Category;
                    if (selectedCategory != null)
                    {
                        _productToEdit.CategoryID = selectedCategory.CategoryID;
                    }

                    // Convert image to byte array if available
                    if (imageProduct.Source != null)
                    {
                        _productToEdit.ProductImage = ConvertImageToByteArray(imageProduct.Source as BitmapImage);
                    }

                    await _productService.UpdateProductAsync(_productToEdit);
                    MessageBox.Show("Product updated successfully!", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                else
                {
                    // Creating new product
                    var newProduct = new Product
                    {
                        ProductName = txtProductName.Text,
                      //  OriginalPrice = decimal.Parse(txtOriginalPrice.Text),
                        RetailPrice = decimal.Parse(txtRetailPrice.Text),
                        StockQuantity = 0,
                        CategoryID = (cbCategory.SelectedItem as Category)?.CategoryID ?? 0
                    };

                    // Convert image if available
                    if (imageProduct.Source != null)
                    {
                        newProduct.ProductImage = ConvertImageToByteArray(imageProduct.Source as BitmapImage);
                    }

                    await _productService.AddProductAsync(newProduct);
                    MessageBox.Show("Product added successfully!", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                }

                DialogResult = true;
                Close();

            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }


        private byte[] ConvertImageToByteArray(BitmapImage bitmapImage)
        {
            if (bitmapImage == null)
                return null;

            using (MemoryStream stream = new MemoryStream())
            {
                BitmapEncoder encoder = new PngBitmapEncoder(); // Use PNG for lossless quality
                encoder.Frames.Add(BitmapFrame.Create(bitmapImage));
                encoder.Save(stream);
                return stream.ToArray();
            }
        }



        private byte[] ConvertImageToByteArray(string imagePath)
        {
            if (File.Exists(imagePath))
            {
                return File.ReadAllBytes(imagePath);
            }
            return null;
        }

        private void UploadImage_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog
            {
                Filter = "Image Files|*.jpg;*.jpeg;*.png;*.bmp;*.gif",
                Title = "Select a Product Image"
            };

            if (openFileDialog.ShowDialog() == true)
            {
                string selectedImagePath = openFileDialog.FileName;
                imageProduct.Source = new BitmapImage(new Uri(selectedImagePath)); // Display image
                productImageBytes = ConvertImageToByteArray(selectedImagePath); // Convert and store
            }
        }

        private async void CategoryManagementControl_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                await LoadCategories();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error");
            }
        }

        private async Task LoadCategories()
        {
            IEnumerable<Category> categories = await _categoryService.GetAllCategoriesAsync();
            cbCategory.ItemsSource = categories;
            cbCategory.DisplayMemberPath = "CategoryName"; // Set the property to display
        }
        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            // Close the window without saving changes
            DialogResult = false; // Indicate that the operation was canceled
            Close();
        }


        private void txtStockQuantity_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void txtProductName_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}




    