
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;

namespace DAL.Interface
{
    public partial interface ILoaidoanRepository
    {
        Task<List<LoaidoanModel>> GetAll();

        Task<LoaidoanModel> GetById(int id);

        Task<bool> Create(LoaidoanModel model);
        Task<bool> Update(LoaidoanModel model);

        Task<bool> Delete(int id);
    }
}
