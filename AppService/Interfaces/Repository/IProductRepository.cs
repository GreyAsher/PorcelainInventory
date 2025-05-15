using Domain.Entities;

namespace AppService.Interfaces.Repository
{
    public interface IProductRepository
    {
        Task<IEnumerable<Product>> GetAllProductsAsync();

        Task<Product> GetByIdAsync(int productId);
        Task<IEnumerable<Product>> GetProductsByCategoryAsync(int categoryId, string categoryName);
        Task AddProductAsync(Product product);
        Task DeleteProductAsync(object id);
        Task UpdateProductAsync(Product product);
    }
}
