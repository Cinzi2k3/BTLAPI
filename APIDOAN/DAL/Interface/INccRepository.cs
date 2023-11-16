using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;

namespace DAL.Interface
{
    public partial interface INccRepository
    {
        Task<List<NccModel>> GetAll();

        Task<NccModel> GetById(int id);
        Task<bool> Create(NccModel model);

        Task<bool> Update(NccModel model);
        Task<bool> Delete(int id);
    }
}
