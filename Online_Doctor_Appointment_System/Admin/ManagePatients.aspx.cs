using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appointment_System.Admin
{
    public partial class ManagePatients : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-K5S8RJV\SQLEXPRESS;Initial Catalog=DoctorAppoinmentDB;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Role"] == null)
                {
                    Response.Redirect("~/Admin/AdminLogin.aspx");
                    return;
                }
                lblAdminName.Text = Session["FullName"].ToString();
                LoadPatients();
            }
        }

        private void LoadPatients()
        {
            string loadquery= @"SELECT PatientID, FullName AS PatientName,Email,Gender,Age,Phone,Status FROM Patients";
            SqlCommand cmd = new SqlCommand(loadquery, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            gvPatients.DataSource = reader;
            gvPatients.DataBind();
            con.Close();
        }


        protected void gvPatients_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int patientId = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "BlockPatient")
            {
                string blockquery = @"UPDATE Patients SET Status='Blocked' WHERE PatientID=@patientId";
                SqlCommand cmd = new SqlCommand(blockquery, con);
                cmd.Parameters.AddWithValue("@patientId", patientId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else if (e.CommandName == "UnblockPatient")
            {
                string unblockquery = @"UPDATE Patients SET Status='Active' WHERE PatientID=@patientId";
                SqlCommand cmd = new SqlCommand(unblockquery, con);
                cmd.Parameters.AddWithValue("@patientId", patientId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            LoadPatients();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/Admin/AdminLogin.aspx");
        }
    }
}