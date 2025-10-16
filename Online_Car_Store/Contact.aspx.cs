using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Car_Store
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-D4Q5GRH\SQLEXPRESS;Initial Catalog=CarStore;Integrated Security=True;TrustServerCertificate=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string query= @"INSERT INTO ContactMessages(Name,Email,Subject,Message) VALUES(@Name,@Email,@Subject,@Message)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Subject", txtSubject.Text.Trim());
            cmd.Parameters.AddWithValue("@Message", txtMessage.Text.Trim());

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thanks For Feedback.');", true);
        }
    }
}