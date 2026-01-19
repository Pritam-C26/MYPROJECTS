using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appointment_System.Patients
{
    public partial class PatientsDashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-K5S8RJV\SQLEXPRESS;Initial Catalog=DoctorAppoinmentDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bindDoctors();
            }

        }

        private void bindDoctors()
        {
            string doctorquery = "SELECT * FROM Doctors";
            SqlCommand doctorcmd = new SqlCommand(doctorquery, con);

            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(doctorcmd);
                DataTable dt = new DataTable();

                da.Fill(dt);
                rptDoctors.DataSource = dt;
                rptDoctors.DataBind();
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
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["PatientID"] != null && Request.Cookies["Email"] !=null)
            {
                HttpCookie patientidCookie = new HttpCookie("PatientID");
                patientidCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(patientidCookie);
                Response.Redirect("~/Index.aspx");
            }
        }
    }
}