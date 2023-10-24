using BLL.Interfaces;
using DAL.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models;

namespace APIADMIN.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class doanController : ControllerBase
    {
        private readonly IdoanBusiness _doanBusiness;
        private readonly IToolRepository _toolRepository;
        public doanController(IdoanBusiness doanBusiness, IToolRepository toolRepository)
        {
            _doanBusiness = doanBusiness;
            _toolRepository = toolRepository;
        }


        [Route("Create_sp")]
        [HttpPost]
        public async Task<doanModel> Create([FromBody] doanModel model)
        {
            await _doanBusiness.Create(model);
            return model;
        }
        [Route("Update_sp")]
        [HttpPut]
        public async Task<doanModel> Update([FromBody] doanModel model)
        {
            await _doanBusiness.Update(model);
            return model;
        }
        [Route("Delete_sp")]
        [HttpDelete]
        public async Task<bool> Delete(int id)
        {
            return await _doanBusiness.Delete(id);
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
