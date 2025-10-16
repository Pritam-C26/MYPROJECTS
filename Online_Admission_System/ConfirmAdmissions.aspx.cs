using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Admission_System
{
    public partial class ConfirmAdmissions : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=OnlineAdmission;Integrated Security=True;Encrypt=True;TrustServerCertificate=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            ConfirmAdmission();
        }

        private void ConfirmAdmission()
        {
            string query = @"SELECT a.ApplicationId,a.FullName,a.Email,c.CourseName,a.SubmissionDate FROM Applications a INNER JOIN Courses c ON a.CourseId=c.CourseId WHERE a.Status='Approved'";

            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvConfirmAdmissions.DataSource = dt;
            gvConfirmAdmissions.DataBind();
        }


        protected void gvConfirmAdmissions_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvConfirmAdmissions.PageIndex = e.NewPageIndex;
            ConfirmAdmission();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            if (Request.Cookies["Role"] == null || Request.Cookies["Role"].Value != "Admin")
            {
                HttpCookie myCookie = new HttpCookie("Role");
                myCookie.Expires = DateTime.Now.AddDays(-1); // expire immediately
                Response.Cookies.Add(myCookie);
            }

            // Redirect to login page
            Response.Redirect("Login.aspx");
        }
    }
}