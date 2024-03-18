using H3ArT.DataAccess.Repository.IRepository;
using H3ArT.Models;
using H3ArT.Models.Models;
using H3ArT.Models.ViewModels;
using H3ArT.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Stripe.Checkout;
using System.Security.Claims;

namespace H3ArTArtwork.Areas.Creator.Controllers
{
    [Area("Creator")]
    [Authorize(Roles = "Creator")]
    public class UpgradeController : Controller
    {
        [BindProperty]
        public PackagePaymentVM PackagePaymentVM { get; set; }
        private readonly IUnitOfWork _unitOfWork;
        private readonly IConfiguration _config;
        public UpgradeController(IUnitOfWork unitOfWork, IConfiguration config)
        {
            _unitOfWork = unitOfWork;
            _config = config;
        }

        public IActionResult Index()
        {
            IEnumerable<Package> packageList = _unitOfWork.PackageObj.GetAll();
            return View(packageList);
        }

        public IActionResult SummaryPackage(int packageId)
        {
            // Retrieve the ApplicationUser using the user's ID
            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;
            ApplicationUser applicationUser = _unitOfWork.ApplicationUserObj.Get(u => u.Id == userId);

            PackagePaymentVM = new()
            {
                PackageId = packageId,
                OrderHeader = new()
                // Package = _unitOfWork.PackageObj.Get(u => u.packageID == packageId), // , includeProperties: "artwork"
            };

            Package package = _unitOfWork.PackageObj.Get(u => u.PackageId == packageId);
            PackagePaymentVM.OrderHeader.OrderTotal = package.Price;
            PackagePaymentVM.Package = _unitOfWork.PackageObj.Get(u => u.PackageId == packageId);
            PackagePaymentVM.ApplicationUser = applicationUser;

            return View(PackagePaymentVM);
        }

        [HttpPost]
        [ActionName("SummaryPackage")]
        public IActionResult SummaryPackagePOST()
        {
            // Retrieve the ApplicationUser using the user's ID
            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;
            ApplicationUser applicationUser = _unitOfWork.ApplicationUserObj.Get(u => u.Id == userId);

            // Check to see if the user has RUN OUT OF POSTS or has NEVER SIGNED UP FOR A PACKAGE to post
            if (applicationUser.AvaiblePost <= 0 || applicationUser.AvaiblePost == null)
            {
                // PackagePaymentVM will automatically be populated
                // Retrieve the selected package
                var packageId = PackagePaymentVM.PackageId;
                PackagePaymentVM.Package = _unitOfWork.PackageObj.Get(u => u.PackageId == packageId);
                Package package = PackagePaymentVM.Package;

                // Set value for  order header 
                PackagePaymentVM.OrderHeader.OrderDate = System.DateTime.Now;
                PackagePaymentVM.OrderHeader.ApplicationUserId = userId;
                PackagePaymentVM.OrderHeader.OrderTotal = package.Price;
                PackagePaymentVM.OrderHeader.IsPackageOrder = true;

                if (!ModelState.IsValid)
                {
                    // If model state is NOT valid, return the view with validation errors
                    return View(PackagePaymentVM); // or any other suitable action result
                }

                // Set payment status and order status
                PackagePaymentVM.OrderHeader.PaymentStatus = SD.PaymentStatusPending;
                PackagePaymentVM.OrderHeader.OrderStatus = SD.StatusPending;

                _unitOfWork.OrderHeaderObj.Add(PackagePaymentVM.OrderHeader);
                _unitOfWork.Save();

                // Add order detail package to the database
                OrderDetailPackage orderDetailPackage = new OrderDetailPackage
                {
                    orderHeaderId = PackagePaymentVM.OrderHeader.Id,
                    packageId = package.PackageId,
                    price = package.Price
                };
                _unitOfWork.OrderDetailPackageObj.Add(orderDetailPackage);
                _unitOfWork.Save();

                // Set up Stripe payment logic
                
                var domain = _config.GetValue<string>("Stripe:Domain");
                var options = new SessionCreateOptions
                {
                    SuccessUrl = domain + $"creator/upgrade/PackageOrderConfirmation?id={PackagePaymentVM.OrderHeader.Id}&packageID={PackagePaymentVM.PackageId}",
                    CancelUrl = domain + "customer/cart/index",
                    LineItems = new List<SessionLineItemOptions>(),
                    Mode = "payment",
                };
                if (PackagePaymentVM.OrderHeader.IsPackageOrder == true)
                {
                    options = new SessionCreateOptions
                    {
                        SuccessUrl = domain + $"creator/upgrade/PackageOrderConfirmation?id={PackagePaymentVM.OrderHeader.Id}&packageID={PackagePaymentVM.PackageId}",
                        CancelUrl = domain + "creator/upgrade/index",
                        LineItems = new List<SessionLineItemOptions>(),
                        Mode = "payment",
                    };
                }
                var packageItem = PackagePaymentVM.Package;
                var sessionLineItem = new SessionLineItemOptions
                {
                    PriceData = new SessionLineItemPriceDataOptions
                    {
                        UnitAmount = (long)(packageItem.Price * 100),
                        Currency = "usd",
                        ProductData = new SessionLineItemPriceDataProductDataOptions
                        {
                            Name = packageItem.PackageName
                        }
                    },
                    Quantity = 1
                };
                options.LineItems.Add(sessionLineItem);

                // Create Stripe session
                var service = new SessionService();
                Session session = service.Create(options);

                // Update order header with Stripe payment ID
                _unitOfWork.OrderHeaderObj.UpdateStripePaymentId(PackagePaymentVM.OrderHeader.Id, session.Id, session.PaymentIntentId);
                _unitOfWork.Save();

                // Redirect to Stripe payment URL
                Response.Headers.Add("Location", session.Url);
                return new StatusCodeResult(303);
            }

            // If the user has available posts, return the view
            return View(PackagePaymentVM);
        }

        public IActionResult PackageOrderConfirmation(int id, int packageID)
        {
            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;

            // Retrieve the ApplicationUser using the user's ID
            ApplicationUser applicationUser = _unitOfWork.ApplicationUserObj.Get(u => u.Id == userId);

            // Retrieve the package details and order header
            Package package = _unitOfWork.PackageObj.Get(u => u.PackageId == packageID);
            OrderHeader orderHeader = _unitOfWork.OrderHeaderObj.Get(u => u.Id == id, includeProperties: "ApplicationUser");

            // Check the payment status of the session associated with the order
            var service = new SessionService();
            Session session = service.Get(orderHeader.SessionId);

            // If the payment status is "paid", update the order status to approved
            if (session.PaymentStatus.ToLower() == "paid")
            {
                _unitOfWork.OrderHeaderObj.UpdateStripePaymentId(id, session.Id, session.PaymentIntentId);
                _unitOfWork.OrderHeaderObj.UpdateStatus(id, SD.StatusApproved, SD.PaymentStatusApproved);
                _unitOfWork.Save();
            }

            return View(package);
        }

        // Test function
        public IActionResult Reset()
        {
            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;
            ApplicationUser applicationUser = _unitOfWork.ApplicationUserObj.Get(u => u.Id == userId);
            applicationUser.AvaiblePost = 0;
            _unitOfWork.ApplicationUserObj.Update(applicationUser);
            _unitOfWork.Save();
            IEnumerable<Package> packageList = _unitOfWork.PackageObj.GetAll();
            return RedirectToAction("Index");
        }
    }
}
