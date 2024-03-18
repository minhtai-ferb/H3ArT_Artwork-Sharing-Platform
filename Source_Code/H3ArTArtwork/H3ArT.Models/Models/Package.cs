using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace H3ArT.Models.Models
{
    public class Package
    {
        [Key]
        public int PackageId { get; set; }

        [Required]
        [RegularExpression(@"^[a-zA-Z0-9\s]*[a-zA-Z][a-zA-Z0-9\s]*$", ErrorMessage = "Package name can only contain letters and numbers, and must contain at least one letter.")]
        public string PackageName { get; set; }

        [Range(double.Epsilon, double.MaxValue, ErrorMessage = "Price must be greater than 0.")]
        public double Price { get; set; }

        [Range(double.Epsilon, double.MaxValue, ErrorMessage = "Amount artworks must be greater than 0.")]
        public int AmountPost { get; set; }

        [Required]
        [StringLength(int.MaxValue, MinimumLength = 71, ErrorMessage = "Description must be at least 70 characters.")]
        public string Description { get; set; }
        public string AdminID { get; set; }
    }
}
