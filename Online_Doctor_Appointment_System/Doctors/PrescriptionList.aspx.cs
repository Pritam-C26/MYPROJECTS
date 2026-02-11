using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appointment_System.Doctors
{
    public partial class PrescriptionList : System.Web.UI.Page
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
                LoadPrescriptions();
            }
           
        }

        void LoadPrescriptions()
        {
            string query = @"
                SELECT p.PrescriptionID,
                       pa.FullName AS PatientName,
                       pa.Age,
                       p.Diagnosis,
                       p.Medicines,
                       p.Advice,
                       p.CreateAt
                FROM Prescription p
                INNER JOIN Patients pa ON pa.PatientID = p.PatientID
                WHERE p.DoctorID = @DoctorID
                ORDER BY p.CreateAt DESC";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@DoctorID", Session["DoctorID"]);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvPrescriptions.DataSource = dt;
            gvPrescriptions.DataBind();
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/Doctors/DoctorLogin.aspx");
        }
    }
}