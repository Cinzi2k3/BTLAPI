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
    public partial class ThongtindoanBusiness : IThongtindoanBusiness
    {
        private readonly IThongtindoanRepository _res;
        public ThongtindoanBusiness(IThongtindoanRepository res)
        {
            _res = res;
        }
        public async Task<List<ThongtindoanModel>> GetAllThongtindoan()
        {
            return await _res.GetAllThongtindoan();
        }
    }
}
