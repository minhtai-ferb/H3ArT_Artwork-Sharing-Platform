using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace H3ArT.Models.Models
{
    public class OrderDetailPackage
    {
        public int Id { get; set; }

        public int orderHeaderId { get; set; }
        [ForeignKey("orderHeaderId")]
        [ValidateNever]
        public OrderHeader orderHeader { get; set; }

        [Required]
        public int packageId { get; set; }
        [ForeignKey("packageId")]
        [ValidateNever]
        public Package package { get; set; }

        //not updated
        public double price { get; set; }
    }
}
