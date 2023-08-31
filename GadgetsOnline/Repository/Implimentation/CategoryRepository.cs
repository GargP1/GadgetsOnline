using GadgetsOnline.Models;
using GadgetsOnline.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GadgetsOnline.Repository.Implimentation
{
    public class CategoryRepository : ICategoryRepository
    {
        GadgetsOnlineEntities store = new GadgetsOnlineEntities();
        public DataResult<bool> Add(Category entity)
        {
            if (store.Categories.Where(c => c.Name == entity.Name).ToList().Any())
                return InvalidRequest("Category Name Already  Present");

            store.Categories.Add(entity);
            var result = store.SaveChanges();

            return  new DataResult<bool>
            {
                Completed = true,
                Data = result != -1,
                Reason = result != -1 ? "Failed to add the category":"Successfully added the category"
            };
        }

        public DataResult<bool> Delete(int id)
        {
            throw new NotImplementedException();
        }

        public DataResult<List<Category>> Filter(string search)
        {
            throw new NotImplementedException();
        }

        public DataResult<Category> Get(int id)
        {
            return new DataResult<Category>
            {
                Completed = true,
                Data = store.Categories.FirstOrDefault(c => c.CategoryId == id)
            };
        }

        public DataResult<List<Category>> GetAll()
        {
            return new DataResult<List<Category>>
            {
                Completed = true,
                Data = store.Categories.ToList()
            };
        }

        public DataResult<bool> Update(Category entity)
        {
            var existingCategory = store.Categories.FirstOrDefault(c => c.CategoryId == entity.CategoryId);

            if (existingCategory == null || existingCategory.CategoryId <= 0)
                return InvalidRequest("Category not found");

            var result = store.SaveChanges();

            return new DataResult<bool>
            {
                Completed = true,
                Data = result != -1,
                Reason = result != -1 ? "Failed to update the category" : "Successfully update the category"
            };
        }

        private static DataResult<bool> InvalidRequest(string message)
        {
            return new DataResult<bool>
            {
                Completed = false,
                Data = false,
                Reason = message
            };
        }
    }
}