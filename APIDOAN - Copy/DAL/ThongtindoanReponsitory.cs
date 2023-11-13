using DAL.Helper;
using DAL.Interface;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ThongtindoanReponsitory : IThongtindoanRepository
    {
        private readonly IDatabaseHelper _dbHelper;
        public ThongtindoanReponsitory(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public async Task<List<ThongtindoanModel>> GetAllThongtindoan()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "Thongso_getall");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<ThongtindoanModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }

}
