using APIUSER.Model;
using BLL;
using BLL.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models;

namespace APIUSER.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase

    {
        private readonly IdoanBusiness _doanBusiness;
        private readonly ILoaidoanBusiness _loaidoanBusiness;
        private readonly IThongtindoanBusiness _thongtindoanBusiness;
        public HomeController(IdoanBusiness doanBusiness, ILoaidoanBusiness loaidoanBusiness, IThongtindoanBusiness thongtindoanBusiness)
        {
            _doanBusiness = doanBusiness;
            _loaidoanBusiness = loaidoanBusiness;
            _thongtindoanBusiness = thongtindoanBusiness;

        }
        [Route("GetAllProduct")]
        [HttpGet]
        public async Task<List<doanModel>> GetAllProduct()
        {

            return await _doanBusiness.GetAllProduct();
        }
        [Route("GetNewProduct")]
        [HttpGet]
        public async Task<List<HomeModel>> GetNewProduct(int Soluong)
        {
            return await _doanBusiness.GetNewProduct(Soluong);
        }
        [Route("get-by-id_LoaiSP")]
        [HttpGet]
        public async Task<LoaidoanModel> GetById(int id)
        {
            return await _loaidoanBusiness.GetById(id);
        }
        [Route("get-all_LoaiSP")]
        [HttpGet]
        public async Task<List<LoaidoanModel>> GetAll()
        {
            return await _loaidoanBusiness.GetAll();
        }
        [Route("GetProductCategory")]
        [HttpGet]
        public async Task<List<doanModel>> GetProductCategory(int id)
        {
            return await _doanBusiness.GetProductCategory(id);
        }
        [Route("GetProductBanchay")]
        [HttpGet]
        public async Task<List<HomeModel>> GetProductBanChay(int sl)
        {
            return await _doanBusiness.GetProductBanChay(sl);
        }

        [Route("GetProductOder")]
        [HttpGet]
        public async Task<List<HomeModel>> GetProductOder(int sl)
        {


            return await _doanBusiness.GetProductOder(sl);
        }
        [Route("GetByIdProduct")]
        [HttpGet]
        public async Task<doanModel> GetByIdProduct(int id)
        {

            return await _doanBusiness.GetByIdProduct(id);
        }
        [Route("GetAllSlide")]
        [HttpGet]
        public async Task<List<SlideModel>> GetAllSlide()
        {
            return await _doanBusiness.GetAllSlide();
        }
        [Route("GetAllThongtindoan")]
        [HttpGet]
        public async Task<List<ThongtindoanModel>> GetAllThongtindoan()
        {
            return await _thongtindoanBusiness.GetAllThongtindoan();
        }
        [Route("SearchSp")]
        [HttpPost]
        public ReponseModel Search([FromBody] ProductFilterRequestModel productFilterRequestModel)
        {
            var response = new ReponseModel();
            try
            {
                long total = 0;
                var data = _doanBusiness.Search(
                    productFilterRequestModel.PageIndex,
                    productFilterRequestModel.PageSize,
                    out total,
                    productFilterRequestModel.ProductId,
                    productFilterRequestModel.ProductName,
                    productFilterRequestModel.TenLoai,
                    null,
                    productFilterRequestModel.FromPrice,
                    productFilterRequestModel.ToPrice);
                response.TotalItems = total;
                response.Data = data;
                response.Page = productFilterRequestModel.PageIndex;
                response.PageSize = productFilterRequestModel.PageSize;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return response;
        }
    }
}
