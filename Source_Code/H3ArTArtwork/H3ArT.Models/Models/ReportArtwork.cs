using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace H3ArT.Models.Models
{
    public class ReportArtwork
    {
        [Key]
        public int ReportArtworkId { get; set; }

        public int ArtworkId { get; set; }
        [ForeignKey("ArtworkId")]
        [ValidateNever]
        public Artwork Artwork { get; set; }

        public string ReporterUserId { get; set; }
        [ForeignKey("ReporterUserId")]
        [ValidateNever]
        public ApplicationUser ApplicationUser { get; set; }
        public string? Reason { get; set; }
    }
}
