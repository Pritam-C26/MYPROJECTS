using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appointment_System.Doctors
{
    public partial class DoctorProfile : System.Web.UI.Page
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
                LoadDoctorProfile();
            }
        }


        private void LoadDoctorProfile()
        {
        

            string loadquery = @"SELECT FullName,Specialization,ExperienceYears,AvailableDays,ConsultationFee,Address,PhoneNumber FROM Doctors
                                 WHERE DoctorID=@DoctorID";
            SqlCommand cmd = new SqlCommand(loadquery, con);

            cmd.Parameters.AddWithValue("@DoctorID", Session["DoctorID"]);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                txtFullName.Text = reader["FullName"].ToString();
                txtSpecialization.Text = reader["Specialization"].ToString();
                txtExperience.Text =reader["ExperienceYears"] == DBNull.Value ? "" : reader["ExperienceYears"].ToString();
                txtAvailableDays.Text = reader["AvailableDays"]?.ToString();
                txtFee.Text = reader["ConsultationFee"] == DBNull.Value ? "" : reader["ConsultationFee"].ToString();
                txtAddress.Text = reader["Address"]?.ToString();
                txtPhone.Text = reader["PhoneNumber"]?.ToString();
            }
            else
            {
                lblMsg.Text = "invalid doctor id...!!";
                lblMsg.CssClass = "text-danger";
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
            string updatequery = @"UPDATE Doctors SET 
                                    ExperienceYears =@Exp,
                                    AvailableDays = @Days, ConsultationFee = @Fee, Address = @Address,
                                  PhoneNumber = @Phone WHERE DoctorID = @DoctorID";
            SqlCommand cmd = new SqlCommand(updatequery, con);

            cmd.Parameters.AddWithValue("@Exp",string.IsNullOrEmpty( txtExperience.Text) ? (object)DBNull.Value : Convert.ToInt32(txtExperience.Text));
            cmd.Parameters.AddWithValue("@Days", txtAvailableDays.Text);
            cmd.Parameters.AddWithValue("@Fee", string.IsNullOrEmpty(txtFee.Text) ? (object)DBNull.Value : Convert.ToDecimal(txtFee.Text));
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
            cmd.Parameters.AddWithValue("@DoctorID", Session["DoctorID"]);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            lblMsg.Text = "Profile updated successfully.";
            lblMsg.CssClass = "text-success";
        }
    }
}