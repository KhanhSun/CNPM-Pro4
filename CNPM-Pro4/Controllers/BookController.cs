using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CNPM_Pro4.Controllers
{
    public class BookController : Controller
    {
        // GET: Book
        public ActionResult Index()
        {
            return View();
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