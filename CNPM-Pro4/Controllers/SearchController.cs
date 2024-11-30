using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CNPM_Pro4.Models;
namespace CNPM_Pro4.Controllers
{
    public class SearchController : Controller
    {
        BookEntities data = new BookEntities();
        // GET: Search
        [HttpGet]
        public ActionResult Search(string strSearch = "")
        {
            ViewBag.strSearch = strSearch;
            if (string.IsNullOrEmpty(strSearch))
            {
                return View();
            }
            else
            {
                var kq = data.saches.AsQueryable();

                // Kiểm tra và lọc theo maSach nếu strSearch là số nguyên
                if (int.TryParse(strSearch, out int maSach))
                {
                    kq = kq.Where(s => s.maSach == maSach.ToString());
                }

                // Lọc theo tenSach và các thuộc tính khác
                kq = kq.Where(s => s.tenSach.Contains(strSearch) ||
                                   s.maSach.Contains(strSearch) ||
                                   s.isbn.Contains(strSearch));

                // Sắp xếp theo tên sách (tenSach) và mã sách (maSach)
                kq = kq.OrderBy(s => s.tenSach)
                       .ThenBy(s => s.maSach);

                var result = kq.ToList();
                return View(result);
            }
        }


    }
}