using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using Microsoft.Extensions.Primitives;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace H3ArT.Models.Models
{
    public class ReportBlog
    {
        [Key]
        public int ReportBlogId { get; set; }

        public int BlogId { get; set; }

        [ForeignKey("BlogId")]
        [ValidateNever]
        public Blog Blog { get; set; }

        public string ReporterUserId { get; set; }
        [ForeignKey("ReporterUserId")]
        [ValidateNever]
        public ApplicationUser ApplicationUser { get; set; }
        public string? Reason { get; set; }
    }
}
