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
    public partial class Reports : System.Web.UI.Page
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

                loadFeedBack();
                loadSubscribers();

            }
        }




        private void loadSubscribers()
        {
            string subscriberquery = @"SELECT * FROM Subscribers";
            SqlCommand cmd = new SqlCommand(subscriberquery, con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);


            gvSubscribers.DataSource = dt;
            gvSubscribers.DataBind();
        }

        private void loadFeedBack()
        {
            string feedbackquery = @"SELECT * FROM Feedback";
            SqlCommand cmd = new SqlCommand(feedbackquery, con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvFeedback.DataSource = dt;
            gvFeedback.DataBind();
        }



        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();

            Response.Redirect("../Admin/AdminLogin.aspx");
        }
    }
}