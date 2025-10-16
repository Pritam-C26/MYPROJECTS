using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Car_Store.Admin
{
    public partial class PaymentList : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=CarStore;Integrated Security=True;Encrypt=True;TrustServerCertificate=True");
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.Cookies["AdminId"] == null)
            {
                Response.Redirect("../Admin/AdminLogin.aspx");
            }


            if (!IsPostBack)
            {
                paymentsLoad();
            }
        }

        private void paymentsLoad()
        {
            string query = @"SELECT p.PaymentId,p.BookingId,p.CarId,p.UserId,p.BookingAmount,cb.RemainingAmount,p.PaymentDate,p.PaymentStatus,p.PaymentMode,p.PaymentDetails
                            FROM Payments p
                            INNER JOIN CarBookingForPurchase cb ON p.BookingId=cb.BookingId";

            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);


            GridViewPayments.DataSource= dt;
            GridViewPayments.DataBind();
            con.Close();

        }
        protected void GridViewPayments_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewPayments.PageIndex = e.NewPageIndex;
            paymentsLoad();
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