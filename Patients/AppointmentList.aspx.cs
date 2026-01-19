using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appointment_System.Patients
{
    public partial class AppointmentList : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-K5S8RJV\SQLEXPRESS;Initial Catalog=DoctorAppoinmentDB;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["PatientID"] == null)
                {
                    Response.Redirect("PatientLogin.aspx");
                }
            }
            LoadAppointments();
        }

        private void LoadAppointments()
        {
            int patiendId = Convert.ToInt32(Request.Cookies["PatientID"].Value);
            int appointmentId = Convert.ToInt32(Request.QueryString["AppointmentID"]);

            string loadAppointments = @"SELECT * from Appointments WHERE PatientID=@PatientID ";
            SqlCommand cmd = new SqlCommand(loadAppointments, con);

            cmd.Parameters.AddWithValue("@PatientID", patiendId);
            cmd.Parameters.AddWithValue("@AppointmentID", appointmentId);

            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            da.Fill(dt);
            gvAppointments.DataSource = dt;
            gvAppointments.DataBind();
            con.Close();

        }
       
    }
}