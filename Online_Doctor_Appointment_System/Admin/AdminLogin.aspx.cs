using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appointment_System.Admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-K5S8RJV\SQLEXPRESS;Initial Catalog=DoctorAppoinmentDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               if (Session["UserID"] != null  && Session["Role"].ToString() == "Admin")
                {
                    Response.Redirect("~/Admin/AdminDashboard.aspx");
                }
            }
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            string email = txtAdminEmail.Text.Trim();
            string password = txtAdminPassword.Text.Trim();
            if (email == "" || password == "")
            {
                lblAdminMessage.Text = "Email and Password are required.";
                return;
            }

            con.Open();
            // Implement admin login logic 
            string adminLogin = @"SELECT FullName, UserID, Email FROM Users WHERE Email=@Email AND Password=@Password AND Role='Admin'"; 
            SqlCommand cmd = new SqlCommand(adminLogin,con);

            cmd.Parameters.AddWithValue("@Email",txtAdminEmail.Text);
            cmd.Parameters.AddWithValue("@Password",txtAdminPassword.Text);

           
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                int userId = Convert.ToInt32(reader["UserID"].ToString());
                string fullname = reader["FullName"].ToString();

                Session["UserID"]=userId;
                Session["FullName"]=fullname;
                Session["Role"]="Admin";

                Response.Redirect("~/Admin/AdminDashboard.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid email or password. Please try again.');", true);
            }
        }
    }
}