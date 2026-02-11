using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appointment_System.Patients
{
    public partial class BookAppointment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-K5S8RJV\SQLEXPRESS;Initial Catalog=DoctorAppoinmentDB;Integrated Security=True");

        // to store booked dates globally
        List<DateTime> bookedDates;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["PatientID"] == null || Request.Cookies["Email"] == null)
                {
                    Response.Redirect("~/Index.aspx");
                }

                ddlTimeSlots.Items.Clear();
                ddlTimeSlots.Items.Add("09:00 AM");
                ddlTimeSlots.Items.Add("10:00 AM");
                ddlTimeSlots.Items.Add("11:00 AM");
                ddlTimeSlots.Items.Add("12:00 PM");
                ddlTimeSlots.Items.Add("02:00 PM");
                ddlTimeSlots.Items.Add("03:00 PM");
                ddlTimeSlots.Items.Add("04:00 PM");


                int doctorId=Convert.ToInt32(Request.QueryString["DoctorID"]);
                LoadDoctor(doctorId);
                LoadBookDates();

            }
        }

        // load doctor details

        void LoadDoctor(int doctorId)
        {
            string loadDoctor = "SELECT FullName AS DoctorName,Specialization,ConsultationFee AS Fee,AvailableDays FROM Doctors WHERE DoctorID=@DoctorID";
            SqlCommand loadDoctorCmd = new SqlCommand(loadDoctor, con);

            loadDoctorCmd.Parameters.AddWithValue("@DoctorID", doctorId);

            try
            {
                con.Open();
                SqlDataReader reader = loadDoctorCmd.ExecuteReader();
                if (reader.Read())
                {
                    lblDoctorName.Text = reader["DoctorName"].ToString();
                    lblSpecialization.Text = reader["Specialization"].ToString();
                    lblFee.Text = reader["Fee"].ToString();

                    //store Available Days for later use
                    ViewState["AvailableDays"] = reader["AvailableDays"].ToString();
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                string script = $"alert('Error: {ex.Message.Replace("'", "\\'")}');";
                ClientScript.RegisterStartupScript(this.GetType(), "errorAlert", script, true);
            }
            finally
            {
                con.Close();
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            string availableDays = ViewState["AvailableDays"] as string;
            DayOfWeek selectedDay = Calendar1.SelectedDate.DayOfWeek;
            if (!availableDays.Contains(selectedDay.ToString()))
            {
                string script = "alert('The selected doctor is not available on the chosen date. Please select a different date.');";
                ClientScript.RegisterStartupScript(this.GetType(), "availabilityAlert", script, true);
                Calendar1.SelectedDate = DateTime.MinValue; // Clear selection
                return;
            }

            LoadTimeSlotForSelectedDate(Calendar1.SelectedDate);

        }

        // Load booked dates from database
        private void LoadBookDates()
        {
            bookedDates = new List<DateTime>();

            string getBookedDates = "SELECT AppointmentDate,COUNT(*) AS TotalBooking FROM Appointments WHERE DoctorID=@DoctorID GROUP BY AppointmentDate";
            SqlCommand getBookedDatesCmd = new SqlCommand(getBookedDates, con);
            int doctorId = Convert.ToInt32(Request.QueryString["DoctorID"]);
            getBookedDatesCmd.Parameters.AddWithValue("@DoctorID", doctorId);

            try
            {
                con.Open();
                SqlDataReader reader = getBookedDatesCmd.ExecuteReader();
                while (reader.Read())
                {
                    int count = Convert.ToInt32(reader["TotalBooking"]);
                    if (count >= 7)
                    {
                        bookedDates.Add(Convert.ToDateTime(reader["AppointmentDate"]));
                    }
                    
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                string script = $"alert('Error: {ex.Message.Replace("'", "\\'")}');";
                ClientScript.RegisterStartupScript(this.GetType(), "errorAlert", script, true);
            }
            finally
            {
                con.Close();
            }

        }

        protected void Calender1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (bookedDates == null)
            {
                LoadBookDates();
            }
            // Disable booked dates
            if (bookedDates.Contains(e.Day.Date))
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.Red;
                e.Cell.ToolTip = "This date is fully booked.";
            }
            // Disable past dates
            if (e.Day.Date < DateTime.Today)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.LightGray;
            }
        }



        protected void btnLogout_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["PatientID"] != null && Request.Cookies["Email"] != null)
            {
                HttpCookie patientidCookie = new HttpCookie("PatientID");
                patientidCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(patientidCookie);
                Response.Redirect("~/Index.aspx");
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            if (Calendar1.SelectedDate == DateTime.MinValue)
            {
                lblMessage.Text = "Please select a valid date.";
                return;
            }

            if (ddlTimeSlots.SelectedItem == null)
            {
                lblMessage.Text = "Please select a time slot.";
                return;
            }

            string selectedDate = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
            string selectedTime = ddlTimeSlots.SelectedItem.Text;
            string selectedDay = Calendar1.SelectedDate.ToString("dddd");

            int patientId = Convert.ToInt32(Request.Cookies["PatientID"].Value);
            int doctorId = Convert.ToInt32(Request.QueryString["DoctorID"]);

            // Check if this time slot is already booked
            string checkQuery = @"SELECT COUNT(*) FROM Appointments
                          WHERE DoctorID = @DoctorID 
                            AND AppointmentDate = @AppointmentDate 
                            AND TimeSlot = @TimeSlot 
                            AND Status = 'Booked'";

            SqlCommand checkCmd = new SqlCommand(checkQuery, con);
            checkCmd.Parameters.AddWithValue("@DoctorID", doctorId);
            checkCmd.Parameters.AddWithValue("@AppointmentDate", selectedDate);
            checkCmd.Parameters.AddWithValue("@TimeSlot", selectedTime);

            con.Open();
            int existingCount = Convert.ToInt32(checkCmd.ExecuteScalar());
            con.Close();

            if (existingCount > 0)
            {
                lblMessage.Text = "This time slot is already booked. Please select another time.";
                return;
            }

            //  Insert and get AppointmentID (only once)
            string bookAppointment = @"
        INSERT INTO Appointments 
            (PatientID, DoctorID, AppointmentDay, TimeSlot, AppointmentDate, Status) 
        VALUES 
            (@PatientID, @DoctorID, @AppointmentDay, @TimeSlot, @AppointmentDate, @Status);
        SELECT SCOPE_IDENTITY();";

            SqlCommand bookAppointmentCmd = new SqlCommand(bookAppointment, con);

            bookAppointmentCmd.Parameters.AddWithValue("@PatientID", patientId);
            bookAppointmentCmd.Parameters.AddWithValue("@DoctorID", doctorId);
            bookAppointmentCmd.Parameters.AddWithValue("@AppointmentDay", selectedDay);
            bookAppointmentCmd.Parameters.AddWithValue("@TimeSlot", selectedTime);
            bookAppointmentCmd.Parameters.AddWithValue("@AppointmentDate", selectedDate);
            bookAppointmentCmd.Parameters.AddWithValue("@Status", "Booked");

            con.Open();
            int appointmentId = Convert.ToInt32(bookAppointmentCmd.ExecuteScalar()); 
            con.Close();

            // lblMessage.Text = "Appointment booked successfully!";  

            Response.Redirect("~/Patients/BookAppointmentConfirm.aspx?AppointmentId=" + appointmentId);
        }


        // for all selected timeslot

        private void LoadTimeSlotForSelectedDate(DateTime selectedDate)
        {
            List<string> allSlots = new List<string>
            {
                "09:00 AM",
                "10:00 AM",
                "11:00 AM",
                "12:00 PM",
                "02:00 PM",
                "03:00 PM",
                "04:00 PM"
            };

            ddlTimeSlots.Items.Clear();
            foreach (string slot in allSlots)
            {
                ddlTimeSlots.Items.Add(new ListItem(slot, slot));
            }


            //Get booked slot for that date

            string query = @"SELECT TimeSlot FROM Appointments WHERE DoctorID=@DoctorID
                             AND AppointmentDate=@AppointmentDate AND Status='Booked'";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@DoctorID", Convert.ToInt32(Request.QueryString["DoctorID"]));
            cmd.Parameters.AddWithValue("@AppointmentDate", selectedDate.ToString("yyyy.MM.dd"));


            List<string> bookedslots = new List<string>();
            try
            {
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    bookedslots.Add(rdr["TimeSlot"].ToString());

                }
                rdr.Close();
            }
            finally
            {
                con.Close();
            }
         
            

            //disable the booked options in dropdown

            foreach(ListItem item in ddlTimeSlots.Items)
            {
                if (bookedslots.Contains(item.Value))
                {
                    item.Attributes.Add("disabled", "disabled");
                    item.Text += "(Booked)";
                }
            }
        }
    }
}