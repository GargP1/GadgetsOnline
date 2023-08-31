using GadgetsOnline.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GadgetsOnline.Repository.Interfaces
{
    public interface ICategoryRepository
    {
        DataResult<List<Category>> GetAll();
        DataResult<Category> Get(int id);
        DataResult<List<Category>>Filter(string search);
        DataResult<bool> Add(Category entity);
        DataResult<bool> Update(Category entity);
        DataResult<bool> Delete(int id);
    }
}
