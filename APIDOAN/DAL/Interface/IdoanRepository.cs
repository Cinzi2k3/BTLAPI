using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;

namespace DAL.Interface
{
    public interface IdoanRepository
    {

        Task<bool> Create(doanModel model);

        Task<bool> Update(doanModel model);
        Task<bool> Delete(int id);
        Task<List<doanModel>> GetAllProduct();
        Task<List<HomeModel>> GetNewProduct(int Soluong);
        Task<List<HomeModel>> GetProductBanChay(int sl);
        Task<List<HomeModel>> GetProductOder(int sl);
        Task<doanModel> GetByIdProduct(int id);
        Task<List<doanModel>> GetProductCategory(int id);
        Task<List<SlideModel>> GetAllSlide();
        List<doanModel> Search(int pageIndex, int pageSize, out long total, int? Madoan, string Tendoan, string TenLoai, string option, decimal? FromPrice, decimal? ToPrice);
    }
}
