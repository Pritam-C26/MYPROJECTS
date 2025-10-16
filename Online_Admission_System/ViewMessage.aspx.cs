using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Admission_System
{
    public partial class ViewMessage : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=OnlineAdmission;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
           if (!IsPostBack)
            {
                LoadMessages();
            }
        }


        private void LoadMessages()
        {
            string query = "SELECT * from ContactMessages";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd); // Use SqlDataAdapter
            DataTable dt = new DataTable();
            da.Fill(dt); // Fill the DataTable with data
            GridViewMessages.DataSource = dt; // Bind DataTable to GridView
            GridViewMessages.DataBind();
            con.Close();
        }
        protected void GridViewMessages_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            GridViewMessages.PageIndex = e.NewPageIndex;
            LoadMessages();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            if (Request.Cookies["Role"] == null || Request.Cookies["Role"].Value != "Admin")
            {
                HttpCookie myCookie = new HttpCookie("Role");
                myCookie.Expires = DateTime.Now.AddDays(-1); // expire immediately
                Response.Cookies.Add(myCookie);
            }

            // Redirect to login page
            Response.Redirect("Login.aspx");
        }
    }
}