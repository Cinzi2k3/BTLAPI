using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface INccBusiness
    {
        Task<bool> Create(NccModel model);

        Task<bool> Update(NccModel model);
        Task<bool> Delete(int id);
    }
}
