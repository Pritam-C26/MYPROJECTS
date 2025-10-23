using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace GroceryStore
{
    public partial class Checkout : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
            @"Data Source=DESKTOP-D4Q5GRH\SQLEXPRESS;Initial Catalog=GroceryStoreDB;Integrated Security=True;Encrypt=False");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["UserID"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                if (Session["TotalAmount"] != null)
                    lblTotalAmount.Text = "₹" + Convert.ToDecimal(Session["TotalAmount"]).ToString("0.00");
                else
                    lblTotalAmount.Text = "Total Amount: ₹0.00";
            }
        }

        private string GetSelectedPaymentMethod()
        {
            if (rdbCard.Checked) return "Card";
            if (rdbUPI.Checked) return "UPI";
            if (rdbCOD.Checked) return "Cash on Delivery";
            if (rdbNetBanking.Checked) return "Net Banking";
            return null;
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string address = txtAddress.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string city = txtCity.Text.Trim();
            string postalCode = txtPostalCode.Text.Trim();
            string paymentMethod = GetSelectedPaymentMethod();
            string paymentDetails = "";

            // ✅ Get Total Amount 
            decimal totalAmount = 0;
            if (Session["TotalAmount"] != null)
                totalAmount = Convert.ToDecimal(Session["TotalAmount"]);

            // ✅ Get UserID 
            int userID = 0;
            if (Request.Cookies["UserID"] != null && !string.IsNullOrEmpty(Request.Cookies["UserID"].Value))
            {
                userID = Convert.ToInt32(Request.Cookies["UserID"].Value);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Please login before placing an order.');window.location='Login.aspx';", true);
                return;
            }

            // ✅ Get ProductID 
            int productID = 0;
            if (Request.Cookies["ProductID"] != null && !string.IsNullOrEmpty(Request.Cookies["ProductID"].Value))
            {
                productID = Convert.ToInt32(Request.Cookies["ProductID"].Value);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('No product selected. Please add a product to cart first.');window.location='Products.aspx';", true);
                return;
            }

            // ✅ Validation
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(address) || string.IsNullOrEmpty(email)
                || string.IsNullOrEmpty(phone) || string.IsNullOrEmpty(city)
                || string.IsNullOrEmpty(postalCode) || string.IsNullOrEmpty(paymentMethod))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Please fill in all required fields and select a payment method.');", true);
                return;
            }

            // ✅ Set Payment Details
            if (paymentMethod == "Card")
            {
                string cardNum = txtCardNumber.Text.Trim();
                if (cardNum.Length >= 4)
                    paymentDetails = "Card Ending: xxxx-xxxx-xxxx-" + cardNum.Substring(cardNum.Length - 4);
                else
                    paymentDetails = "Card Payment";
            }
            else if (paymentMethod == "UPI")
                paymentDetails = "UPI ID: " + txtUPI.Text.Trim();
            else if (paymentMethod == "Net Banking")
                paymentDetails = "Bank: " + ddlBank.SelectedValue;
            else
                paymentDetails = "Cash on Delivery";

            try
            {
                con.Open();

                // ✅ Insert into Orders table
                string insertOrderQuery = @"INSERT INTO Orders 
            (UserID, ProductID, Name, Email, Phone, Address, City, PostalCode, 
             PaymentMethod, PaymentDetails, TotalAmount, OrderDate, OrderStatus)
             VALUES 
             (@UserID, @ProductID, @Name, @Email, @Phone, @Address, @City, @PostalCode, 
              @PaymentMethod, @PaymentDetails, @TotalAmount, @OrderDate, @OrderStatus)";

                SqlCommand cmd = new SqlCommand(insertOrderQuery, con);
                cmd.Parameters.AddWithValue("@UserID", userID);
                cmd.Parameters.AddWithValue("@ProductID", productID);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@City", city);
                cmd.Parameters.AddWithValue("@PostalCode", postalCode);
                cmd.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
                cmd.Parameters.AddWithValue("@PaymentDetails", paymentDetails);
                cmd.Parameters.AddWithValue("@TotalAmount", totalAmount);
                cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@OrderStatus", "Ordered");

                cmd.ExecuteNonQuery();

                // ✅ Clear the user's cart after order is placed
                SqlCommand clearCartCmd = new SqlCommand("DELETE FROM Cart WHERE UserID=@UserID", con);
                clearCartCmd.Parameters.AddWithValue("@UserID", userID);
                clearCartCmd.ExecuteNonQuery();

                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Your order has been placed successfully!');window.location='Orders.aspx';", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    $"alert('Error placing order: {ex.Message}');", true);
            }
            finally
            {
                if (con.State == System.Data.ConnectionState.Open)
                    con.Close();
            }
        }

    }
}
