using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appointment_System.Doctors
{
    public partial class WritePrescription : System.Web.UI.Page
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

                lblDoctorName.Text = Session["FullName"].ToString();
                lblDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                
                LoadPatient();
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/Doctors/DoctorLogin.aspx");
        }

        private void LoadPatient()
        {
            int appointmentID = Convert.ToInt32(Request.QueryString["AppointmentID"]);

            string query= @"select p.FullName,p.Age from Appointments a
                           join Patients p on a.PatientID=p.PatientID
                           where a.AppointmentID=@AppointmentID";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@AppointmentID", appointmentID);


            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                lblPatientName.Text = reader["FullName"].ToString();
                lblAge.Text = reader["Age"].ToString();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('No patient found!');", true);
            }

            con.Close();
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            int appointmentId = Convert.ToInt32(Request.QueryString["AppointmentID"]);
            int doctorId = Convert.ToInt32(Session["DoctorID"]);

            string insertquery = @"INSERT INTO Prescription(AppointmentID,DoctorID,Diagnosis,Medicines,Advice,CreateAt)
                                    VALUES(@AppointmentID,@DoctorID,@Diagnosis,@Medicines,@Advice,GETDATE())";
            SqlCommand cmd = new SqlCommand(insertquery, con);
            cmd.Parameters.AddWithValue("@AppointmentID", appointmentId);
            cmd.Parameters.AddWithValue("@DoctorID", doctorId);
            cmd.Parameters.AddWithValue("@Diagnosis", txtDiagnosis.Text);
            cmd.Parameters.AddWithValue("@Medicines",txtMedicines.Text);
            cmd.Parameters.AddWithValue("@Advice",txtAdvice.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Prescription Uploaded..!');", true);


            //Response.Redirect("Appointments.aspx");

        }
    }
}