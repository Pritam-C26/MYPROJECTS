using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Online_Car_Store.Admin
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=CarStore;Integrated Security=True;Encrypt=True;TrustServerCertificate=True");
        protected void Page_Load(object sender, EventArgs e)
        {

            if(Request.Cookies["AdminId"] == null)
            {
                Response.Redirect("../Admin/AdminLogin.aspx");
            }



            if (!IsPostBack)
            {
                LoadCars();
                LoadBookings();
                LoadUsers();
                LoadSubscribers();

            }
        }



        private void LoadCars()
        {
            string query = @"SELECT COUNT(*) FROM Cars";
            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();
            lblTotalCars.Text =cmd.ExecuteScalar().ToString();
            con.Close();
        }
        
        private void LoadBookings()
        {
           string query = @"SELECT COUNT(*) FROM CarBookingForPurchase";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            lblTotalBookings.Text = cmd.ExecuteScalar().ToString();
            con.Close();
            
        }
        private void LoadUsers()
        {
            string query = @"SELECT COUNT(*) FROM Customers";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();   
            lblActiveUsers.Text =cmd.ExecuteScalar().ToString();
            con.Close();
        }

        private void LoadSubscribers()
        {
            string query = @"SELECT COUNT(*) FROM Subscribe";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            lblSubscribers.Text = cmd.ExecuteScalar().ToString();
            con.Close();
            
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