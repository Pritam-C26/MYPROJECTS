using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appointment_System.Admin
{
    public partial class ManageDoctors : System.Web.UI.Page
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
                LoadDoctors();
            }
        }

        protected void gvDoctors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int doctorId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "BlockDoctor")
            {
                string blockquery = @"UPDATE Doctors SET Status='Blocked' WHERE DoctorID=@doctorId";
                SqlCommand cmd = new SqlCommand(blockquery, con);
                cmd.Parameters.AddWithValue("@doctorId", doctorId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else if(e.CommandName == "UnblockDoctor")
            {
                string unblockquery = @"UPDATE Doctors SET Status='Active' WHERE DoctorID=@doctorId";
                SqlCommand cmd = new SqlCommand(unblockquery, con);
                cmd.Parameters.AddWithValue("@doctorId", doctorId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();   
            }
            LoadDoctors();
        }

        private void LoadDoctors()
        {
            string query = "SELECT DoctorID, FullName AS DoctorName,ExperienceYears,Specialization,Status FROM Doctors";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            gvDoctors.DataSource = reader;
            gvDoctors.DataBind();
            con.Close();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/Admin/AdminLogin.aspx");
        }
    }
}