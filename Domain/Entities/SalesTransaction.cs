using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entities
{
    public class SalesTransaction
    {
        [Key]
        public int ID { get; set; }
        public required string TransactionID { get; set; }
        public required int ProductID { get; set; }
        public required string ProductName { get; set; }
        public int QuantitySold { get; set; }
        public decimal TotalPrice { get; set; }
        public string? CustomerName { get; set; }
        public DateTime DatePurchased { get; set; }

        // ✅ Navigation Property
        [ForeignKey("ProductID")]
        public Product Product { get; set; } = null!;
    }
}
