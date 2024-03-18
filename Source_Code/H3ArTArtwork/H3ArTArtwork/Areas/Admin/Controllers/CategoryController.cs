using H3ArT.DataAccess.Repository.IRepository;
using Microsoft.AspNetCore.Mvc;
using H3ArT.Models.Models;
using System.Collections.Generic;
using Microsoft.AspNetCore.Authorization;
using H3ArT.Utility;

namespace H3ArTArtwork.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = SD.Role_Admin)]
    public class CategoryController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        public CategoryController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public IActionResult Index()
        {
            //Select *
            List<Category> listCategory = _unitOfWork.CategoryObj.GetAll().ToList();
            return View(listCategory);
        }
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Category category)
        {

            //ModelState.IsValid means it will go straight to the product Model to check validation
            if (ModelState.IsValid)
            {
                //add product
                _unitOfWork.CategoryObj.Add(category);
                //save it
                _unitOfWork.Save();
                //Syntax: RedirectToAction("action", "controller")
                TempData["success"] = "Category created successfully";
                return RedirectToAction("Index", "Category");

            }
            return View();
        }

        public IActionResult Edit(int? id)
        {
            if (id == null || id == null)
            {
                return NotFound();
            }
            Category? categoryFromDb = _unitOfWork.CategoryObj.Get(u => u.CategoryId == id);
            if (categoryFromDb == null)
            {
                return NotFound();
            }
            return View(categoryFromDb);
        }

        [HttpPost]
        //Edit base on ID
        public IActionResult Edit(Category category)
        {
            if (ModelState.IsValid)
            {
                //update product
                _unitOfWork.CategoryObj.Update(category);
                //save it
                _unitOfWork.Save();
                //Syntax: RedirectToAction("action", "controller")
                TempData["success"] = "Category edited successfully";

                return RedirectToAction("Index", "Category");
            }
            return View();
        }

        public IActionResult Delete(int? id)
        {

            if (id == null || id == 0)
            {
                return NotFound();
            }
            Category? categoryFromDB = _unitOfWork.CategoryObj.Get(u => u.CategoryId == id);


            if (categoryFromDB == null)
            {
                return NotFound();
            }
            return View(categoryFromDB);
        }

        [HttpPost, ActionName("Delete")]
        //Edit base on ID
        public IActionResult DeletePOST(int? id)
        {
            Category? category = _unitOfWork.CategoryObj.Get(u => u.CategoryId == id);
            if (category == null)
            {
                return NotFound();
            }
            if (ModelState.IsValid)
            {
                _unitOfWork.CategoryObj.Remove(category);
                //save it
                _unitOfWork.Save();
                //Syntax: RedirectToAction("action", "controller")
                TempData["success"] = "Category deleted successfully";

                return RedirectToAction("Index", "Category");
                //update product
            }
            return View();
        }
    }
}