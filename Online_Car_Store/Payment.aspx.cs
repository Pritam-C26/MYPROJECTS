 using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Online_Car_Store
{
    public partial class Payment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-D4Q5GRH\SQLEXPRESS;Initial Catalog=CarStore;Integrated Security=True;TrustServerCertificate=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["BookingId"] != null)
                {
                    int bookingId = Convert.ToInt32(Request.QueryString["BookingId"]);
                    LoadBookingDetails(bookingId);
                }
                else
                {
                    Response.Redirect("CarBookings.aspx");
                }
            }
        }

        private void LoadBookingDetails(int bookingId)
        {
            string query = @"SELECT cb.BookingId,cb.CarId,cb.UserId,cb.BookingAmount,c.CarName
                             FROM CarBookingForPurchase cb
                             INNER JOIN Cars c ON cb.CarId=c.CarId
                             INNER JOIN Customers cu ON cb.UserId=cu.UserId
                             WHERE cb.BookingId=@BookingId";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@BookingId", bookingId);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblBookingId.Text = dr["BookingId"].ToString();
                lblCarName.Text = dr["CarName"].ToString();
                lblBookingAmount.Text = "$" + Convert.ToDecimal(dr["BookingAmount"]).ToString("C");
                hfCarId.Value = dr["CarId"].ToString();
                hfUserId.Value = dr["UserId"].ToString();
            }
            con.Close();
        }

        private string GetSelectPaymentMethod()
        {
            if (rdbCard.Checked)
            {
                return "Card";
            }
            else if (rdbNetBanking.Checked)
            {
                return "Net Banking";
            }
            else if (rdbUPI.Checked)
            {
                return "UPI";
            }
            else
            {
                return "Unknown";
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            int bookingId = Convert.ToInt32(lblBookingId.Text);
            int carId = Convert.ToInt32(hfCarId.Value);
            int userId = Convert.ToInt32(hfUserId.Value);
            decimal bookingAmount = Convert.ToDecimal(lblBookingAmount.Text.Replace("$", "").Trim());

            string paymentMethod = GetSelectPaymentMethod();
            string paymentDetails = "";

            // Collect payment details based on method
            if (paymentMethod == "Card")
            {
                paymentDetails = "Card Ending:XXXX-XXXX-XXXX-" + txtCardNumber.Text.Substring(txtCardNumber.Text.Length - 4);
                                
            }
            else if (paymentMethod == "UPI")
            {
                paymentDetails = "UPI ID: " + txtUPI.Text.Trim();
            }
            else if (paymentMethod == "Net Banking")
            {
                paymentDetails = "Bank: " + ddlBank.SelectedValue;
            }
            else
            {
                paymentDetails = "No details provided";
            }

            // Insert into Payments table including PaymentDetails
            string query = @"INSERT INTO Payments(BookingId,CarId,UserId,BookingAmount,PaymentDate,PaymentStatus,PaymentMode,PaymentDetails)
                             VALUES(@BookingId,@CarId,@UserId,@BookingAmount,@PaymentDate,@PaymentStatus,@PaymentMode,@PaymentDetails)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@BookingId", bookingId);
            cmd.Parameters.AddWithValue("@CarId", carId);
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@BookingAmount", bookingAmount);
            cmd.Parameters.AddWithValue("@PaymentDate", DateTime.Now);
            cmd.Parameters.AddWithValue("@PaymentStatus", "Pending");
            cmd.Parameters.AddWithValue("@PaymentMode", paymentMethod);
            cmd.Parameters.AddWithValue("@PaymentDetails", paymentDetails);

            con.Open();
            int result = cmd.ExecuteNonQuery();
            con.Close();

            // Update PaymentStatus to Complete (you may want to change logic in real-world scenarios)
            string updateQuery = @"UPDATE Payments SET PaymentStatus='Complete' WHERE BookingId=@BookingId";
            SqlCommand updateCmd = new SqlCommand(updateQuery, con);
            updateCmd.Parameters.AddWithValue("@BookingId", bookingId);
            con.Open();
            updateCmd.ExecuteNonQuery();
            con.Close();

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Payment Successful!');window.location='Recipt.aspx?BookingId=" + bookingId + "';", true);
        }
    }
}
