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
    public class ReportArtistRepository : Repository<ReportArtist>, IReportArtistRepository
    {
        private readonly ApplicationDbContext _db;
        public ReportArtistRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }
        public void Update(ReportArtist reportArtist)
        {
            _db.TblReportArtist.Update(reportArtist);
        }
    }
}