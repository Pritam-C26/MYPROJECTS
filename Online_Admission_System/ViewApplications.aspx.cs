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
    public partial class ViewApplications : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=OnlineAdmission;Integrated Security=True;Encrypt=True;TrustServerCertificate=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["Role"] == null || Request.Cookies["Role"].Value != "Admin")
                {
                    Response.Redirect("Login.aspx");
                }
                LoadApplications();
            }
        }

        private void LoadApplications()
        {
            SqlCommand cmd = new SqlCommand(@"SELECT a.ApplicationId,a.FullName,c.CourseName,a.DOB,a.Status FROM Applications a INNER JOIN Courses c ON a.CourseId=c.CourseId ORDER BY a.ApplicationId DESC", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
       
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadApplications();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ApplicationId = Convert.ToInt32(e.CommandArgument);
            if(e.CommandName == "ViewDetails")
            {
                Response.Redirect("ApplicationDetails.aspx?ApplicationId=" + ApplicationId);

            }else if(e.CommandName == "Approve")
            {
                UpdateStatus(ApplicationId, "Approved");

            }else if(e.CommandName =="Reject"){

                UpdateStatus(ApplicationId, "Reject");
            }
        }


        protected void UpdateStatus(int ApplicationId, string Status)
        {
            SqlCommand cmd = new SqlCommand(@"UPDATE Applications SET Status=@Status WHERE ApplicationId=@ApplicationId", con);
            cmd.Parameters.AddWithValue("@Status", Status);
            cmd.Parameters.AddWithValue("@ApplicationId", ApplicationId);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            LoadApplications();
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