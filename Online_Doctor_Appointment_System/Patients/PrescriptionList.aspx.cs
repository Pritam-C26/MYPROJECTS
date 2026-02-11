using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appointment_System.Patients
{
    public partial class PrescriptionList : System.Web.UI.Page
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

                LoadPrescriptionList();
            }
        }


        private void LoadPrescriptionList()
        {
            int patientID = Convert.ToInt32(Request.Cookies["PatientID"].Value);
           

            string query = @"SELECT PatientID,PrescriptionID,AppointmentID,CreateAt from Prescription WHERE PatientID=@PatientID ORDER BY CreateAt DESC ";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@PatientID", patientID);
           

            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvPrescriptions.DataSource= dt;
            gvPrescriptions.DataBind();
            con.Close();
           

           
        }
    }
}