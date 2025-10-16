using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Car_Store
{
    public partial class CarBooking : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-D4Q5GRH\SQLEXPRESS;Initial Catalog=CarStore;Integrated Security=True;TrustServerCertificate=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Request.QueryString["CarId"] != null)
                {
                    int carId = Convert.ToInt32(Request.QueryString["CarId"]);
                    LoadCarDetails(carId); 
                }
                else
                {
                    Response.Redirect("Cars.aspx"); 
                }
            }
        }

        private void LoadCarDetails(int carId)
        {
            
            SqlCommand cmd = new SqlCommand("SELECT CarName, Brand, Model, Price, ImagePath FROM Cars WHERE CarId=@CarId", con);
            cmd.Parameters.AddWithValue("@CarId", carId);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblCarName.Text = dr["CarName"].ToString();
                lblBrand.Text = dr["Brand"].ToString();
                lblModel.Text = dr["Model"].ToString();
                txtTotalPrice.Text = dr["Price"].ToString();
                imgCar.ImageUrl = dr["ImagePath"].ToString();
            }
            con.Close();
        }

        protected void btnConfirmBooking_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtBookingAmount.Text))
            {
                // Show alert if booking amount is empty
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a booking amount before proceeding.');", true);
                return;
            }

            if (Request.Cookies["UserId"] != null && !string.IsNullOrEmpty(Request.Cookies["UserId"].Value))
            {
                int userId = Convert.ToInt32(Request.Cookies["UserId"].Value);

                if (Request.QueryString["CarId"] != null && !string.IsNullOrEmpty(Request.QueryString["CarId"]))
                {
                    int carId = Convert.ToInt32(Request.QueryString["CarId"]);

                    string query = @"INSERT INTO CarBookingForPurchase 
                            (UserId, CarId, BookingDate, BookingAmount, TotalPrice, Status)
                            VALUES (@UserId, @CarId, @BookingDate, @BookingAmount, @TotalPrice, @Status);
                            SELECT SCOPE_IDENTITY();";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@CarId", carId);
                    cmd.Parameters.AddWithValue("@BookingDate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@BookingAmount", Convert.ToDecimal(txtBookingAmount.Text.Trim()));
                    cmd.Parameters.AddWithValue("@TotalPrice", Convert.ToDecimal(txtTotalPrice.Text.Trim()));
                    cmd.Parameters.AddWithValue("@Status", "Booked");

                    con.Open();
                    int bookingId = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();

                    ClientScript.RegisterStartupScript(this.GetType(), "redirect", "window.location='Payment.aspx?BookingId=" + bookingId + "';", true);
                }
                else
                {
                    Response.Redirect("Cars.aspx");
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cars.aspx");
        }
    }
}