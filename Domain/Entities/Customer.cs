using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entities
{
    public class Customer
    {
        public int CustomerID { get; set; }
        public string? FullName { get; set; }
        public string? ContactNumber { get; set; }
        public string? Email { get; set; }
       // public string? Address { get; set; }

        // Navigation Property
        //public List<Sale> Sales { get; set; } = new List<Sale>();
    }
}
