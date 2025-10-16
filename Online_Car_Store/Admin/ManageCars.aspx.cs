using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Car_Store.Admin
{
    public partial class ManageCars : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=CarStore;Integrated Security=True;Encrypt=True;TrustServerCertificate=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["AdminId"] == null)
            {
                Response.Redirect("../Admin/AdminLogin.aspx");
            }

            if(!IsPostBack)
            {
                LoadCars();
            }
        }

      


        private void LoadCars()
        {
            string query = "SELECT CarId,CarName,Brand,Status FROM Cars";
            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt =  new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadCars();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           int carId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string query = "DELETE FROM Cars WHERE CarId=@CarId";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@CarId", carId);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            LoadCars();

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int carId = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Available")
            {
                UpdateStatus(carId, "Available");

            }else if(e.CommandName == "UnAvailable")
            {
                UpdateStatus(carId, "Unavailable");
            }
        }



        private void UpdateStatus(int carId, string status)
        {
            string query = "UPDATE Cars SET Status=@Status WHERE CarId=@CarId";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Status", status);
            cmd.Parameters.AddWithValue("@CarId", carId);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            LoadCars();
        }


        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            if (Request.Cookies["AdminId"] == null)
            {
                HttpCookie cookie = new HttpCookie("AdminId");
                cookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(cookie);
            }

            Response.Redirect("../Admin/AdminLogin.aspx");
        }
    }
}