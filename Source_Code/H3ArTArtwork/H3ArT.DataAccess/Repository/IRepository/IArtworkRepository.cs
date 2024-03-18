using H3ArT.Models.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace H3ArT.DataAccess.Repository.IRepository
{
    public interface IArtworkRepository : IRepository<Artwork>
    {
        void Update(Artwork artwork);
    }
}
