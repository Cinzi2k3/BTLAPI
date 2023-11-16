using BLL;
using BLL.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models;

namespace APIADMIN.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoaidoanController : ControllerBase
    {
        private ILoaidoanBusiness _loaidoanBusiness;
        public LoaidoanController(ILoaidoanBusiness loaidoanBusiness)
        {
            _loaidoanBusiness = loaidoanBusiness;
        }

        [Route("create-ldoan")]
        [HttpPost]
        public async Task<LoaidoanModel> Create([FromBody] LoaidoanModel model)
        {
            await _loaidoanBusiness.Create(model);
            return model;
        }
        [Route("update-ldoan")]
        [HttpPut]
        public async Task<LoaidoanModel> Update([FromBody] LoaidoanModel model)
        {
            await _loaidoanBusiness.Update(model);
            return model;
        }

        [Route("delete-ldoan")]
        [HttpDelete]
        public async Task<bool> Delete(int id)
        {
            return await _loaidoanBusiness.Delete(id);
        }
        [HttpGet]
        [Route("GetAllProduct")]
        public IActionResult GetAllProduct()
        {
            return Ok(_loaidoanBusiness.GetAll());
        }
        [HttpGet]
        [Route("GetByIdProduct/{id}")]
        public IActionResult GetProductById(int id)
        {
            return Ok(_loaidoanBusiness.GetById(id));
        }
    }
}
