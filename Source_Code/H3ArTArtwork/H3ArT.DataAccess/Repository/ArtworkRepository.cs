using H3ArT.DataAccess.Data;
using H3ArT.DataAccess.Repository.IRepository;
using H3ArT.Models.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace H3ArT.DataAccess.Repository
{
    public class ArtworkRepository : Repository<Artwork>, IArtworkRepository
    {
        private readonly ApplicationDbContext _db;
        public ArtworkRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }
        public void Update(Artwork artwork)
        {
            var artworkFromDb = _db.TblArtwork.FirstOrDefault(u => u.ArtworkId == artwork.ArtworkId);
            if (artworkFromDb != null)
            {
                artworkFromDb.Title = artwork.Title;
                artworkFromDb.ArtistId = artwork.ArtistId;
                artworkFromDb.Price = artwork.Price;
                artworkFromDb.Description = artwork.Description;
                artworkFromDb.IsPremium = artwork.IsPremium;
                artworkFromDb.CategoryId = artwork.CategoryId;
                artworkFromDb.IsBought = artwork.IsBought;
                artworkFromDb.ReportedConfirm = artwork.ReportedConfirm;
                if (artwork.ImageUrl != null)
                {
                    artworkFromDb.ImageUrl = artwork.ImageUrl;

                }
            }
        }


    }
}
