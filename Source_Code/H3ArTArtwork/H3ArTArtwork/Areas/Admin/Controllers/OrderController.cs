using H3ArT.DataAccess.Repository.IRepository;
using H3ArT.Models;
using H3ArT.Models.Models;
using H3ArT.Models.ViewModels;
using H3ArT.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Stripe;
using System.Collections.Generic;
using System.Security.Claims;

namespace H3ArTArtwork.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize]

    public class OrderController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        [BindProperty]
        public OrderVM OrderVM { get; set; }
        public OrderController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [Authorize(Roles = SD.Role_Creator + "," + SD.Role_Customer + "," + SD.Role_Admin)]
        public IActionResult Index()
        {
            return View();
        }
        [Authorize(Roles = SD.Role_Creator + "," + SD.Role_Customer + "," + SD.Role_Admin)]
        public IActionResult Details(int orderId)
        {
            OrderVM = new()
            {
                OrderHeader = _unitOfWork.OrderHeaderObj.Get(u => u.Id == orderId, includeProperties: "ApplicationUser"),
                OrderDetails = _unitOfWork.OrderDetailObj.GetAll(u => u.OrderHeaderId == orderId, includeProperties: "Artwork")
            };

            return View(OrderVM);
        }
        [HttpPost]
        [Authorize(Roles = SD.Role_Admin)]
        public IActionResult UpdateOrderDetail()
        {
            var orderHeaderFromDb = _unitOfWork.OrderHeaderObj.Get(u => u.Id == OrderVM.OrderHeader.Id);
            orderHeaderFromDb.Name = OrderVM.OrderHeader.Name;
            orderHeaderFromDb.PhoneNumber = OrderVM.OrderHeader.PhoneNumber;

            _unitOfWork.OrderHeaderObj.Update(orderHeaderFromDb);
            _unitOfWork.Save();

            TempData["Success"] = "Order Details Updated Successfully";

            return RedirectToAction(nameof(Details), new { orderId = orderHeaderFromDb.Id });
        }

        [HttpPost]
        [Authorize(Roles = SD.Role_Admin)]
        public IActionResult StartProcessing()
        {
            _unitOfWork.OrderHeaderObj.UpdateStatus(OrderVM.OrderHeader.Id, SD.StatusInProcess);
            _unitOfWork.Save();
            TempData["Success"] = "Order Details Updated Sucessfully";
            return RedirectToAction(nameof(Details), new { orderId = OrderVM.OrderHeader.Id });

        }

        [HttpPost]
        [Authorize(Roles = SD.Role_Admin)]
        public IActionResult DoneOrder()
        {
            var orderHeaderFromDb = _unitOfWork.OrderHeaderObj.Get(u => u.Id == OrderVM.OrderHeader.Id);
            orderHeaderFromDb.OrderStatus = SD.StatusDone;

            if(orderHeaderFromDb.IsPackageOrder == true)
            {
                // get information of user buy the package
                var userID = orderHeaderFromDb.ApplicationUserId;
                var applicationUser = _unitOfWork.ApplicationUserObj.Get(u => u.Id == userID);

                // get the package information
                var orderDetailPackage = _unitOfWork.OrderDetailPackageObj.Get(u => u.orderHeaderId == orderHeaderFromDb.Id);
                var package = _unitOfWork.PackageObj.Get(u => u.PackageId == orderDetailPackage.packageId);

                // update amountPost for user
                applicationUser.AvaiblePost = package.AmountPost;
                _unitOfWork.ApplicationUserObj.Update(applicationUser);
                _unitOfWork.Save();
            }

            _unitOfWork.OrderHeaderObj.Update(orderHeaderFromDb);
            _unitOfWork.Save();
            TempData["Success"] = "Order Shipped Sucessfully";
            return RedirectToAction(nameof(Details), new { orderId = OrderVM.OrderHeader.Id });

        }


        [HttpPost]
        [Authorize(Roles = SD.Role_Admin + "," + SD.Role_Creator + "," + SD.Role_Customer)]
        public IActionResult CancelOrder()
        {
            var orderHeaderFromDb = _unitOfWork.OrderHeaderObj.Get(u => u.Id == OrderVM.OrderHeader.Id);


            if (orderHeaderFromDb.PaymentStatus == SD.PaymentStatusApproved)
            {
                if (User.IsInRole(SD.Role_Admin))
                {
                    var options = new RefundCreateOptions
                    {
                        Reason = RefundReasons.RequestedByCustomer,
                        PaymentIntent = orderHeaderFromDb.PaymentIntentId
                    };
                    var service = new RefundService();
                    Refund refund = service.Create(options);

                    _unitOfWork.OrderHeaderObj.UpdateStatus(orderHeaderFromDb.Id, SD.StatusCancelled, SD.StatusRefunded);
                    _unitOfWork.Save();
                }
                else
                {
                    TempData["error"] = "You cannot cancel the approved order";
                    return RedirectToAction(nameof(Details), new { orderId = orderHeaderFromDb.Id });
                }
            }

            else
            {
                _unitOfWork.OrderHeaderObj.UpdateStatus(orderHeaderFromDb.Id, SD.StatusCancelled, SD.StatusCancelled);
                _unitOfWork.Save();
            }

            var orderDetails = _unitOfWork.OrderDetailObj.GetAll(u => u.OrderHeaderId == orderHeaderFromDb.Id, includeProperties: "Artwork");

            // Set the isBought property of artwork to false for all items in this order
            foreach (var orderDetail in orderDetails)
            {
                // Fetch the associated artwork for this order detail

                // Update the isBought property to false
                orderDetail.Artwork.IsBought = false;
                _unitOfWork.ArtworkObj.Update(orderDetail.Artwork);

            }
            _unitOfWork.Save();
            TempData["Success"] = "Order Cancelled Sucessfully";
            return RedirectToAction(nameof(Details), new { orderId = OrderVM.OrderHeader.Id });
        }

        #region API CALLS
        [HttpGet]
        public IActionResult GetAll(string status)
        {
            IEnumerable<OrderHeader> orderHeaderList;

            if (User.IsInRole(SD.Role_Admin))
            {
                orderHeaderList = _unitOfWork.OrderHeaderObj.GetAll(includeProperties: "ApplicationUser").ToList();
            }
            else
            {
                //get the id
                var claimsIdentity = (ClaimsIdentity)User.Identity;
                var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;

                orderHeaderList = _unitOfWork.OrderHeaderObj.GetAll(u => u.ApplicationUserId == userId, includeProperties: "ApplicationUser");
            }
            switch (status)
            {
                //STATUS FILTER
                case "pending":
                    orderHeaderList = orderHeaderList.Where(u => u.PaymentStatus == SD.PaymentStatusPending);
                    break;
                case "inprocess":
                    orderHeaderList = orderHeaderList.Where(u => u.OrderStatus == SD.StatusInProcess);
                    break;
                case "completed":
                    orderHeaderList = orderHeaderList.Where(u => u.OrderStatus == SD.StatusDone);
                    break;
                case "approved":
                    orderHeaderList = orderHeaderList.Where(u => u.OrderStatus == SD.StatusApproved);
                    break;
                default:
                    break;
            }
            return Json(new { data = orderHeaderList });
        }

        #endregion
    }


}