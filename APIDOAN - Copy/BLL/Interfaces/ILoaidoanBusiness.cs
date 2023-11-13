using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface ILoaidoanBusiness
    {
        Task<List<LoaidoanModel>> GetAll();

        Task<LoaidoanModel> GetById(int id);

        Task<bool> Create(LoaidoanModel model);
        Task<bool> Update(LoaidoanModel model);

        Task<bool> Delete(int id);
    }
}
