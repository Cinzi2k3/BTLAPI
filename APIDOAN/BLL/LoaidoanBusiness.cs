using Models;
using BLL.Interfaces;
using DAL.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BLL
{
    public class LoaidoanBusiness : ILoaidoanBusiness
    {
        private ILoaidoanRepository _res;
        public LoaidoanBusiness(ILoaidoanRepository res)
        {
            _res = res;
        }

        public async Task<bool> Create(LoaidoanModel model)
        {
            return await _res.Create(model);
        }

        public async Task<bool> Delete(int id)
        {
            return await _res.Delete(id);
        }

        public async Task<List<LoaidoanModel>> GetAll()
        {
            return await _res.GetAll();
        }

        public async Task<LoaidoanModel> GetById(int id)
        {
            return await _res.GetById(id);
        }

        public async Task<bool> Update(LoaidoanModel model)
        {
            return await _res.Update(model);
        }
    }
}
