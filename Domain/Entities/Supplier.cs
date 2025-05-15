using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entities
{
    public class Supplier
    {
        public int SupplierID { get; set; }
        public required string SupplierName { get; set; }
        public required string ContactNumber { get; set; }
        public required string Address { get; set; }

        // Navigation Property
        //public List<Product> SuppliedProducts { get; set; } = new List<Product>();
    }
}
