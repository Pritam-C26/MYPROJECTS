using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceryStore.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=GroceryStoreDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                if(Session["Username"] == null)
                {
                    Response.Redirect("../Admin/AdminLogin.aspx");
                }

                loadDashboardData();
                loadOrders();
            }

        }


        private void loadDashboardData()
        {

            con.Open();

            string totalProducts = "SELECT COUNT(*) FROM Products";
            SqlCommand products = new SqlCommand(totalProducts, con);
            lblProducts.Text = products.ExecuteScalar().ToString();
           

            string totalOrders = "SELECT COUNT(*) FROM Orders";
            SqlCommand orders = new SqlCommand(totalOrders, con);
            lblOrders.Text = orders.ExecuteScalar().ToString();

            string cancelledOrder = "SELECT COUNT(*) FROM Orders WHERE OrderStatus='Cancelled'";
            SqlCommand cancelled = new SqlCommand(cancelledOrder, con);
            lblCancelled.Text = cancelled.ExecuteScalar().ToString();

            string totalDeliver = "SELECT COUNT(*) FROM Orders WHERE OrderStatus='Delivered'";
            SqlCommand delivered = new SqlCommand(totalDeliver, con);
            lblDelivered.Text = delivered.ExecuteScalar().ToString();

            con.Close();

        }

        private void loadOrders()
        {
            string loadquery ="SELECT OrderID, Name as CustomerName,TotalAmount,OrderDate,OrderStatus as Status FROM Orders ORDER BY OrderDate DESC";
            SqlCommand cmd = new SqlCommand(loadquery, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            da.Fill(dt);
            gvRecentOrders.DataSource = dt;
            gvRecentOrders.DataBind();

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();

            Response.Redirect("../Admin/AdminLogin.aspx");
        }
    }
}