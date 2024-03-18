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
    public class BlogRepository : Repository<Blog>, IBlogRepository
    {
        private readonly ApplicationDbContext _db;
        public BlogRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }
        public void Update(Blog blog)
        {
            var blogFromDb = _db.TblBlog.FirstOrDefault(u => u.BlogId == blog.BlogId);
            if (blogFromDb != null )
            {
                blogFromDb.CreatorId = blog.CreatorId;
                blogFromDb.Title = blog.Title;
                blogFromDb.Description = blog.Description;
                blogFromDb.CreatedAt = blog.CreatedAt;
                if(blogFromDb.ImageUrl != null )
                {
                    blogFromDb.ImageUrl = blog.ImageUrl;
                    
                }
            }
        }


    }
}
