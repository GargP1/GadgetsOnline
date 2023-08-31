using GadgetsOnline.Models;
using GadgetsOnline.Repository.Implimentation;
using GadgetsOnline.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using Microsoft.AspNetCore.Mvc;

namespace GadgetsOnline.Api
{
    [ApiController]
    [Route("api/Category")]
    public class CategoryController : ControllerBase
    {
        private ICategoryRepository _categoryRepository;
        public CategoryController()
        {
            _categoryRepository = new CategoryRepository();
        }

        [Route("Category/All")]
        public IActionResult GetAll()
        {
            return Ok(_categoryRepository.GetAll());
        }

        // GET api/<controller>/5
        public IActionResult Get(int id)
        {
            return Ok(_categoryRepository.Get(id));
            ;
        }

        // POST api/<controller>
        public IActionResult Post([FromBody] Category category)
        {
            if (category == null || category.CategoryId <= 0)
                return BadRequest("Invalid Parameter");
            return Ok(_categoryRepository.Update(category));
        }

        // PUT api/<controller>/5
        public IActionResult Put([FromBody] Category category)
        {
            if (category == null)
                return BadRequest("Invalid Parameter");
            return Ok(_categoryRepository.Add(category));
        }

        // DELETE api/<controller>/5
        public IActionResult Delete(int id)
        {
            return Ok(_categoryRepository.Delete(id));
        }
    }
}