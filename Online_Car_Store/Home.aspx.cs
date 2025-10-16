using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Car_Store
{
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-D4Q5GRH\SQLEXPRESS;Initial Catalog=CarStore;Integrated Security=True;TrustServerCertificate=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnShopNow_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cars.aspx");
        }
        
        protected void btnBookTestDrive_Click(object sender, EventArgs e)
        {
            Response.Redirect("TestDrive.aspx");
        }

        protected void btnSubscribe_Click(object sender, EventArgs e)
        {
            string query = @"INSERT INTO Subscribe(SubscribeMail) VALUES(@SubscribeMail)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@SubscribeMail",txtEmail.Text.Trim());


            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thanks For Subscribe.');", true);
        }
    }
}