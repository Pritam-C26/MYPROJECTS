using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceryStore
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=GroceryStoreDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if(txtPassword.Text != txtConfirmPassword.Text)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Password and Confirm Password do not match');", true);
                return;
            }


            string query = @"INSERT INTO Users (Name,Email,Password,Address,Phone) VALUES (@Name,@Email,@Password,@Address,@Phone)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Successfuly Registered');", true);
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string query = @"SELECT UserID, Name, IsBlocked 
                     FROM Users 
                     WHERE (Email=@Email OR Phone=@Phone) AND Password=@Password";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Email", txtLoginEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Phone", txtLoginEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtLoginPassword.Text.Trim());

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                bool isBlocked = false;
                if (reader["IsBlocked"] != DBNull.Value)
                {
                    isBlocked = Convert.ToBoolean(reader["IsBlocked"]);
                }

                if (isBlocked)
                {
                   
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Your account has been blocked. Please contact the admin.');", true);
                }
                else
                {
                   
                    HttpCookie userIdCookie = new HttpCookie("UserID", reader["UserID"].ToString());
                    HttpCookie nameCookie = new HttpCookie("Name", reader["Name"].ToString());

                    userIdCookie.Expires = DateTime.Now.AddMinutes(30);
                    nameCookie.Expires = DateTime.Now.AddMinutes(30);

                    Response.Cookies.Add(userIdCookie);
                    Response.Cookies.Add(nameCookie);

                    Response.Redirect("Home.aspx");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Invalid Email/Phone or Password');", true);
            }

            reader.Close();
            con.Close();
        }

    }
}