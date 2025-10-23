using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceryStore
{
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-D4Q5GRH\SQLEXPRESS;Initial Catalog=GroceryStoreDB;Integrated Security=True;Encrypt=False");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["UserID"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }
                else
                {
                    btnLoginLogout.Text = "Logout";
                    lblWelcome.Text = "Welcome, " + Request.Cookies["Name"].Value;
                }

                loadCart();
            }

        }


        private void loadCart()
        {
            int userID = Convert.ToInt32(Request.Cookies["UserID"].Value);

            string query = @"SELECT * FROM Cart WHERE UserID = @userID";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@userID", userID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvCart.DataSource = dt;
            gvCart.DataBind();

            decimal total = 0;
            foreach (DataRow row in dt.Rows)
            {
                decimal price = Convert.ToDecimal(row["Price"]);
                int quantity = Convert.ToInt32(row["Quantity"]);
                total += price * quantity;
            }

            lblTotal.Text = "Total: ₹" + total.ToString("0.00");
            Session["TotalAmount"] = total;

            if (dt.Rows.Count == 0)
            {
                lblTotal.Text = "Your cart is empty.";
            }
        }

        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "RemoveItem")
            {
                int cartID = Convert.ToInt32(e.CommandArgument);

                string query = @"DELETE FROM Cart WHERE CartID=@CartID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CartID", cartID);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }


            loadCart();
        }



        protected void btnCheckOut_Click(object sender, EventArgs e)
        {

            decimal totalamount = 0;

            if (Session["TotalAmount"] != null)
            {
                totalamount = Convert.ToDecimal(Session["TotalAmount"]);
            }
            Response.Redirect("Checkout.aspx?total=" + totalamount);
        }
    }
}