using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceryStore.Admin
{
    public partial class ManageOrders : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=GroceryStoreDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] == null)
                {
                    Response.Redirect("../Admin/AdminLogin.aspx");
                }
                loadOrders();
            }

        }


        private void loadOrders()
        {
            string loadquery = "SELECT OrderID,Name,Email,Phone,Address,PaymentMethod,OrderStatus,OrderDate FROM Orders ";
            SqlCommand cmd = new SqlCommand(loadquery, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();

            da.Fill(dt);

            gvOrders.DataSource = dt;
            gvOrders.DataBind();
        }


        protected void gvOrders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string orderId = e.CommandArgument.ToString();
            string Newstatus = "";


            switch (e.CommandName)
            {
                case "Shipped":

                    Newstatus = "Shipped";

                break;

                case "OutForDelivery":

                    Newstatus = "Out For Delivery";

                break;

                case "Delivered":

                    Newstatus = "Delivered";

                break;
            }


            if(!String.IsNullOrEmpty(Newstatus))
            {
                UpdateStatus(orderId, Newstatus);
                loadOrders();
            }

        }

        private void UpdateStatus(string orderId, string status)
        {
            string updatequery = "UPDATE Orders SET OrderStatus=@Status WHERE OrderID=@OrderID";
            SqlCommand cmd = new SqlCommand(updatequery, con);


            cmd.Parameters.AddWithValue("@OrderID", orderId);
            cmd.Parameters.AddWithValue("@Status", status);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


        }

         

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();

            Response.Redirect("../Admin/AdminLogin.aspx");
        }
    }
}