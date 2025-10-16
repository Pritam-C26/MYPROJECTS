using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Car_Store
{
    public partial class TestDrive : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-D4Q5GRH\SQLEXPRESS;Initial Catalog=CarStore;Integrated Security=True;TrustServerCertificate=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["UserId"] == null || string.IsNullOrEmpty(Request.Cookies["UserId"].Value))
            {
                Response.Redirect("login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                loadCars();
            }
        }


        private void loadCars()
        {
            string query = @"Select CarId,CarName from Cars";
            SqlCommand cmd = new SqlCommand(query, con);


            con.Open();
            SqlDataReader reader=cmd.ExecuteReader();
            ddlCar.DataSource = reader;
            ddlCar.DataTextField = "CarName";
            ddlCar.DataValueField = "CarId";

            ddlCar.DataBind();
            con.Close();

        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["UserId"] == null || string.IsNullOrEmpty(Request.Cookies["UserId"].Value))
            {
                Response.Redirect("login.aspx");
                return;
            }


            int userId =Convert.ToInt32(Request.Cookies["UserId"].Value);
            string carId=ddlCar.SelectedValue;
            string date = txtDate.Text.Trim();
            string time = txtTime.Text.Trim();

            if(string.IsNullOrEmpty(carId) || string.IsNullOrEmpty(date) || string.IsNullOrEmpty(time))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please fill all the fields!');", true);
                return;
            }


            string query = @"INSERT INTO TestDriveBookings(UserId,CarId,PreferredD,PreferredT) VALUES (@UserId,@CarId,@PreferredD,@PreferredT)";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@CarId", carId);
            cmd.Parameters.AddWithValue("@PreferredD", date);
            cmd.Parameters.AddWithValue("@PreferredT", time);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Test Drive Booked Successfully !');", true);
            cleanForm();
        }

        private void cleanForm()
        {
            ddlCar.SelectedIndex = 0;
            txtDate.Text = "";
            txtTime.Text = "";
        }

        protected void btnCheckStatus_Click(object sender, EventArgs e)
        {
            string bookingId =txtBookingId.Text.Trim();
            if (string.IsNullOrEmpty(bookingId))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter Booking ID!');", true);
                return;
            }

            string query = @"Select Status from TestDriveBookings where BookingId=@BookingId";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@BookingId", bookingId);
            con.Open();
            object status = cmd.ExecuteScalar();

            if (status != null)
            {
                lblStatusResult.Text = "✅ Current Status: " + status.ToString();
                lblStatusResult.CssClass = "text-Black fw-bold";
            }
            else
            {
                lblStatusResult.Text = "❌ No booking found with this ID.";
                lblStatusResult.CssClass = "text-danger fw-bold";
            }
            con.Close();
        }
    }
}