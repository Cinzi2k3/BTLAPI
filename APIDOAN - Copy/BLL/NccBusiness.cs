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
    public partial class NccBusiness : INccBusiness
    {
        private readonly INccRepository _res;
        public NccBusiness(INccRepository res)
        {
            _res = res;
        }

        public async Task<bool> Create(NccModel model)
        {
            return await _res.Create(model);
        }

        public async Task<bool> Delete(int id)
        {
            return await _res.Delete(id);
        }

        public async Task<bool> Update(NccModel model)
        {
            return await _res.Update(model);
        }
    }
}
