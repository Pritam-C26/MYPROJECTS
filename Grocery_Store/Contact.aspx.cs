using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceryStore
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-D4Q5GRH\SQLEXPRESS;Initial Catalog=GroceryStoreDB;Integrated Security=True;Encrypt=False");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["UserID"] != null)
                {
                    btnLoginLogout.Text = "Logout";
                    lblWelcome.Text = "Welcome, " + Request.Cookies["Name"].Value;
                }
                else
                {
                    btnLoginLogout.Text = "Login";
                    lblWelcome.Text = "Welcome, Guest";
                    btnLoginLogout.PostBackUrl = "Login.aspx";
                }
            }
        }



        protected void btnLoginLogout_Click(object sender, EventArgs e)
        {

            if (Request.Cookies["UserID"] != null)
            {
                Session.Clear();
                Session.Abandon();

                HttpCookie userIdCookie = new HttpCookie("UserID");
                userIdCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(userIdCookie);
                Response.Redirect("Home.aspx");
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string query=@"INSERT INTO FeedBack (Name, Email, FeedBackSubject, FeedBackMessage, DateTime) 
                           VALUES (@Name, @Email, @Subject, @Message, @DateTime)";

            SqlCommand cmd = new SqlCommand(query,con);
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Subject", txtSubject.Text.Trim());
            cmd.Parameters.AddWithValue("@Message", txtMessage.Text.Trim());
            cmd.Parameters.AddWithValue("@DateTime", DateTime.Now);


            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            txtName.Text = "";
            txtEmail.Text = "";
            txtSubject.Text = "";
            txtMessage.Text = "";


            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('THANKS FOR YOUR FEEDBACK !');", true);


            
        }
    }
}