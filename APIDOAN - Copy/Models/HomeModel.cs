using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class HomeModel
    {
        public int Madoan { get; set; }
        public string Tendoan { get; set; }
        public string Anh { get; set; }
        public int SoLuong { get; set; }
        public string Mota { get; set; }
        public DateTime NgayTao { get; set; }
        public float Gia { get; set; }

        public LoaidoanModel loaidoan { get; set; }
        public int SoLuongDaBan { get; set; }
        public int SoLuongDatHang { get; set; }
    }
}
