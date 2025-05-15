using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Input;
using AppService.Interfaces;
using Domain.Entities;
using MvvmHelpers;

namespace PorcelainInventoryApp.ViewModels
{
    public class CategoryViewModel : BaseViewModel
    {
        private readonly ICategoryService _categoryService;

        public ObservableCollection<Category> Categories { get; set; }

        public ICommand RefreshCommand { get; }
        public ICommand EditCommand { get; }
        //public ICommand DeleteCommand { get; }

        public CategoryViewModel(ICategoryService categoryService)
        {
            _categoryService = categoryService;
            Categories = new ObservableCollection<Category>();
            RefreshCommand = new RelayCommand(async () => await LoadCategories());
          //  EditCommand = new RelayCommand<Category>(async (category) => await EditCategory(category));
          //  DeleteCommand = new RelayCommand<Category>(async (category) => await DeleteCategory(category));

            _ = LoadCategories();
        }

        public async Task LoadCategories()
        {
            try
            {
                Categories.Clear();
                var categoryList = await _categoryService.GetAllCategoriesAsync();
                foreach (var category in categoryList)
                {
                    Categories.Add(category);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error loading categories: " + ex.Message);
            }
        }

    /*    public async Task AddCategory(Category category)
        {
            if (category == null) return;

            try
            {
                await _categoryService.AddCategoryAsync(category);

                // Add new category to the ObservableCollection so UI updates immediately
                Application.Current.Dispatcher.Invoke(() =>
                {
                    Categories.Add(category);
                });
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error adding category: " + ex.Message);
            }
        }
*/

        private async Task EditCategory(Category category)
        {

            await _categoryService.UpdateCategoryAsync(category);
            await LoadCategories();
        }

        public async Task DeleteCategory(Category category)
        {
            if (category == null) return;

            try
            {
                await _categoryService.DeleteCategoryAsync(category.CategoryID);

                // Remove the category from the ObservableCollection so UI updates immediately
                Application.Current.Dispatcher.Invoke(() =>
                {
                    Categories.Remove(category);
                });
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error deleting category: " + ex.Message);
            }
        }
    }
}



