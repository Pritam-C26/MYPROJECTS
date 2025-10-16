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
    public partial class TestDriveList : System.Web.UI.Page
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
                loadTestDrive();
            }
        }



        private void loadTestDrive()
        {
            string query = "SELECT * FROM TestDriveBookings";

            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            gvTestDrive.DataSource=dt;
            gvTestDrive.DataBind();

            con.Close();
        }



        protected void gvTestDrive_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTestDrive.PageIndex = e.NewPageIndex;
            loadTestDrive();
        }


        protected void gvTestDrive_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int bookingId = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Available")
            {
                UpdateStatus(bookingId, "Your Booking is Accepted.");
            }
            else if (e.CommandName == "UnAvailable")
            {
                UpdateStatus(bookingId, "Choose Another Date & Time.");
            }

        }
        private void UpdateStatus(int bookingId, string status)
        {
            string query = "UPDATE TestDriveBookings SET Status=@Status WHERE BookingId=@BookingId";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@BookingId", bookingId);
            cmd.Parameters.AddWithValue("@Status", status);
           
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            loadTestDrive();
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