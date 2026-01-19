using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Online_Doctor_Appointment_System.Patients
{
    public partial class BookAppointmentConfirm : Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-K5S8RJV\SQLEXPRESS;Initial Catalog=DoctorAppoinmentDB;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string appointmentId = Request.QueryString["AppointmentId"];

                if (!string.IsNullOrEmpty(appointmentId))
                {
                    LoadSuccessDetails(appointmentId);
                }
                else
                {
                    lblMessage.Text = "No appointment id provided.";
                }
            }
        }

        private void LoadSuccessDetails(string appointmentId)
        {
            try
            {
                con.Open();

                string query = @"
                    SELECT 
                        a.CreateAt,
                        a.AppointmentDate,
                        a.TimeSlot,
                        d.FullName AS DoctorName,
                        p.FullName AS PatientName,
                        p.PatientID,
                        p.Phone,
                        p.Age,
                        p.Gender
                    FROM Appointments a
                    JOIN Doctors d ON a.DoctorId = d.DoctorId
                    JOIN Patients p ON a.PatientId = p.PatientId
                    WHERE a.AppointmentId = @AppointmentID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // IMPORTANT: parameter name must match query
                    cmd.Parameters.AddWithValue("@AppointmentID", Convert.ToInt32(appointmentId));

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblBookedOn.Text = Convert.ToDateTime(reader["CreateAt"])
                                                .ToString("dd-MM-yyyy HH:mm");
                            lblDate.Text = Convert.ToDateTime(reader["AppointmentDate"])
                                            .ToString("dd-MM-yyyy");
                            lblTime.Text = reader["TimeSlot"].ToString();
                            lblDoctor.Text = reader["DoctorName"].ToString();
                            lblPatientName.Text = reader["PatientName"].ToString();
                            lblPatientID.Text = reader["PatientID"].ToString();
                            lblPhone.Text = reader["Phone"].ToString();
                            lblAge.Text = reader["Age"].ToString();
                            lblGender.Text = reader["Gender"].ToString();
                        }
                        else
                        {
                            lblMessage.Text = "Appointment not found.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error Loading Details: " + ex.Message;
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnAppointments_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Patients/MyAppointments.aspx");
        }
    }
}
