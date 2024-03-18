using H3ArT.Models.Models;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace H3ArT.Models.ViewModels
{
    public class PackagePaymentVM
    {
        public int PackageId { get; set; }
        [ValidateNever]
        public ApplicationUser ApplicationUser { get; set; }
        [ValidateNever]
        public Package Package { get; set; }
        public OrderHeader OrderHeader { get; set; }
    }
}
