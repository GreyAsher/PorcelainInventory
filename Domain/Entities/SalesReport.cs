using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entities
{
    public class SalesReport
    {
        public int Id { get; set; }  // Ensure this is INT in the database
        public required string InvoiceNumber { get; set; }  // Should be NVARCHAR in DB
        public string? CustomerName { get; set; }   // Should be NVARCHAR in DB
        public decimal TotalAmount { get; set; }   // Should be DECIMAL in DB
        public DateTime SaleDate { get; set; }     // Should be DATETIME in DB
        public required string Status { get; set; }         // Should be NVARCHAR in DB
    }

}
