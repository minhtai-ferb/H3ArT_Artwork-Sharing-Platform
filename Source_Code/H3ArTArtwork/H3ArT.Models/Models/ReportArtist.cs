using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using Microsoft.Extensions.Primitives;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace H3ArT.Models.Models
{
    public class ReportArtist
    {
        [Key]
        public int ReportArtistId { get; set; }

        public string ArtistId { get; set; }
        [ForeignKey("ArtistId")]
        [ValidateNever]
        public ApplicationUser Artist { get; set; }

        public string ReporterUserId { get; set; }
        [ForeignKey("ReporterUserId")]
        [ValidateNever]
        public ApplicationUser Reporter { get; set; }
        public string? Reason { get; set; }
    }
}
