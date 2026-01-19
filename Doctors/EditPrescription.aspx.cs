using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appointment_System.Doctors
{
    public partial class EditPrescription : System.Web.UI.Page
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
                LoadPrescription();
            }
        }




        private void LoadPrescription()
        {
            if (Request.QueryString["PrescriptionID"] == null)
            {
                Response.Redirect("~/Doctors/PrescriptionList.aspx");
                return;
            }

            int prescriptionId = Convert.ToInt32(Request.QueryString["PrescriptionID"]);
            int doctorId = Convert.ToInt32(Session["DoctorID"]);

            string query = @"
        SELECT
            pa.FullName AS PatientName,
            pa.Age,
            p.Diagnosis,
            p.Medicines,
            p.Advice,
            d.FullName AS DoctorName,
            p.CreateAt
        FROM Prescription p
        INNER JOIN Patients pa ON pa.PatientID = p.PatientID
        INNER JOIN Doctors d ON d.DoctorID = p.DoctorID
        WHERE p.PrescriptionID = @PrescriptionID
        AND p.DoctorID = @DoctorID";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@PrescriptionID", prescriptionId);
            cmd.Parameters.AddWithValue("@DoctorID", doctorId);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                lblDoctorName.Text = reader["DoctorName"].ToString();
                lblPatientName.Text = reader["PatientName"].ToString();
                lblAge.Text = reader["Age"].ToString();
                lblDate.Text = Convert.ToDateTime(reader["CreateAt"]).ToString("dd-MM-yyyy");
                txtDiagnosis.Text = reader["Diagnosis"].ToString();
                txtMedicines.Text = reader["Medicines"].ToString();
                txtAdvice.Text = reader["Advice"].ToString();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert","alert('No record found. Check PrescriptionID or DoctorID');", true);

                Response.Redirect("~/Doctors/PrescriptionList.aspx");
            }

            con.Close();
        }



        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/Doctors/DoctorLogin.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int prescriptionId = Convert.ToInt32(Request.QueryString["PrescriptionID"]);
            int doctorId = Convert.ToInt32(Session["DoctorID"]);

            string update = @"UPDATE Prescription SET Diagnosis = @Diagnosis,
                            Medicines = @Medicines, Advice=@Advice WHERE PrescriptionID= @PrescriptionID
                             AND DoctorID = @DoctorID";

            SqlCommand cmd = new SqlCommand(update, con);
            cmd.Parameters.AddWithValue("@Diagnosis", txtDiagnosis.Text);
            cmd.Parameters.AddWithValue("@Medicines", txtMedicines.Text);
            cmd.Parameters.AddWithValue("@Advice", txtAdvice.Text);
            cmd.Parameters.AddWithValue("@DoctorID", doctorId);
            cmd.Parameters.AddWithValue("@PrescriptionID", prescriptionId);

            con.Open();
            int row = cmd.ExecuteNonQuery();
            con.Close();

            if (row > 0)
            {
                Response.Redirect("~/Doctors/PrescriptionList.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Unauthorized update attempt..!');", true);
            }
        }
    }
}