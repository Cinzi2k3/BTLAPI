using BLL.Interfaces;
using DAL.Interface;
using Models;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static BLL.Interfaces.INccBusiness;

namespace BLL
{
    public class NVBusiness : INVBusiness
    {
        private INVRepository _res;
        public NVBusiness(INVRepository res)
        {
            _res = res;
        }

        public async Task<bool> Create(NVModel model)
        {
            return await _res.Create(model);
        }

        public async Task<bool> Delete(int id)
        {
            return await _res.Delete(id);
        }

        public async Task<List<NVModel>> GetAll()
        {
            return await _res.GetAll();
        }

        public async Task<NVModel> GetById(int id)
        {
            return await _res.GetById(id);
        }

        public async Task<bool> Update(NVModel model)
        {
            return await _res.Update(model);
        }
    }
}
