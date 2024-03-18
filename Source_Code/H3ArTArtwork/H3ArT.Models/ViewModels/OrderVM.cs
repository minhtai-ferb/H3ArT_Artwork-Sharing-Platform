using H3ArT.Models.Models;
using System.Collections.Generic;

namespace H3ArT.Models.ViewModels
{
    public class OrderVM
    {
        public OrderHeader OrderHeader { get; set; }
        public IEnumerable<OrderDetail> OrderDetails { get; set; }
    }
}
