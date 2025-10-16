using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Car_Store
{ 
    public partial class Recipt : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-D4Q5GRH\SQLEXPRESS;Initial Catalog=CarStore;Integrated Security=True;TrustServerCertificate=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                printRecipt();
            }
        }


        private void printRecipt()
        {
            int bookingId = Convert.ToInt32(Request.QueryString["bookingId"]);
            string query = @"select cu.FullName, c.CarName, c.Brand, c.Model, cb.TotalPrice, cb.RemainingAmount, cb.BookingDate,
                            p.BookingAmount, p.PaymentDate, p.PaymentMode
                            from CarBookingForPurchase cb
                            join Customers cu on cb.UserId = cu.UserId
                            join Cars c on cb.CarId = c.CarId
                            join Payments p on cb.BookingId = p.BookingId
                            where cb.BookingId = @BookingId";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@BookingId", bookingId);
           
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {

                lblCustomerName.Text = reader["FullName"].ToString();
                lblCarName.Text = reader["CarName"].ToString();
                lblBrand.Text = reader["Brand"].ToString();
                lblModel.Text = reader["Model"].ToString();
                lblTotalPrice.Text = reader["TotalPrice"].ToString();
                lblBookingAmount.Text = reader["BookingAmount"].ToString();
                lblRemainingAmount.Text = reader["RemainingAmount"].ToString();
                lblBookingDate.Text = reader["BookingDate"].ToString();
                lblPaymentDate.Text = reader["PaymentDate"].ToString();
                lblPaymentMode.Text = reader["PaymentMode"].ToString();

            }
            else
            {
                Response.Write("<script>alert('Booking not found');</script>");
            }

            con.Close();
        }
    }
}