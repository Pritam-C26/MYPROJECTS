using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace GroceryStore
{
    public partial class Orders : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-D4Q5GRH\SQLEXPRESS;Initial Catalog=GroceryStoreDB;Integrated Security=True;Encrypt=False");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check login status
                if (Request.Cookies["UserID"] != null)
                {
                    btnLoginLogout.Text = "Logout";
                    lblWelcome.Text = "Welcome, " + Request.Cookies["Name"].Value;
                }
                else
                {
                    btnLoginLogout.Text = "Login";
                    lblWelcome.Text = "Welcome, Guest";
                    btnLoginLogout.PostBackUrl = "Login.aspx";
                }

                BindOrders();
            }
        }

        private void BindOrders()
        {
            try
            {
                string userID = Request.Cookies["UserID"]?.Value;
                if (string.IsNullOrEmpty(userID))
                {
                    lblMessage.Text = "User not logged in.";
                    return;
                }

                // Fetch orders for logged-in user
                string query = @"SELECT o.OrderID, o.Name, o.PaymentMethod, o.OrderStatus, o.OrderDate, p.Image
                                 FROM Orders o
                                 INNER JOIN Products p ON o.ProductID = p.ProductID
                                 WHERE o.UserID = @UserID
                                 ORDER BY o.OrderDate DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserID", userID);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    rptOrders.DataSource = dt;
                    rptOrders.DataBind();
                    lblMessage.Text = "";
                }
                else
                {
                    rptOrders.DataSource = null;
                    rptOrders.DataBind();
                    lblMessage.Text = "No orders found.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading orders: " + ex.Message;
            }
        }

        protected void rptOrders_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            // Handle appearance of each order item
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                string status = row["OrderStatus"].ToString();

                Label lblStatus = (Label)e.Item.FindControl("lblStatus");
                Panel pnlCancel = (Panel)e.Item.FindControl("pnlCancel");

                // Status display logic
                if (status == "Cancelled")
                {
                    lblStatus.Text = "Cancelled";
                    lblStatus.CssClass = "badge bg-danger p-2";
                    pnlCancel.Visible = false;
                }
                else if (status == "Delivered")
                {
                    lblStatus.Text = "Delivered";
                    lblStatus.CssClass = "badge bg-success p-2";
                    pnlCancel.Visible = false;
                }
                else if (status == "Shipped" || status == "Out For Delivery")
                {
                    lblStatus.Text = status;
                    lblStatus.CssClass = "badge bg-info text-dark p-2";
                    pnlCancel.Visible = false;
                }
                else
                {
                    lblStatus.Text = "Ordered";
                    lblStatus.CssClass = "badge bg-warning text-dark p-2";
                    pnlCancel.Visible = true;
                }
            }
        }

        protected void rptOrders_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "CancelOrder")
            {
                int orderID = Convert.ToInt32(e.CommandArgument);
                CancelOrder(orderID);
            }
        }

        private void CancelOrder(int orderID)
        {
            try
            {
                string query = "UPDATE Orders SET OrderStatus = 'Cancelled' WHERE OrderID = @OrderID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@OrderID", orderID);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "Order cancelled successfully.";
                lblMessage.CssClass = "text-success";

                BindOrders(); // Refresh the list
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error cancelling order: " + ex.Message;
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
            }
        }
    }
}
