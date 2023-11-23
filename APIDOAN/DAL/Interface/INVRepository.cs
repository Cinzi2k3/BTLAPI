using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;

namespace DAL.Interface
{
    public partial interface INVRepository
    {
        Task<List<NVModel>> GetAll();

        Task<NVModel> GetById(int id);
        Task<bool> Create(NVModel model);

        Task<bool> Update(NVModel model);
        Task<bool> Delete(int id);
    }
}
