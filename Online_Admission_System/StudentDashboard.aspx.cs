using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Admission_System
{
    public partial class Home : System.Web.UI.Page
    {
        String conStr = "Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=OnlineAdmission;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["UserId"] != null && Request.Cookies["Role"]?.Value == "Student")
            {
                Response.Redirect("Courses.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnStatus_Click(object sender, EventArgs e)
        {
            Response.Redirect("statusCheck.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            if (Request.Cookies["Role"] == null || Request.Cookies["Role"].Value != "Student")
            {
                HttpCookie myCookie = new HttpCookie("Role");
                myCookie.Expires = DateTime.Now.AddDays(-1); // expire immediately
                Response.Cookies.Add(myCookie);
            }

            // Redirect to login page
            Response.Redirect("Login.aspx");
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("~/Prospectus/Online_Admission_System_Prospectus.pdf");
            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=Online_Admission_System_Prospectus.pdf");
            Response.TransmitFile(filePath);
            Response.End();
        }
    }
}
