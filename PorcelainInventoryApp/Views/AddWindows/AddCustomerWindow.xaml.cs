using System.Windows;
using AppService.Interfaces;
using Domain.Entities;

namespace PorcelainInventoryApp.Views.AddWindows
{
    /// <summary>
    /// Interaction logic for AddCustomerWindow.xaml
    /// </summary>
    public partial class AddCustomerWindow : Window
    {
        private readonly ICustomerService _customerService;
        private readonly Customer _customerToEdit;
        private readonly bool _isEditMode;
        public AddCustomerWindow(ICustomerService customerService, Customer? customer)
        {
            InitializeComponent();
            _customerService = customerService;
            if(customer != null)
            {
                _customerToEdit = customer;
                _isEditMode = true;
                txtTitle.Text = "Edit Customer";
                DataContext = _customerToEdit;
                txtFullName.Text = _customerToEdit.FullName;
                txtContactNumber.Text = _customerToEdit.ContactNumber;
                txtEmail.Text = _customerToEdit.Email;
               // txtAddress.Text = _customerToEdit.Address;
            }
        }

        private async void SaveCustomer_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtFullName.Text))
            {
                MessageBox.Show("Full Name is required.");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtContactNumber.Text))
            {
                MessageBox.Show("Contact Number is required.");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                MessageBox.Show("Email is required.");
                return;
            }
            /*if (string.IsNullOrWhiteSpace(txtAddress.Text))
            {
                MessageBox.Show("Address is required.");
                return;
            }*/
            try
            {
                if (_isEditMode)
                {
                    _customerToEdit.FullName = txtFullName.Text;
                    _customerToEdit.ContactNumber = txtContactNumber.Text;
                    _customerToEdit.Email = txtEmail.Text;
                   // _customerToEdit.Address = txtAddress.Text;
                    await _customerService.UpdateCustomerAsync(_customerToEdit);
                    MessageBox.Show("Customer updated successfully!", "Updated", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                else
                {
                    // Check for duplicate customer
                    bool customerExists = await _customerService.CustomerExistsAsync(txtFullName.Text);
                    if (customerExists)
                    {
                        MessageBox.Show("A customer with the same name already exists.", "Duplicate Customer", MessageBoxButton.OK, MessageBoxImage.Warning);
                        return;
                    }

                    Customer customer = new Customer
                    {
                        FullName = txtFullName.Text,
                        ContactNumber = txtContactNumber.Text,
                        Email = txtEmail.Text,
                       // Address = txtAddress.Text
                    };
                    await _customerService.AddCustomerAsync(customer);
                    MessageBox.Show("Customer added successfully!", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                this.DialogResult = true;
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error saving customer: " + ex.Message);
            }
        }
        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = false;
            this.Close();
        }
    }
}
