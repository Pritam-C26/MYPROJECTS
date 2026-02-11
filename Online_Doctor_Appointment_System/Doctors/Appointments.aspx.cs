using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appointment_System.Doctors
{
    public partial class Appointments : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-K5S8RJV\SQLEXPRESS;Initial Catalog=DoctorAppoinmentDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                if (Session["DoctorID"] == null)
                {
                    Response.Redirect("~/Doctors/DoctorLogin.aspx");
                }
             
               LoadAppointments();

            }
        }


        private void LoadAppointments()
        {
            string loadquery = @"SELECT a.AppointmentID, p.FullName AS PatientName,p.Age,a.AppointmentDate,a.TimeSlot,a.Status FROM Appointments a
                                INNER JOIN Patients p ON a.PatientID=p.PatientID
                                WHERE a.DoctorID=@DoctorID
                                AND a.Status='Booked'";
            
            SqlCommand cmd = new SqlCommand(loadquery, con);
            cmd.Parameters.AddWithValue("@DoctorID", Session["DoctorID"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvAppointments.DataSource = dt;
            gvAppointments.DataBind();

        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/Doctors/DoctorLogin.aspx");

        }
    }
}