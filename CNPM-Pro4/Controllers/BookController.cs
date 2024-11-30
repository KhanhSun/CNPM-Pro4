using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using CNPM_Pro4.Models;
namespace CNPM_Pro4.Controllers
{
    public class BookController : Controller
    {
        BookEntities data = new BookEntities();
        // GET: Book
        private List<sach> LaySachMoi(int count)
        {
            return data.saches.OrderByDescending(a => a.tenSach).Take(count).ToList();
        }
        public ActionResult Index(int? page)
        {
            int pageSize = 6; // số bản ghi trên mỗi trang  
            int pageNumber = (page ?? 1) - 1; // số trang hiện tại  

            var listSach = data.saches.OrderByDescending(a => a.tenSach).Skip(pageNumber * pageSize).Take(pageSize).ToList();
            int totalRecords = data.saches.Count(); // tổng số bản ghi  

            ViewBag.TotalPages = (int)Math.Ceiling((double)totalRecords / pageSize);
            ViewBag.CurrentPage = pageNumber + 1; // trang hiện tại (1-based) 
            //Lay 6 quyen sach moi
            var listSachMoi = LaySachMoi(6);
            return View(listSachMoi);
            // return View();
        }
        public ActionResult BookDetail(string id)
        {
            var sach = data.saches.ToList().Find(s => s.maSach == id.ToString());
            return View(sach);

        }



        public ActionResult PartialNav()
        {
            return PartialView("PartialNav");
        }
        public ActionResult PartialFooter()
        {
            return PartialView("PartialFooter");
        }

        public ActionResult LoginLogout()
        {
            return PartialView();
        }

        public ActionResult PartialChuDe()
        {
            return PartialView("PartialChuDe");
        }
    }
}