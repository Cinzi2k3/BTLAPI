using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Helper;
using DAL.Interface;
using Models;

namespace DAL
{
    public class NccRepository : INccRepository
    {
        private readonly IDatabaseHelper _dbHelper;
        public NccRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        public async Task<bool> Create(NccModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "Ncc_create",
                "@MaNcc", model.MaNcc,
                "@TenNcc", model.TenNcc,
                "@Diachi", model.Diachi,
                "@sdt", model.sdt);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<bool> Update(NccModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "Ncc_update",
                "@MaNcc", model.MaNcc,
                "@TenNcc", model.TenNcc,
                "@Diachi", model.Diachi,
                "@sdt", model.sdt);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private readonly SqlConnection _connection;
        public async Task<bool> Delete(int id)
        {
            using (SqlCommand cmd = new SqlCommand("Ncc_delete", _connection))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MaNhaCungCap", id);

                // Thực thi stored procedure và xử lý kết quả
                // ...

                return true; // Hoặc trả về giá trị thích hợp tùy thuộc vào logic của bạn
            }
        }
    }
}
