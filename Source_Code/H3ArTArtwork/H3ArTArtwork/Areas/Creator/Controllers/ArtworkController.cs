using H3ArT.DataAccess.Repository.IRepository;
using H3ArT.Models;
using H3ArT.Models.Models;
using H3ArT.Models.ViewModels;
using H3ArT.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Reflection.Metadata;
using System.Security.Claims;

namespace H3ArTArtwork.Areas.Creator.Controllers
{
    [Area("Creator")]
    // [Authorize(Roles = SD.Role_Creator)]
    public class ArtworkController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IWebHostEnvironment _webHostEnvironment;
        public ArtworkController(IUnitOfWork unitOfWork, IWebHostEnvironment webHostEnvironment)
        {
            _unitOfWork = unitOfWork;
            _webHostEnvironment = webHostEnvironment;
        }

        [Authorize(Roles = SD.Role_Creator + "," + SD.Role_Admin)]
        public IActionResult Index()
        {
            //get the id

            return View();
        }

        [Authorize(Roles = SD.Role_Creator)]
        public IActionResult Upsert(int? id)
        {

            ArtworkVM artworkVM = new()
            {
                CategoryList = _unitOfWork.CategoryObj.GetAll().Select(u => new SelectListItem
                {
                    Text = u.CategoryName,
                    Value = u.CategoryId.ToString(),
                }),
                Artwork = new Artwork()
            };

            if (id == null || id == 0)
            {
                //create
                var claimsIdentity = (ClaimsIdentity)User.Identity;
                var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;
                ApplicationUser applicationUser = _unitOfWork.ApplicationUserObj.Get(u => u.Id == userId);

                if (applicationUser.AvaiblePost <= 0 || applicationUser.AvaiblePost == null)
                {
                    TempData["error"] = "You do not have enough posting credits to place an order. Please purchase a package to continue.";
                    return RedirectToAction("Index", "Artwork");
                }

                artworkVM.Artwork.ArtistId = userId;
                artworkVM.Artwork.ApplicationUser = _unitOfWork.ApplicationUserObj.Get(u => u.Id == userId);
                artworkVM.Artwork.ApplicationUser.AvaiblePost -= 1;
                return View(artworkVM);
            }
            else
            {
                //update
                artworkVM.Artwork = _unitOfWork.ArtworkObj.Get(u => u.ArtworkId == id, includeProperties: "Category,ApplicationUser");
                return View(artworkVM);
            }
        }
        [HttpPost]
        [Authorize(Roles = SD.Role_Creator)]
        public IActionResult Upsert(ArtworkVM artworkVM, IFormFile? file)
        {
            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;

            try
            {
                if (ModelState.IsValid)
                {
                    string wwwRootPath = _webHostEnvironment.WebRootPath;

                    if (file != null)
                    {
                        // Check if the file is a JPG file
                        if (!file.FileName.EndsWith(".jpg", StringComparison.OrdinalIgnoreCase))
                        {
                            TempData["error"] = "Only JPG files are allowed.";
                            // Redirect to the Upsert(int? id) action
                            return RedirectToAction("Upsert", new { id = artworkVM.Artwork.ArtworkId });
                        }

                        string fileName = Guid.NewGuid().ToString() + ".jpg"; // Ensure the extension is always .jpg
                        string productPath = Path.Combine(wwwRootPath, @"image\artwork");

                        if (!string.IsNullOrEmpty(artworkVM.Artwork.ImageUrl))
                        {
                            // Delete the old image
                            var oldImagePath = Path.Combine(wwwRootPath, artworkVM.Artwork.ImageUrl.TrimStart('\\'));

                            if (System.IO.File.Exists(oldImagePath))
                            {
                                System.IO.File.Delete(oldImagePath);
                            }
                        }
                        using (var fileStream = new FileStream(Path.Combine(productPath, fileName), FileMode.Create))
                        {
                            file.CopyTo(fileStream);
                        }

                        artworkVM.Artwork.ImageUrl = @"\image\artwork\" + fileName;
                    }

                    if (artworkVM.Artwork.ArtworkId == 0)
                    {
                        if (file == null)
                        {
                            TempData["error"] = "Image is required";
                            return RedirectToAction("Upsert", new { id = artworkVM.Artwork.ArtworkId });
                        }
                        // Add product
                        ApplicationUser applicationUser = _unitOfWork.ApplicationUserObj.Get(u => u.Id == userId);

                        if (applicationUser.AvaiblePost <= 0 || applicationUser.AvaiblePost == null)
                        {
                            TempData["error"] = "You do not have enough posting credits to place an order. Please purchase a package to continue.";
                            return RedirectToAction("Index", "Artwork");
                        }

                        // if user had pay for package
                        artworkVM.Artwork.CreateAt = DateTime.Now;
                        artworkVM.Artwork.ReportedConfirm = false;
                        _unitOfWork.ArtworkObj.Add(artworkVM.Artwork);
                        _unitOfWork.Save();

                        applicationUser.AvaiblePost -= 1;
                        _unitOfWork.ApplicationUserObj.Update(applicationUser);
                        _unitOfWork.Save();

                        //artworkVM.Artwork.ArtistId = userId;
                        //var unknownUser = artworkVM.Artwork.ApplicationUser;

                        //_unitOfWork.ArtworkObj.Update(artworkVM.Artwork);
                        //_unitOfWork.ApplicationUserObj.Remove(unknownUser);
                        //_unitOfWork.Save();
                        TempData["success"] = "Artwork created successfully";
                    }
                    else
                    {
                        // Update product
                        _unitOfWork.ArtworkObj.Update(artworkVM.Artwork);
                        _unitOfWork.Save();
                        TempData["success"] = "Artwork updated successfully";
                    }
                    return RedirectToAction("Index", "Artwork");
                }
                else
                {
                    artworkVM.CategoryList = _unitOfWork.CategoryObj.GetAll().Select(u => new SelectListItem
                    {
                        Text = u.CategoryName,
                        Value = u.CategoryId.ToString(),
                    });

                    artworkVM.Artwork.ApplicationUser = _unitOfWork.ApplicationUserObj.Get(u => u.Id == userId);
                    return View(artworkVM);
                }
            }
            catch (Exception ex)
            {
                // Log the exception or handle it appropriately
                TempData["error"] = $"An error occurred: {ex.Message}";
                return RedirectToAction("Index", "Artwork");
            }
        }
        #region API CALLS
        [HttpGet]
        public IActionResult GetAll()
        {
            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;
            var user = _unitOfWork.ApplicationUserObj.Get(u => u.Id == userId);
            List<Artwork> artworkList;
            if (User.IsInRole(SD.Role_Admin))
            {
                artworkList = _unitOfWork.ArtworkObj.GetAll(includeProperties: "Category,ApplicationUser").ToList();
                return Json(new { data = artworkList });
            }
            artworkList = _unitOfWork.ArtworkObj.GetAll(u => u.ArtistId == userId, includeProperties: "Category,ApplicationUser").ToList();

            return Json(new { data = artworkList });
        }
        public IActionResult Delete(int? id)
        {
            try
            {
                var productToBeDeleted = _unitOfWork.ArtworkObj.Get(u => u.ArtworkId == id);
                if (productToBeDeleted == null)
                {
                    return Json(new { success = false, message = "Error: Artwork not found" });
                }

                // Check if there are any order details associated with this artwork
                bool hasOrderDetails = _unitOfWork.OrderDetailObj.GetAll(od => od.ArtworkId == id).Any();
                if (hasOrderDetails)
                {
                    // Set error message in TempData
                    TempData["error"] = "Cannot delete artwork with associated orders";
                    return Json(new { success = false, message = "Cannot delete artwork with associated orders" });
                }

                if (!string.IsNullOrEmpty(productToBeDeleted.ImageUrl))
                {
                    var oldImagePath = Path.Combine(_webHostEnvironment.WebRootPath, productToBeDeleted.ImageUrl.TrimStart('\\'));
                    if (System.IO.File.Exists(oldImagePath))
                    {
                        System.IO.File.Delete(oldImagePath);
                    }
                }

                _unitOfWork.ArtworkObj.Remove(productToBeDeleted);
                _unitOfWork.Save();

                var claimsIdentity = (ClaimsIdentity)User.Identity;
                var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;
                List<Artwork> listArtwork = _unitOfWork.ArtworkObj.GetAll(u => u.ArtistId == userId, includeProperties: "Category,ApplicationUser").ToList();

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