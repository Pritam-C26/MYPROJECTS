using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Car_Store.Admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=CarStore;Integrated Security=True;Encrypt=True;TrustServerCertificate=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string query = @"SELECT AdminId,AdminUser,AdminPass FROM AdminLogin WHERE AdminUser=@AdminUser AND AdminPass=@AdminPass";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue ("@AdminUser", txtUsername.Text);
            cmd.Parameters.AddWithValue("@AdminPass", txtPassword.Text);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                HttpCookie AdminIdCookie = new HttpCookie("AdminId", reader["AdminId"].ToString());

                AdminIdCookie.Expires = DateTime.Now.AddMinutes(30);

                Response.Cookies.Add(AdminIdCookie);
                lblMessage.Text = "Login Successfully";
                Response.Redirect("../Admin/AdminDashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid username or password";
            }
            con.Close();
        }
    }
}