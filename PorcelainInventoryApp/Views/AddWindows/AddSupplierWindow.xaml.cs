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
using System.Windows.Shapes;
using AppService.Interfaces;
using AppService.Services;
using Domain.Entities;
using PorcelainInventoryApp.Views.AddWindows;

namespace PorcelainInventoryApp.Views.AddWindows
{
    /// <summary>
    /// Interaction logic for AddSupplierWindow.xaml
    /// </summary>
    public partial class AddSupplierWindow : Window
    {
        private readonly ISupplierService _supplierService;
        private readonly Supplier _supplierToEdit;
        private readonly bool _isEditMode;
        public AddSupplierWindow(ISupplierService supplierService, Supplier? supplier)
        {
            InitializeComponent();
            _supplierService = supplierService;
            if(supplier != null)
            {
                _supplierToEdit = supplier;
                _isEditMode = true;
                txtTitle.Text = _isEditMode ? "Edit Supplier" : "Add Supplier";
                txtSupplierName.Text = _supplierToEdit.SupplierName;
                txtContactNumber.Text = _supplierToEdit.ContactNumber;
                txtAddress.Text = _supplierToEdit.Address;
            }
            
        }
        private async void SaveSupplier_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtSupplierName.Text))
            {
                MessageBox.Show("Supplier Name is required.");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtContactNumber.Text))
            {
                MessageBox.Show("Contact Number is required.");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtAddress.Text))
            {
                MessageBox.Show("Address is required.");
                return;
            }
            try
            {
                // Fetch all suppliers to check for duplicates
                var allSuppliers = await _supplierService.GetAllSuppliersAsync();

                // Check for duplicates
                bool isDuplicate = allSuppliers.Any(s =>
                    s.SupplierName.Equals(txtSupplierName.Text, StringComparison.OrdinalIgnoreCase) &&
                    s.ContactNumber.Equals(txtContactNumber.Text, StringComparison.OrdinalIgnoreCase) &&
                    (!_isEditMode || s.SupplierID != _supplierToEdit.SupplierID)); // Exclude the current supplier in edit mode

                if (isDuplicate)
                {
                    MessageBox.Show("A supplier with the same name and contact number already exists.", "Duplicate Entry", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                if (_isEditMode)
                {
                    _supplierToEdit.SupplierName = txtSupplierName.Text;
                    _supplierToEdit.ContactNumber = txtContactNumber.Text;
                    _supplierToEdit.Address = txtAddress.Text;
                    await _supplierService.UpdateSupplierAsync(_supplierToEdit);
                    MessageBox.Show("Supplier updated successfully!");
                }
                else
                {
                    var newSupplier = new Supplier
                    {
                        SupplierName = txtSupplierName.Text,
                        Address = txtAddress.Text,
                        ContactNumber = txtContactNumber.Text,
                    };
                    await _supplierService.AddSupplierAsync(newSupplier);
                    MessageBox.Show("Supplier added successfully!", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                this.DialogResult = true;
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error adding supplier: " + ex.Message);
            }
        }
        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = false;
            this.Close();
        }
    }
}


