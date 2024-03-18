using H3ArT.DataAccess.Repository.IRepository;
using H3ArT.Models;
using H3ArT.Models.Models;
using H3ArT.Models.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Linq;
using System.Security.Claims;

namespace H3ArTArtwork.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class PackageController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        public PackageController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Upsert(int? packageID)
        {
            Package package = new Package();
            if (packageID == null || packageID == 0)
            {
                //create
                var claimsIdentity = (ClaimsIdentity)User.Identity;
                var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;

                package.AdminID = userId;
                // artworkVM.artwork.applicationUser = _unitOfWork.ApplicationUserObj.Get(u => u.Id == userId);
                return View(package);
            }
            else
            {
                //update
                package = _unitOfWork.PackageObj.Get(u => u.PackageId == packageID);
                return View(package);
            }
        }

        [HttpPost]
        public IActionResult Upsert(Package package)
        {
            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;

            try
            {
                if (ModelState.IsValid)
                {
                    if (package.PackageId == 0)
                    {
                        // Add product
                        _unitOfWork.PackageObj.Add(package);
                        _unitOfWork.Save();
                        package.AdminID = userId;
                        _unitOfWork.PackageObj.Update(package);
                        _unitOfWork.Save();

                        TempData["success"] = "Package created successfully";
                    }
                    else
                    {
                        if (string.IsNullOrWhiteSpace(package.Description))
                        {
                            ModelState.AddModelError("Description", "Description is required.");
                            return View(package); // Trả về view để hiển thị thông báo lỗi
                        }
                        // Update product
                        _unitOfWork.PackageObj.Update(package);

                        _unitOfWork.Save();

                        TempData["success"] = "Package updated successfully";
                    }
                    return RedirectToAction("Index", "Package");

                }
                else
                {
                    package = _unitOfWork.PackageObj.GetAll().FirstOrDefault();
                    return View(package);
                }
            }
            catch (Exception ex)
            {
                // Log the exception or handle it appropriately
                TempData["error"] = $"An error occurred: {ex.Message}";
                return RedirectToAction("Index", "Package");
            }
        }

        #region API CALLS

        [HttpGet]
        public IActionResult GetAll()
        {
            List<Package> listPackage = _unitOfWork.PackageObj.GetAll().ToList();


            return Json(new { data = listPackage });
        }

        public IActionResult Delete(int? id)
        {
            try
            {
                var packageToBeDeleted = _unitOfWork.PackageObj.Get(u => u.PackageId == id);
                if (packageToBeDeleted == null)
                {
                    return Json(new { success = false, message = "Error: Package not found" });
                }

                _unitOfWork.PackageObj.Remove(packageToBeDeleted);
                _unitOfWork.Save();

                List<Package> listPackage = _unitOfWork.PackageObj.GetAll().ToList();

                // Set success message in TempData
                TempData["success"] = "Delete Successful";

                return Json(new { success = true, message = "Delete Successful" });
            }
            catch (Exception ex)
            {
                // Log the exception for debugging purposes
                Console.WriteLine(ex.Message);
                return Json(new { success = false, message = "An error occurred while deleting the artwork" });
            }
        }

        #endregion

    }
}
