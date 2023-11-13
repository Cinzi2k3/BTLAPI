using BLL.Interfaces;
using DAL;
using DAL.Interface;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public partial class doanBusiness : IdoanBusiness
    {
        private readonly IdoanRepository _res;
        public doanBusiness(IdoanRepository res)
        {
            _res = res;
        }

        public async Task<bool> Create(doanModel model)
        {
            return await _res.Create(model);
        }

        public async Task<bool> Delete(int id)
        {
            return await _res.Delete(id);
        }

        public async Task<bool> Update(doanModel model)
        {
            return await _res.Update(model);
        }
        public async Task<List<doanModel>> GetAllProduct()
        {
            return await _res.GetAllProduct();
        }

        public async Task<List<HomeModel>> GetNewProduct(int Soluong)
        {
            return await _res.GetNewProduct(Soluong);
        }
        public async Task<List<doanModel>> GetProductCategory(int id)
        {
            return await _res.GetProductCategory(id);
        }
        public async Task<List<HomeModel>> GetProductBanChay(int sl)
        {
            return await _res.GetProductBanChay(sl);
        }
        public async Task<List<HomeModel>> GetProductOder(int sl)
        {
            return await _res.GetProductOder(sl);
        }
        public async Task<doanModel> GetByIdProduct(int id)
        {
            return await _res.GetByIdProduct(id);
        }
        public async Task<List<SlideModel>> GetAllSlide()
        {
            return await _res.GetAllSlide();
        }
        public List<doanModel> Search(int pageIndex, int pageSize, out long total, int? Madoan, string Tendoan, string TenLoai, string option, decimal? FromPrice, decimal? ToPrice)
        {
            return _res.Search(pageIndex, pageSize, out total, Madoan, Tendoan, TenLoai, option, FromPrice, ToPrice);
        }
    }
}
