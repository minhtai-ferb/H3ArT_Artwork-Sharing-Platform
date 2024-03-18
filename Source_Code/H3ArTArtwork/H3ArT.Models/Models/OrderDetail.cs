using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace H3ArT.Models.Models
{
    public class OrderDetail
    {
        public int Id { get; set; }

        public int OrderHeaderId { get; set; }
        [ForeignKey("OrderHeaderId")]
        [ValidateNever]
        public OrderHeader OrderHeader { get; set; }

        [Required]
        public int ArtworkId { get; set; }
        [ForeignKey("ArtworkId")]
        [ValidateNever]
        public Artwork Artwork { get; set; }

        public int Count { get; set; }

        public double Price { get; set; }
    }
}
