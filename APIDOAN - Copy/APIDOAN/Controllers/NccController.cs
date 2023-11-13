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
        private readonly INccBusiness _NccBusiness;
        private readonly IToolRepository _toolRepository;
        public NccController(INccBusiness NccBusiness, IToolRepository toolRepository)
        {
            _NccBusiness = NccBusiness;
            _toolRepository = toolRepository;
        }


        [Route("Create_sp")]
        [HttpPost]
        public async Task<NccModel> Create([FromBody] NccModel model)
        {
            await _NccBusiness.Create(model);
            return model;
        }
        [Route("Update_sp")]
        [HttpPut]
        public async Task<NccModel> Update([FromBody] NccModel model)
        {
            await _NccBusiness.Update(model);
            return model;
        }
        [Route("Delete_sp")]
        [HttpDelete]
        public async Task<bool> Delete(int id)
        {
            return await _NccBusiness.Delete(id);
        }
        [Route("upload")]
        [HttpPost]
        public async Task<IActionResult> UploadFile(IFormFile file)
        {

            var fileName = _toolRepository.SaveFile(file);
            return Ok(new { FileName = fileName.Result });
        }



    }
}
