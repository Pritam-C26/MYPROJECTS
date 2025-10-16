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
    public partial class finalView : System.Web.UI.Page
    {
        String conStr = "Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=OnlineAdmission;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["UserId"] != null)
                {
                    int userId = Convert.ToInt32(Request.Cookies["UserId"].Value);
                    LoadApplications(userId);
                    LoadDocument(userId);
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void LoadApplications(int userId)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "SELECT u.Username, a.FullName, a.DOB, a.Gender, a.Address, a.Email, a.Phone, a.PreviousSchool, a.Marks, a.PassingYear, a.LastQualification, a.SubmissionDate, c.CourseName, c.Duration, c.Fees " +
                               "FROM Users u " +
                               "INNER JOIN Applications a ON u.UserId = a.UserId " +
                               "INNER JOIN Courses c ON a.CourseId = c.CourseId " +
                               "WHERE u.UserId = @UserId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", userId); 

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DetailsView1.DataSource = dt;
                DetailsView1.DataBind();

            }
        }


        private void LoadDocument(int userId)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
            string query = "SELECT d.PhotoIdPath, d.SignaturePath, d.MarksheetPath, d.DocUploadDate " +
               "FROM ApplicationDocuments d " +
               "INNER JOIN Applications a ON d.ApplicationId = a.ApplicationId " +
               "WHERE a.UserId = @UserId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", userId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewDocs.DataSource = dt;
                GridViewDocs.DataBind();

            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            
           Response.Redirect("PaymentSummary.aspx");
        }
    }
}