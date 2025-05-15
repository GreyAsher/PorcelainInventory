using System;
using System.Collections.Generic;
using System.Globalization;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using Domain.Entities;

namespace PorcelainInventoryApp.Views.ViewWindows
{
    public partial class InvoiceInfoWindow : Window
    {
        public InvoiceInfoWindow(Invoice invoice)
        {
            InitializeComponent();
            LoadInvoiceData(invoice);
        }

        private void LoadInvoiceData(Invoice invoice)
        {
            // Set customer name
            txtCustomerName.Text = invoice.Customer?.FullName ?? "Unknown";

            // Set date purchased
            txtDatePurchased.Text = invoice.DateIssued.ToString("g"); // Format as general date/time

            // Set product list
            dgInvoiceProducts.ItemsSource = invoice.InvoiceItems;

            // Set total amount
            txtTotalAmount.Text = invoice.TotalAmount.ToString("C", new CultureInfo("fil-PH")); // Format as currency
        }

        private void PrintButton_Click(object sender, RoutedEventArgs e)
        {
            // Create a PrintDialog
            PrintDialog printDialog = new PrintDialog();

            // Check if the user selected a printer and clicked "Print"
            if (printDialog.ShowDialog() == true)
            {
                // Create a FlowDocument to format the content for printing
                FlowDocument document = new FlowDocument();
                document.PagePadding = new Thickness(50);
                document.ColumnWidth = printDialog.PrintableAreaWidth;

                // Add header
                document.Blocks.Add(new Paragraph(new Run("Invoice Receipt"))
                {
                    FontSize = 24,
                    FontWeight = FontWeights.Bold,
                    TextAlignment = TextAlignment.Center
                });

                // Add customer info
                document.Blocks.Add(new Paragraph(new Run($"Customer Name: {txtCustomerName.Text}")));
                document.Blocks.Add(new Paragraph(new Run($"Date Purchased: {txtDatePurchased.Text}")));

                // Add product list
                Table productTable = new Table();
                productTable.Columns.Add(new TableColumn { Width = new GridLength(200) });
                productTable.Columns.Add(new TableColumn { Width = new GridLength(100) });
                productTable.Columns.Add(new TableColumn { Width = new GridLength(100) });

                // Add table header
                TableRowGroup headerGroup = new TableRowGroup();
                TableRow headerRow = new TableRow();
                headerRow.Cells.Add(new TableCell(new Paragraph(new Run("Product Name")) { FontWeight = FontWeights.Bold }));
                headerRow.Cells.Add(new TableCell(new Paragraph(new Run("Quantity")) { FontWeight = FontWeights.Bold }));
                headerRow.Cells.Add(new TableCell(new Paragraph(new Run("Price")) { FontWeight = FontWeights.Bold }));
                headerGroup.Rows.Add(headerRow);
                productTable.RowGroups.Add(headerGroup);


                // Add product rows
                foreach (var item in dgInvoiceProducts.Items)
                {
                    if (item is InvoiceItem product)
                    {
                        TableRow row = new TableRow();
                        row.Cells.Add(new TableCell(new Paragraph(new Run(product.ProductName))));
                        row.Cells.Add(new TableCell(new Paragraph(new Run(product.Quantity.ToString()))));
                        row.Cells.Add(new TableCell(new Paragraph(new Run(product.Price.ToString("C")))));
                        headerGroup.Rows.Add(row);
                    }
                }


                document.Blocks.Add(productTable);

                // Add total amount
                document.Blocks.Add(new Paragraph(new Run($"Total Amount: {txtTotalAmount.Text}"))
                {
                    FontSize = 16,
                    FontWeight = FontWeights.Bold,
                    TextAlignment = TextAlignment.Right
                });

                // Print the FlowDocument
                IDocumentPaginatorSource paginator = document;
                printDialog.PrintDocument(paginator.DocumentPaginator, "Invoice Receipt");
            }
        }
    }
}
