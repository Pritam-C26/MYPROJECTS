using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebSockets;

namespace Online_Admission_System
{
    public partial class statusCheck : System.Web.UI.Page
    {
        String conStr = "Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=OnlineAdmission;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"SELECT a.ApplicationId,a.FullName,c.CourseName,a.Status,a.SubmissionDate
                                FROM Applications a
                                INNER JOIN Courses c ON a.CourseId=c.CourseId  WHERE a.ApplicationId=@ApplicationId";


                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ApplicationId", txtApplicationId.Text);


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);


                gvStatus.DataSource = dt;
                gvStatus.DataBind();

                if (dt.Rows.Count == 0)
                {
                    lblMessage.Text = "No Application Found !";
                }
                else
                {
                    lblMessage.Text = "";
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentDashboard.aspx");
        }
    }
}