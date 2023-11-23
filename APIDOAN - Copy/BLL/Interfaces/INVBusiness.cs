using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface INVBusiness
    {
        Task<List<NVModel>> GetAll();

        Task<NVModel> GetById(int id);

        Task<bool> Create(NVModel model);
        Task<bool> Update(NVModel model);
        Task<bool> Delete(int id);
    }
}
