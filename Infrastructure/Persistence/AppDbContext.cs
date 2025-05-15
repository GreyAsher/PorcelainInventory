using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Persistence
{
    public class AppDbContext : DbContext
    {
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Supplier> Suppliers { get; set; }
        public DbSet<SalesReport> SalesReports { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Invoice> Invoices { get; set; }
        public DbSet<InvoiceItem> InvoiceItems { get; set; }
        public DbSet<SalesTransaction> SalesTransactions { get; set; }

        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        public AppDbContext()
        {
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                var dbPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "porcelain.db");
                optionsBuilder.UseSqlite($"Data Source={dbPath}",
                    b => b.MigrationsAssembly("Infrastructure"));
            }
        }




        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Product>()
                .HasOne(p => p.Category)
                .WithMany(c => c.Products)
                .HasForeignKey(p => p.CategoryID);

            modelBuilder.Entity<SalesTransaction>()
               .HasOne(st => st.Product)  // SalesTransaction has one Product
               .WithMany()  // No need to track SalesTransactions in Product
               .HasForeignKey(st => st.ProductID)
               .OnDelete(DeleteBehavior.Restrict); // Prevent accidental deletion

            modelBuilder.Entity<Invoice>()
            .HasMany(i => i.InvoiceItems)
            .WithOne()
            .HasForeignKey(ii => ii.InvoiceID)
            .OnDelete(DeleteBehavior.Cascade); // Ensure cascading delete if nee

            base.OnModelCreating(modelBuilder);

        }
    }
}
