namespace Domain.Entities
{
    public class StockItem
    {
        public int ProductID { get; set; }
        public required string ProductName { get; set; }
        public string? Category { get; set; }
        public int StockQuantity { get; set; }
        public decimal RetailPrice { get; set; }
        public required string StockStatus { get; set; }
        public DateTime LastUpdated { get; set; }
    }

}
