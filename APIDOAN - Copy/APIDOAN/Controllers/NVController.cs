using BLL;
using BLL.Interfaces;
using DAL.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models;
using static BLL.Interfaces.INVBusiness;

namespace APIADMIN.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NVController : ControllerBase
    {
        private readonly INVBusiness _NVBusiness;
        private readonly IToolRepository _toolRepository;
        public NVController(INVBusiness NVBusiness, IToolRepository toolRepository)
        {
            _NVBusiness = NVBusiness;
            _toolRepository = toolRepository;
        }


        [Route("NV_create")]
        [HttpPost]
        public async Task<NVModel> Create([FromBody] NVModel model)
        {
            await _NVBusiness.Create(model);
            return model;
        }
        [Route("NV_update")]
        [HttpPut]
        public async Task<NVModel> Update([FromBody] NVModel model)
        {
            await _NVBusiness.Update(model);
            return model;
        }
        [Route("NV_delete")]
        [HttpDelete]
        public async Task<bool> Delete(int id)
        {
            return await _NVBusiness.Delete(id);
        }
        [Route("upload")]
        [HttpPost]
        public async Task<IActionResult> UploadFile(IFormFile file)
        {

            var fileName = _toolRepository.SaveFile(file);
            return Ok(new { FileName = fileName.Result });
        }
        [HttpGet]
        [Route("GetAll")]
        public IActionResult GetAll()
        {
            return Ok(_NVBusiness.GetAll());
        }
        [HttpGet]
        [Route("GetById/{id}")]
        public IActionResult GetById(int id)
        {
            return Ok(_NVBusiness.GetById(id));
        }



    }
}
