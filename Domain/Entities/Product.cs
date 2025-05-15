using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;

namespace Domain.Entities
{
    public class Product : INotifyPropertyChanged
    {
        private int _quantity;

        [Key]
        public int ProductID { get; set; } // Primary Key

        [Required]
        [MaxLength(100)]
        public string ProductName { get; set; } = string.Empty;

        /*[Required]
        [Column(TypeName = "decimal(18,2)")]
        public decimal? OriginalPrice { get; set; }*/

        [Required]
        [Column(TypeName = "decimal(18,2)")]
        public decimal RetailPrice { get; set; }
        
        [Required]
        public int StockQuantity { get; set; }

        // Add this just after StockQuantity or wherever it makes sense in your layout
        [NotMapped]
        public string StockStatus => StockQuantity > 0 ? "In Stock" : "Out of Stock";


        // ✅ Ensure Quantity is included
        public int Quantity
        {
            get => _quantity;
            set
            {
                if (_quantity != value)
                {
                    _quantity = value;
                    OnPropertyChanged(nameof(Quantity)); // Notify UI when Quantity changes
                }
            }
        }

        public decimal Price => RetailPrice; // Ensure binding works

        // New DateAdded field - marks the creation date of the product
        [Required]
        public DateTime DateAdded { get; set; } = DateTime.Now;

        [Required]
        public DateTime DateUpdated { get; set; } = DateTime.Now;


        // New DateUpdated field - marks when the product was last updated
        // public DateTime DateUpdated { get; set; } = DateTime.Now;

        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        // Image stored as byte array
        public byte[]? ProductImage { get; set; }

        // Foreign Key to Category
        public int? CategoryID { get; set; }

        // Navigation Property to get Category Name
        [ForeignKey("CategoryID")]
        public virtual Category? Category { get; set; }

    }
}
