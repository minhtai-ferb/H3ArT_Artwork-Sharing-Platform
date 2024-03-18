using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace H3ArT.Models.Models
{
    public class Blog
    {
        [Key]
        public int BlogId { get; set; }

        public string CreatorId { get; set; }
        [ForeignKey("CreatorId")]
        [ValidateNever]
        public ApplicationUser ApplicationUser { get; set; }

        public string Title { get; set; }

        [Required]
        /*[MinLength(100, ErrorMessage = "Description must be at least 100 characters long.")]*/
        [StringLength(int.MaxValue, MinimumLength = 107, ErrorMessage = "Description must be at least 100 characters long.")]
        public string Description { get; set; }

        public DateTime CreatedAt { get; set; }

        [ValidateNever]
        public string ImageUrl { get; set; }
    }
}
