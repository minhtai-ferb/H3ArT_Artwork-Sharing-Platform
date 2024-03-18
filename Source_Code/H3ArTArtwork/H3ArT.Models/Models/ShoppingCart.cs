using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace H3ArT.Models.Models
{
    public class ShoppingCart
    {
        [Key]
        public int ShoppingCartId { get; set; }

        public string BuyerId { get; set; }
        [ForeignKey("BuyerId")]
        [ValidateNever]
        public ApplicationUser ApplicationUser { get; set; }

        public string ArtistId { get; set; }

        public int ArtworkId { get; set; }

        [ForeignKey("ArtworkId")]
        [ValidateNever]
        public Artwork Artwork { get; set; }

        [NotMapped]
        public IEnumerable<Artwork> RelatedArtworks { get; set; }

        public int Count { get; set; }

        [NotMapped]
        public double Price { get; set; }

        public bool IsNew { get; set; }
    }
}
