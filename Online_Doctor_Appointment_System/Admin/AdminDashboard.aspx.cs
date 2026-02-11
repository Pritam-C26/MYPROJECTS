using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appointment_System.Admin
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-K5S8RJV\SQLEXPRESS;Initial Catalog=DoctorAppoinmentDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Role"] == null )
                {
                    Response.Redirect("~/Admin/AdminLogin.aspx");
                    return;
                }

                lblAdminName.Text = Session["FullName"].ToString();
                LoadCount();
                LoadAppointments();
            }

        }
    
        private void LoadCount()
        {
            con.Open();

            lblDoctors.Text = ExecuteCount("SELECT COUNT(*) FROM Doctors");
            lblAppointments.Text = ExecuteCount("SELECT COUNT(*) FROM Appointments");
            lblPatients.Text = ExecuteCount("SELECT COUNT(*) FROM Patients");

            lblToday.Text = ExecuteCount("SELECT COUNT(*) FROM Appointments WHERE AppointmentDate=CAST(GETDATE() AS DATE)");
            con.Close();
        }
        string ExecuteCount(string query)
        {
            SqlCommand cmd = new SqlCommand(query, con);
            return cmd.ExecuteScalar().ToString();
        }


            void LoadAppointments()
            {
                SqlCommand cmd = new SqlCommand(
                    @"SELECT TOP 5 
                  p.FullName AS PatientName,
                  d.FullName AS DoctorName,
                  a.AppointmentDate,
                  a.Status
                  FROM Appointments a
                  JOIN Patients p ON a.PatientID=p.PatientID
                  JOIN Doctors d ON a.DoctorID=d.DoctorID
                  ORDER BY a.AppointmentDate DESC", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                var dt = new System.Data.DataTable();
                da.Fill(dt);
                gvAppointments.DataSource = dt;
                gvAppointments.DataBind();
            }
        


        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/Admin/AdminLogin.aspx");
        }
    }
}