using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appointment_System.Admin
{
    public partial class Appointments : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-K5S8RJV\SQLEXPRESS;Initial Catalog=DoctorAppoinmentDB;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Role"] == null)
                {
                    Response.Redirect("~/Admin/AdminLogin.aspx");
                    return;
                }
                lblAdminName.Text = Session["FullName"].ToString();
                LoadAppointments();
            }
        }

        private void LoadAppointments()
        {
            string query = "SELECT * FROM Appointments ORDER BY AppointmentDate DESC";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            gvAppointments.DataSource = reader;
            gvAppointments.DataBind();
            con.Close();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/Admin/AdminLogin.aspx");
        }
    }
}