using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace H3ArT.DataAccess.Repository.IRepository
{
    public interface IUnitOfWork
    {
        //Single Interface
        //Eg: ICategoryRepository CategoryRepository {get;}
        ICategoryRepository CategoryObj { get; }
        IArtworkRepository ArtworkObj { get; }
        IShoppingCartRepository ShoppingCartObj { get; }
        IApplicationUserRepository ApplicationUserObj { get; }
        IOrderHeaderRepository OrderHeaderObj { get; }
        IOrderDetailRepository OrderDetailObj { get; }
        IReportArtistRepository ReportArtistObj { get; }
        IReportArtworkRepository ReportArtworkObj { get; }
        IBlogRepository BlogObj { get; }
        IReportBlogRepository ReportBlogObj { get; }
        IPackageRepository PackageObj { get; }
        IOrderDetailPackageRepository OrderDetailPackageObj { get; }
        void Save();
    }
}