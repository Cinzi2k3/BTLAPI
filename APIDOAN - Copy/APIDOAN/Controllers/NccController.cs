using BLL;
using BLL.Interfaces;
using DAL.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models;
using static BLL.Interfaces.INccBusiness;

namespace APIADMIN.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NccController : ControllerBase
    {
        private INccBusiness _NccBusiness;
        public NccController(INccBusiness NccBusiness)
        {
            _NccBusiness = NccBusiness;
            
        }


        [Route("Ncc_create")]
        [HttpPost]
        public async Task<NccModel> Create([FromBody] NccModel model)
        {
            await _NccBusiness.Create(model);
            return model;
        }
        [Route("Ncc_update")]
        [HttpPut]
        public async Task<NccModel> Update([FromBody] NccModel model)
        {
            await _NccBusiness.Update(model);
            return model;
        }
        [Route("Ncc_delete")]
        [HttpDelete]
        public async Task<bool> Delete(int id)
        {
            return await _NccBusiness.Delete(id);
        }
        [HttpGet]
        [Route("GetAll")]
        public IActionResult GetAll()
        {
            return Ok(_NccBusiness.GetAll());
        }
        [HttpGet]
        [Route("GetById/{id}")]
        public IActionResult GetById(int id)
        {
            return Ok(_NccBusiness.GetById(id));
        }



    }
}
