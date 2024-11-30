using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace CNPM_Pro4
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Khởi tạo số người online và số lượt truy cập
            Application["OnlineUsers"] = 0; // Số người online
            Application["TotalVisits"] = 0; // Tổng số lần truy cập
        }

        protected void Session_Start()
        {
            // Khi một session bắt đầu, tăng số người online
            Application.Lock();
            Application["OnlineUsers"] = (int)Application["OnlineUsers"] + 1;

            // Tăng tổng số lượt truy cập
            Application["TotalVisits"] = (int)Application["TotalVisits"] + 1;
            Application.UnLock();
        }

        protected void Session_End()
        {
            // Khi session kết thúc, giảm số người online
            Application.Lock();
            Application["OnlineUsers"] = (int)Application["OnlineUsers"] - 1;
            Application.UnLock();
        }
    }
}
