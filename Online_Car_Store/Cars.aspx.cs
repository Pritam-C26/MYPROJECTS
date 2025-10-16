using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Car_Store
{
    public partial class Cars : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-D4Q5GRH\SQLEXPRESS;Initial Catalog=CarStore;Integrated Security=True;TrustServerCertificate=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarBind();
            }
        }


        protected void CarBind()
        {
            string query = @"SELECT CarId, CarName,Brand,Model,Price,Description,ImagePath FROM Cars ";
            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            rptCars.DataSource = reader;
            rptCars.DataBind();
            con.Close();

        }
        protected void btnBookTestDrive_Click(object sender, EventArgs e)
        {
            Response.Redirect("TestDrive.aspx");
        }

    }
}