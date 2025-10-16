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
    public partial class PaymentSummary : System.Web.UI.Page
    {
        String conStr = "Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=OnlineAdmission;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["UserId"] != null)
                {
                    int userId = Convert.ToInt32(Request.Cookies["UserId"].Value);
                    LoadPaymentDetails(userId);
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
           
        }


        private void LoadPaymentDetails(int userId)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "SELECT a.FullName, c.CourseName, c.Fees, 500 AS ApplicationFee, (c.Fees + 500) AS TotalAmount " +
               "FROM Applications a " +
               "INNER JOIN Courses c ON a.CourseId = c.CourseId " +
               "WHERE a.UserId = @UserId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", userId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                DetailsViewPayment.DataSource = dt;
                DetailsViewPayment.DataBind();


            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(conStr))
            {

                string query = @"SELECT a.ApplicationId,c.CourseId, c.CourseName,c.Fees FROM  Applications a INNER JOIN Courses c ON a.CourseId=c.CourseId WHERE a.UserId=@UserId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", Convert.ToInt32(Request.Cookies["UserId"].Value));


                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    Session["CourseName"] = reader["CourseName"].ToString();
                    Session["CourseId"] = reader["CourseId"].ToString();
                    Session["ApplicationId"] = reader["ApplicationId"].ToString();
                    Session["Fees"] = reader["Fees"].ToString();


                    decimal fees = Convert.ToDecimal(Session["Fees"]);
                    string courseName = Session["CourseName"].ToString();
                    decimal totalAmount = fees + 500;
                    Session["TotalAmount"] = totalAmount;
                }
                con.Close();

            }


            Response.Redirect("PaymentGateway.aspx");
        }
    }
}