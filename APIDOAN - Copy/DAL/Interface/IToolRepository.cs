using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Models;

namespace DAL.Interface
{
    public interface IToolRepository
    {
        string CreatePathFile(string RelativePathFileName);

        //string SaveFile(IFormFile file, string folder);
        Task<string> SaveFile(IFormFile flie);
    }

    public class Tools : IToolRepository
    {
        private IConfiguration _configuration;
        public Tools(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public string CreatePathFile(string RelativePathFileName)
        {
            try
            {
                string serverRootPathFolder = _configuration["AppSettings:WEB_SERVER_FULL_PATH"].ToString();
                string fullPathFile = $@"{serverRootPathFolder}\{RelativePathFileName}";
                string fullPathFolder = System.IO.Path.GetDirectoryName(fullPathFile);
                if (!Directory.Exists(fullPathFolder))
                    Directory.CreateDirectory(fullPathFolder);
                return fullPathFile;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public async Task<string> SaveFile(IFormFile file)
        {
            string filePath = $"UploadImg/{file.FileName}";
            var fullPath = CreatePathFile(filePath);
            using (var fileStream = new FileStream(fullPath, FileMode.Create))
            {
                await file.CopyToAsync(fileStream);
            }
            return filePath;
        }


    }
}
