using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using H3ArT.Models;
using H3ArT.Models.Models;
using H3ArT.DataAccess.Repository.IRepository;

namespace H3ArT.DataAccess.Data
{
    public class ApplicationDbContext : IdentityDbContext<IdentityUser>
    {
        //PM> update-database to create database
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {

        }

        public DbSet<ApplicationUser> ApplicationUsers { get; set; }
        public DbSet<Category> TblCategory { get; set; }
        public DbSet<Artwork> TblArtwork { get; set; }
        public DbSet<ShoppingCart> TblShoppingCart { get; set; }
        public DbSet<OrderHeader> TblOrderHeader { get; set; }
        public DbSet<OrderDetail> TblOrderDetail { get; set; }
        public DbSet<ReportArtist> TblReportArtist { get; set; }
        public DbSet<ReportArtwork> TblReportArtwork { get; set; }
        public DbSet<Blog> TblBlog { get; set; }
        public DbSet<ReportBlog> TblReportBlog { get; set;}
        public DbSet<Package> TblPackage { get; set; }
        public DbSet<OrderDetailPackage> TblOrderDetailPackage { get; set; }
    }
}