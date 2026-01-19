using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appointment_System.Patients
{
    public partial class ViewPrescription : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-K5S8RJV\SQLEXPRESS;Initial Catalog=DoctorAppoinmentDB;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Request.Cookies["PatientID"] == null)
                {
                    Response.Redirect("PatientLogin.aspx");

                }
                else if (Request.QueryString["PrescriptionID"] == null)
                {
                        Response.Redirect("PrescriptionList.aspx");
                }

                
                doctorDetails();
                LoadPrescriptionDetails();
            }

        }

        private void doctorDetails()
        {

            if (Request.QueryString["PrescriptionID"] == null)
                return;
            int prescriptionID = Convert.ToInt32(Request.QueryString["PrescriptionID"]);
            

            string query = @"SELECT d.FullName AS DoctorName,d.Specialization,d.PhoneNumber FROM Doctors d
                            JOIN Prescription p ON d.DoctorID = p.DoctorID
                            WHERE p.PrescriptionID = @PrescriptionID";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@PrescriptionID", prescriptionID);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                lblDoctorName.Text = reader["DoctorName"].ToString();
                lblSpecialization.Text = reader["Specialization"].ToString();
                lblDoctorPhone.Text = reader["PhoneNumber"].ToString();
            }
            con.Close();

        }

        private void LoadPrescriptionDetails()
        {
            int prescriptionID = Convert.ToInt32(Request.QueryString["PrescriptionID"]);

            string loadPrescription = @"SELECT p.FullName,p.Age,pr.Diagnosis,pr.Medicines,pr.Advice,pr.CreateAt
                                     FROM Patients p JOIN Prescription pr ON p.PatientID = pr.PatientID
                                      WHERE pr.PrescriptionID = @PrescriptionID";
            SqlCommand cmd = new SqlCommand(loadPrescription, con);

            cmd.Parameters.AddWithValue("@PrescriptionID", prescriptionID);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                lblPatientName.Text = reader["FullName"].ToString();
                lblAge.Text = reader["Age"].ToString();
                lblDate.Text = reader["CreateAt"].ToString();
                txtDiagnosis.Text = reader["Diagnosis"].ToString();
                txtMedicines.Text = reader["Medicines"].ToString();
                txtAdvice.Text = reader["Advice"].ToString();
            }
            reader.Close();
            con.Close();
        }


        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("PrescriptionList.aspx");
        }
    }
}