using H3ArT.DataAccess.Repository.IRepository;
using H3ArT.Models;
using H3ArT.Models.Models;
using H3ArT.Models.ViewModels;
using H3ArT.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.Mvc;
using Stripe.Checkout;
using System.Security.Claims;
using System.Text;

namespace H3ArTArtwork.Areas.Customer.Controllers
{
    [Area("Customer")]
    [Authorize(Roles = "Customer, Creator")]
    public class CartController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IEmailSender _emailSender;
        private readonly IConfiguration _config;
        [BindProperty]
        public ShoppingCartVM ShoppingCartVM { get; set; }
        public CartController(IUnitOfWork unitOfWork, IEmailSender emailSender, IConfiguration config)
        {
            _unitOfWork = unitOfWork;
            _emailSender = emailSender;
            _config = config;
        }
        public IActionResult Index()
        {
            //get the id
            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;

            ShoppingCartVM = new()
            {
                ShoppingCartList = _unitOfWork.ShoppingCartObj.GetAll(u => u.BuyerId == userId, includeProperties: "Artwork"),
                OrderHeader = new()
            };
            foreach (var cart in ShoppingCartVM.ShoppingCartList)
            {
                cart.Price = cart.Artwork.Price;
                ShoppingCartVM.OrderHeader.OrderTotal += cart.Price;
            }
            return View(ShoppingCartVM);
        }

        public IActionResult Remove(int cartId)
        {
            var cartFromDb = _unitOfWork.ShoppingCartObj.Get(u => u.ShoppingCartId == cartId, tracked: true);

            // Fetch the associated orderHeaderId using userId or any other relevant information
            var userId = cartFromDb.BuyerId;
            var orderHeader = _unitOfWork.OrderHeaderObj.Get(o => o.ApplicationUserId == userId && o.OrderStatus == SD.StatusPending);

            if (orderHeader != null)
            {
                // Remove associated OrderDetail record
                var orderDetail = _unitOfWork.OrderDetailObj.Get(od => od.ArtworkId == cartFromDb.ArtworkId && od.OrderHeaderId == orderHeader.Id);

                if (orderDetail != null)
                {
                    _unitOfWork.OrderDetailObj.Remove(orderDetail);
                }
            }

            _unitOfWork.ShoppingCartObj.Remove(cartFromDb);
            //Remove from session
            HttpContext.Session.SetInt32(SD.SessionCart, _unitOfWork.ShoppingCartObj.GetAll(u => u.BuyerId == cartFromDb.BuyerId).Count() - 1);
            _unitOfWork.Save();

            return RedirectToAction(nameof(Index));
        }

        public IActionResult Summary()
        {
            //get the id
            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;

            ShoppingCartVM = new()
            {
                ShoppingCartList = _unitOfWork.ShoppingCartObj.GetAll(u => u.BuyerId == userId, includeProperties: "Artwork"),
                OrderHeader = new()
            };
            ShoppingCartVM.OrderHeader.ApplicationUser = _unitOfWork.ApplicationUserObj.Get(u => u.Id == userId);

            ShoppingCartVM.OrderHeader.Name = ShoppingCartVM.OrderHeader.ApplicationUser.FullName;
            ShoppingCartVM.OrderHeader.PhoneNumber = ShoppingCartVM.OrderHeader.ApplicationUser.PhoneNumber;
            foreach (var cart in ShoppingCartVM.ShoppingCartList)
            {
                cart.Price = cart.Artwork.Price;
                ShoppingCartVM.OrderHeader.OrderTotal += cart.Price;
            }
            return View(ShoppingCartVM);
        }

        [HttpPost]
        [ActionName("Summary")]
        public IActionResult SummaryPOST()
        {
            //get the id
            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;

            //ShoppingCartVM will automatically be populated
            ShoppingCartVM.ShoppingCartList = _unitOfWork.ShoppingCartObj.GetAll(u => u.BuyerId == userId, includeProperties: "Artwork");
            ApplicationUser applicationUser = _unitOfWork.ApplicationUserObj.Get(u => u.Id == userId);

            ShoppingCartVM.OrderHeader.OrderDate = System.DateTime.Now;
            ShoppingCartVM.OrderHeader.ApplicationUserId = userId;

            List<string> purchasedArtworks = new List<string>();
            // set tong tien cho orderHeader
            foreach (var cart in ShoppingCartVM.ShoppingCartList)
            {
                cart.Price = cart.Artwork.Price;
                ShoppingCartVM.OrderHeader.OrderTotal += cart.Price;
                if (cart.Artwork.IsBought)
                {

                    purchasedArtworks.Add(cart.Artwork.Title);
                }
            }
            if (purchasedArtworks.Any())
            {
                // Add model error if multiple artworks are already bought
                ModelState.AddModelError("", $"The following artworks have already been purchased: {string.Join(", ", purchasedArtworks)}");
                return View(ShoppingCartVM);
            }

            if (!ModelState.IsValid)
            {
                // If model state is not valid, return the view with validation errors
                return View(ShoppingCartVM); // or any other suitable action result
            }
            // bam place order ma khong thanh toan => pending
            // lay ra nhung cai nay de tranh update 2 lan vao doan code o ben duoi
            var existingOrder = _unitOfWork.OrderHeaderObj.Get(o => o.ApplicationUserId == userId && o.PaymentStatus == SD.PaymentStatusPending);

            // neu ma no ton tai (!=null) => cap nhat lai nhung gia tri nhu la`
            //[orderDate],[orderTotal],[orderStatus],[paymentStatus],[paymentDate],[paymentIntentId],[name],[phoneNumber],[sessionId]
            // để mấy cái này không bị trùng lặp
            if (existingOrder != null)
            {
                // đây là cái đoạn cập nhật nè
                ShoppingCartVM.OrderHeader = existingOrder;
                _unitOfWork.OrderHeaderObj.Update(existingOrder);
                _unitOfWork.Save();
                // lấy ra cái new => nghĩa là cái mới thêm vào sau quá trình không thanh toán
                var newShoppingCartItems = ShoppingCartVM.ShoppingCartList.Where(cart => cart.IsNew);

                foreach (var cart in newShoppingCartItems)
                {
                    OrderDetail orderDetail = new OrderDetail
                    {
                        ArtworkId = cart.ArtworkId,
                        OrderHeaderId = existingOrder.Id,
                        Price = cart.Price,
                        Count = cart.Count
                    };

                    _unitOfWork.OrderDetailObj.Add(orderDetail);
                    cart.IsNew = false; // Reset isNew flag
                    _unitOfWork.ShoppingCartObj.Update(cart);
                }
            }
            else
            {
                //it is a regular customer account

                // đây là trường hợp tất cả sản phẩm trong giỏ hàng đều là mới và không có cái orderStatus là pending
                // => chạy như bình thường
                ShoppingCartVM.OrderHeader.PaymentStatus = SD.PaymentStatusPending;
                ShoppingCartVM.OrderHeader.OrderStatus = SD.StatusPending;

                _unitOfWork.OrderHeaderObj.Add(ShoppingCartVM.OrderHeader);
                _unitOfWork.Save();
                foreach (var cart in ShoppingCartVM.ShoppingCartList)
                {
                    OrderDetail orderDetail = new()
                    {
                        ArtworkId = cart.ArtworkId,
                        OrderHeaderId = ShoppingCartVM.OrderHeader.Id,
                        Price = cart.Price,
                        Count = cart.Count
                    };
                    _unitOfWork.OrderDetailObj.Add(orderDetail);
                    _unitOfWork.Save();
                    cart.IsNew = false; // Reset isNew flag
                    _unitOfWork.ShoppingCartObj.Update(cart);
                }
            }
            //stripe logic
            var domain = _config.GetValue<string>("Stripe:Domain"); ;
            var options = new SessionCreateOptions
            {
                SuccessUrl = domain + $"customer/cart/OrderConfirmation?id={ShoppingCartVM.OrderHeader.Id}",
                CancelUrl = domain + "customer/cart/index",
                LineItems = new List<SessionLineItemOptions>(),
                Mode = "payment",
            };
            foreach (var item in ShoppingCartVM.ShoppingCartList)
            {
                var sessionLineItem = new SessionLineItemOptions
                {
                    PriceData = new SessionLineItemPriceDataOptions

                    {
                        UnitAmount = (long)(item.Price * 100),
                        Currency = "usd",
                        ProductData = new SessionLineItemPriceDataProductDataOptions
                        {
                            Name = item.Artwork.Title
                        }
                    },
                    Quantity = item.Count
                };
                options.LineItems.Add(sessionLineItem);
            }
            var service = new SessionService();
            //create sessionId and paymentIntentId
            Session session = service.Create(options);
            _unitOfWork.OrderHeaderObj.UpdateStripePaymentId(ShoppingCartVM.OrderHeader.Id, session.Id, session.PaymentIntentId);
            _unitOfWork.Save();
            Response.Headers.Add("Location", session.Url);
            return new StatusCodeResult(303);
        }

        public async Task<IActionResult> OrderConfirmationAsync(int id)
        {
            OrderHeader orderHeader = _unitOfWork.OrderHeaderObj.Get(u => u.Id == id, includeProperties: "ApplicationUser");
            List<ShoppingCart> shoppingCarts = _unitOfWork.ShoppingCartObj.GetAll(u => u.BuyerId == orderHeader.ApplicationUserId, includeProperties: "Artwork").ToList();
            List<OrderDetail> orderDetail = _unitOfWork.OrderDetailObj.GetAll(u => u.OrderHeaderId == orderHeader.Id, includeProperties: "Artwork").ToList();
            //this is an order by customer
            var service = new SessionService();
            Session session = service.Get(orderHeader.SessionId);

            if (session.PaymentStatus.ToLower() == "paid")
            {
                _unitOfWork.OrderHeaderObj.UpdateStripePaymentId(id, session.Id, session.PaymentIntentId);
                _unitOfWork.OrderHeaderObj.UpdateStatus(id, SD.StatusApproved, SD.PaymentStatusApproved);
                _unitOfWork.Save();
                // Xây dựng HTML cho bảng
                StringBuilder tableHtml = new StringBuilder();
                tableHtml.Append("<table style=\"border-collapse: collapse; width: 100%;\">");
                tableHtml.Append("<tr><th style =\"border: 1px solid #ddd; padding: 8px;\">Title</th><th style=\"border: 1px solid #ddd; padding: 8px;\">Quantity</th><th style=\"border: 1px solid #ddd; padding: 8px;\">Price</th></tr>");
                foreach (var item in orderDetail)
                {
                    tableHtml.Append("<tr>");
                    tableHtml.Append($"<td style=\"border: 1px solid #ddd; padding: 8px;\">{item.Artwork.Title}</td>");
                    tableHtml.Append($"<td style=\"border: 1px solid #ddd; padding: 8px;text-align:center; \">{item.Count}</td>");
                    tableHtml.Append($"<td style=\"border: 1px solid #ddd; padding: 8px;text-align:center; \">{item.Price}$</td>");
                    tableHtml.Append("</tr>");
                }
                tableHtml.Append("</table>");
                string emailBody =
                    $"<p>Name: {orderHeader.Name}</p>" +
                    $"<p>Date: {orderHeader.PaymentDate}</p>" +
                    $"<p>Status Order: {orderHeader.OrderStatus}</p>" +
                    $"<p>Order Total: {orderHeader.OrderTotal}$</p>" +
                    $"<p>Please see the following table: </p>" +
                    $"<div>{tableHtml.ToString()}</div>";

                await _emailSender.SendEmailAsync(orderHeader.ApplicationUser.Email, "Your Order",
                       emailBody);
                foreach (var cartItem in shoppingCarts)
                {
                    cartItem.Artwork.IsBought = true;
                    _unitOfWork.ArtworkObj.Update(cartItem.Artwork);
                }
                _unitOfWork.Save();
            }


            shoppingCarts = _unitOfWork.ShoppingCartObj.GetAll(u => u.BuyerId == orderHeader.ApplicationUserId).ToList();
            _unitOfWork.ShoppingCartObj.RemoveRange(shoppingCarts);
            _unitOfWork.Save();
            return View(orderDetail);
        }

    }
}
