using System;
using AppService.Interfaces;
using AppService.Interfaces.Repository;
using Domain.Entities;

namespace AppService.Services
{
    public class ProductService : IProductService
    {
        private readonly IProductRepository _productRepository;
        public ProductService(IProductRepository productRepository)
        {
            _productRepository = productRepository;
        }

        public async Task<IEnumerable<Product>> GetAllProductsAsync()
        {
            return await _productRepository.GetAllProductsAsync();
        }

        public async Task<Product> GetProductByIdAsync(int productId)
        {
            return await _productRepository.GetByIdAsync(productId);
        }

        public async Task<IEnumerable<Product>> GetProductsByCategoryAsync(int categoryId, string categoryName)
        {
            return await _productRepository.GetProductsByCategoryAsync(categoryId, categoryName);
        }

        public async Task AddProductAsync(Product product)
        {
            await _productRepository.AddProductAsync(product);
        }
        public async Task DeleteProductAsync(object id)
        {
            await _productRepository.DeleteProductAsync(id);
        }

        public async Task UpdateProductAsync(Product product)
        {
            await _productRepository.UpdateProductAsync(product);
        }
    }
}

