using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceryStore
{
    public partial class Home : System.Web.UI.Page
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

        protected void btnSubscribe_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                string query = @"INSERT INTO Subscribers (SubscriberEmail) VALUES (@SubscriberEmail)";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@SubscriberEmail", txtEmail.Text.Trim());

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Subscribed successfully!');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a valid email.');", true);
            }
        }
    }
}
