using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entities
{
    public class Category
    {
        [Key]
        public int CategoryID { get; set; } // Primary Key

        [Required]
        [MaxLength(100)]
        public string CategoryName { get; set; } = string.Empty;

        //public string? Description { get; set; }

        // Navigation Property for Products
        public virtual ICollection<Product> Products { get; set; } = new List<Product>();
    }
}
