using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Admission_System
{
    public partial class AdminDashboard : System.Web.UI.Page
    {


        String conStr = "Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=OnlineAdmission;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["Role"]==null || Request.Cookies["Role"].Value !="Admin")
                {
                    Response.Redirect("Login.aspx");
                }
                LoadDashboard();
                LoadApplications();
            }

        }

        
        private void LoadDashboard()
        {
            using(SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                SqlCommand cmd1 = new SqlCommand( @"SELECT COUNT(*) FROM Applications",con);
                lblApplications.Text = cmd1.ExecuteScalar().ToString();


                SqlCommand cmd2 = new SqlCommand(@"SELECT COUNT(*) FROM Applications WHERE Status='Approved'", con);
                lblConfirmed.Text=cmd2.ExecuteScalar().ToString();

                SqlCommand cmd3 = new SqlCommand(@"SELECT COUNT(*) FROM Applications WHERE Status='Pending'", con);
                lblPending.Text = cmd3.ExecuteScalar().ToString();
                    
                SqlCommand cmd4 = new SqlCommand(@"SELECT COUNT(*) FROM Applications WHERE Status='Reject'", con);
                lblReject.Text = cmd4.ExecuteScalar().ToString();

                con.Close();
            }
        }



        private void LoadApplications()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(@"SELECT TOP 10 ApplicationId,FullName,(SELECT CourseName FROM Courses WHERE CourseId = Applications.CourseId)AS CourseName,Status FROM Applications", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
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