using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Admission_System
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=OnlineAdmission;Integrated Security=True;Encrypt=True;TrustServerCertificate=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name=txtName.Text.Trim();
            string email=txtEmail.Text.Trim();
            string message=txtMessage.Text.Trim();

            if(name == "" || email=="" || message=="")
            {
                lblStatus.Text = "All fields are required.";
                lblStatus.ForeColor = System.Drawing.Color.Red;
                return;
            }
            else
            {
                string query = @"INSERT INTO ContactMessages (Name, Email, Message, CreateAt) VALUES (@Name, @Email, @Message, @CreateAt)";
                SqlCommand cmd = new SqlCommand(query,con);

                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Message", message);
                cmd.Parameters.AddWithValue("@CreateAt", DateTime.Now);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }
            lblStatus.Text = "Message sent successfully.";
            lblStatus.ForeColor = System.Drawing.Color.Green;
            txtName.Text = txtEmail.Text = txtMessage.Text = "";
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            if (Request.Cookies["Role"] == null || Request.Cookies["Role"].Value != "Student")
            {
                HttpCookie myCookie = new HttpCookie("Role");
                myCookie.Expires = DateTime.Now.AddDays(-1); // expire immediately
                Response.Cookies.Add(myCookie);
            }

            // Redirect to login page
            Response.Redirect("Login.aspx");
        }
    }
}