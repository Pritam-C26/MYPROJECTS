using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Admission_System
{
    public partial class Login : System.Web.UI.Page
    {
        String conStr = "Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=OnlineAdmission;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conStr);
            {
                String query = "SELECT UserId,Role FROM Users WHERE Email=@Email AND Password=@Password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if(reader.Read()){
                    HttpCookie UserIdCookie = new HttpCookie("UserId", reader["UserId"].ToString());
                    HttpCookie RoleCookie = new HttpCookie("Role", reader["Role"].ToString());



                    UserIdCookie.Expires = DateTime.Now.AddHours(1);
                    RoleCookie.Expires = DateTime.Now.AddHours(1);

                    Response.Cookies.Add(UserIdCookie);
                    Response.Cookies.Add(RoleCookie);


                    if (reader["Role"].ToString()=="Student"){
                        Response.Redirect("StudentDashboard.aspx");
                    }
                    else
                    {
                        Response.Redirect("AdminDashboard.aspx");
                    }
                }
                con.Close();
            }
        }
    }
}