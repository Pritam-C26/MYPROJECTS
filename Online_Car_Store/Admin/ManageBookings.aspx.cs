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
    public partial class ManageBooking : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=CarStore;Integrated Security=True;Encrypt=True;TrustServerCertificate=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["AdminId"] == null)
            {
                Response.Redirect("../Admin/AdminLogin.aspx");
            }

            if (!IsPostBack)
            {
                loadBookings();
            }
        }

        private void loadBookings()
        {
            string query = "SELECT * FROM CarBookingForPurchase";
            SqlCommand cmd = new SqlCommand(query, con);


            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex=e.NewPageIndex;
            loadBookings();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int bookingId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            SqlCommand cmd = new SqlCommand("DELETE FROM CarBookingForPurchase WHERE BookingId=@bookingId", con);
            cmd.Parameters.AddWithValue("@bookingId", bookingId);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            loadBookings();
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