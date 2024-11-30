using CNPM_Pro4.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CNPM_Pro4.Areas.Admin.Controllers
{
    public class ManageBookController : Controller
    {
        private BookEntities db = new BookEntities();

        // GET: Admin/Book  
        public ActionResult Index()
        {
            var books = db.sach.ToList();
            return View(books);
        }

        // GET: Admin/Book/Create  
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Book/Create  
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(sach sach) // sach là model đại diện cho bảng sách  
        {
            if (ModelState.IsValid)
            {
                db.sach.Add(sach); // Thêm sách mới  
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(sach);
        }

        // GET: Admin/Book/Edit/5  
        public ActionResult Edit(string id) // Sử dụng masach là khóa chính  
        {
            var sach = db.sach.Find(id);
            if (sach == null)
            {
                return HttpNotFound();
            }
            return View(sach);
        }

        // POST: Admin/Book/Edit/5  
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(sach sach)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sach).State = System.Data.Entity.EntityState.Modified; // Cập nhật sách  
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(sach);
        }

        public ActionResult Delete(string id)
        {
            var sach = db.sach.Find(id);
            if (sach == null)
            {
                return HttpNotFound();
            }
            return View(sach);
        }
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            var sach = db.sach.Find(id);
            db.sach.Remove(sach); // Xóa sách  
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}