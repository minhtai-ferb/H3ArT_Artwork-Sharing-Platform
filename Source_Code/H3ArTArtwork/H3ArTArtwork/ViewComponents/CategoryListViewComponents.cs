using H3ArT.DataAccess.Data;
using H3ArT.DataAccess.Repository.IRepository;
using Microsoft.AspNetCore.Mvc;

namespace H3ArTArtwork.ViewComponents
{
    public class CategoryListViewComponent : ViewComponent
    {
        private readonly IUnitOfWork _unitOfWork;
        public CategoryListViewComponent(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public IViewComponentResult Invoke()
        {
            var data = _unitOfWork.CategoryObj.GetAll();
            return View(data);
        }

    }
}
