using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace H3ArT.Models.Models
{
    public class Artwork
    {
        [Key]
        public int ArtworkId { get; set; }

        [RegularExpression(@"^[a-zA-Z0-9\s]*[a-zA-Z][a-zA-Z0-9\s]*$", ErrorMessage = "Title can only contain letters and numbers, and must contain at least one letter.")]
        [MaxLength(100)]
        public string Title { get; set; }

        [Required(ErrorMessage = "Description is required.")]

        //[MinLength(70, ErrorMessage = "Description must be at least 70 characters.")]
        [StringLength(int.MaxValue, MinimumLength = 77, ErrorMessage = "Description must be at least 70 characters.")]

        public string Description { get; set; }

        public string ArtistId { get; set; }
        [ForeignKey("ArtistId")]
        [ValidateNever]
        public ApplicationUser ApplicationUser { get; set; }

        public string? ImageUrl { get; set; }

        [Required(ErrorMessage = "Price is required.")]
        [RegularExpression(@"^\d*\.?\d+$", ErrorMessage = "Price must be a valid number.")]
        [Range(0.01, double.MaxValue, ErrorMessage = "Price must be greater than 0.")]
        public double Price { get; set; }

        [Required(ErrorMessage = "Premium status is required.")]
        public bool IsPremium { get; set; }

        public int CategoryId { get; set; }
        [ForeignKey("CategoryId")]
        [ValidateNever]
        public Category Category { get; set; }

        public bool IsBought { get; set; }

        public bool ReportedConfirm { get; set; }

        public DateTime? CreateAt { get; set; }
    }
}
