using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Car_Store
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-D4Q5GRH\SQLEXPRESS;Initial Catalog=CarStore;Integrated Security=True;TrustServerCertificate=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string query = @"SELECT UserId FROM Customers WHERE Email=@Email AND Password=@Password";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@Email", txtLoginEmail.Text);
            cmd.Parameters.AddWithValue("@Password", txtLoginPassword.Text);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                HttpCookie UserIdCookie = new HttpCookie("UserId", reader["UserId"].ToString());

                UserIdCookie.Expires = DateTime.Now.AddMinutes(30);

                Response.Cookies.Add(UserIdCookie);

                if (reader["UserId"].ToString() != null)
                {
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid Email or Password');", true);
                }
            }
            con.Close();

        }


        protected void btnRegister_Click(object sender, EventArgs e)   
        {
            if(txtRegisterPassword.Text != txtConfirmPassword.Text)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Password did not match..!');", true);
                return;
            }

            string query = @"INSERT INTO Customers(FullName,Email,Phone,Password,State) VALUES (@FullName,@Email,@Phone,@Password,@State)";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
            cmd.Parameters.AddWithValue("@Email", txtRegisterEmail.Text);
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
            cmd.Parameters.AddWithValue("@Password", txtRegisterPassword.Text);
            cmd.Parameters.AddWithValue("@State", txtState.Text);


            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Successfully Registered');", true);
        }
    }
}