using H3ArT.DataAccess.Repository.IRepository;
using H3ArT.Models.Models;
using H3ArT.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace H3ArTArtwork.Areas.Moderator.Controllers
{
    [Area("Moderator")]
    [Authorize(Roles = SD.Role_Moderator)]
    public class ReportController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IWebHostEnvironment _webHostEnvironment;
        public ReportController(IUnitOfWork unitOfWork, IWebHostEnvironment webHostEnvironment)
        {
            _unitOfWork = unitOfWork;
            _webHostEnvironment = webHostEnvironment;
        }
        public IActionResult Index_Artwork()
        {

            return View();
        }

        public IActionResult Index_Creator()
        {
            return View();
        }

        public IActionResult Index_Blog()
        {
            return View();
        }
        #region API CALLS
        [HttpGet]
        public IActionResult GetAllReportArtwork()
        {
            List<ReportArtwork> reportArtworks = _unitOfWork.ReportArtworkObj.GetAll(
                includeProperties: "Artwork,ApplicationUser"
            ).ToList();
            return Json(new { data = reportArtworks });
        }

        [HttpDelete]
        public IActionResult Delete_Artwork(int? id)
        {
            var productToBeDeleted = _unitOfWork.ArtworkObj.Get(u => u.ArtworkId == id);
            if (productToBeDeleted == null)
            {
                return Json(new { success = false, message = "Error during deleting" });
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

            List<Artwork> listProduct = _unitOfWork.ArtworkObj.GetAll(includeProperties: "Category,ApplicationUser").ToList();
            return Json(new { success = true, message = "Delete Successful" });
        }

        [HttpGet]
        public IActionResult GetAllReportArtist()
        {
            List<ReportArtist> reportArtist = _unitOfWork.ReportArtistObj.GetAll(includeProperties: "Artist,Reporter").ToList();
            return Json(new { data = reportArtist });
        }

        [HttpGet]
        public IActionResult GetAllReportBlog()
        {
            List<ReportBlog> reportBlogs = _unitOfWork.ReportBlogObj.GetAll(
                includeProperties: "Blog,ApplicationUser"
            ).ToList();
            return Json(new { data = reportBlogs });
        }

        [HttpPost]
        public IActionResult Hide([FromBody] int id)
        {
           
            var artwork = _unitOfWork.ArtworkObj.Get(u => u.ArtworkId == id);

           
            if (artwork != null)
            {
                
                artwork.ReportedConfirm = !artwork.ReportedConfirm;
                
                try
                {
                   
                    _unitOfWork.ArtworkObj.Update(artwork);
                    _unitOfWork.Save();

                  
                    return Json(new { success = true, message = "Update Successful" });
                }
                catch (Exception ex)
                {
                    
                    return Json(new { success = false, message = $"Error occurred: {ex.Message}" });
                }
            }
            else
            {
                // Trả về lỗi nếu không tìm thấy artwork
                return Json(new { success = false, message = "Artwork not found" });
            }
        }

        [HttpDelete]
        public IActionResult Delete(int? id)
        {
            var blogToBeDeleted = _unitOfWork.BlogObj.Get(u => u.BlogId == id);
            IEnumerable<ReportBlog> reportBlogList = _unitOfWork.ReportBlogObj.GetAll(u => u.BlogId == id);
            if (blogToBeDeleted == null)
            {
                return Json(new { success = false, message = "Error during deleting" });
            }

            if (!string.IsNullOrEmpty(blogToBeDeleted.ImageUrl))
            {
                var oldImagePath = Path.Combine(_webHostEnvironment.WebRootPath, blogToBeDeleted.ImageUrl.TrimStart('\\'));
                if (System.IO.File.Exists(oldImagePath))
                {
                    System.IO.File.Delete(oldImagePath);
                }
            }

            _unitOfWork.ReportBlogObj.RemoveRange(reportBlogList);
            _unitOfWork.BlogObj.Remove(blogToBeDeleted);
            _unitOfWork.Save();

            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;

            List<Blog> blogList = _unitOfWork.BlogObj.GetAll(u => u.CreatorId == userId, includeProperties: "ApplicationUser").ToList();
            return Json(new { success = true, message = "Delete Successful" });
        }
        #endregion

    }

}