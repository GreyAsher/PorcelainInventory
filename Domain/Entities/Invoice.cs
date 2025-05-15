using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entities
{
    public class Invoice
    {
        public int InvoiceID { get; set; }
        public int? CustomerID { get; set; } // Add this property
        [ForeignKey("CustomerID")]
        public virtual Customer? Customer { get; set; }
        public decimal TotalAmount { get; set; }
        public List<InvoiceItem> InvoiceItems { get; set; } = new List<InvoiceItem>();
        public DateTime DateIssued { get; set; }
    }

    public class InvoiceItem
    {
        public int InvoiceItemID { get; set; }
        public int InvoiceID { get; set; }
        public required string ProductName { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
       
    }
}
