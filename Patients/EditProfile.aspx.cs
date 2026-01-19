using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appointment_System.Patients
{
    public partial class EditProfile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-K5S8RJV\SQLEXPRESS;Initial Catalog=DoctorAppoinmentDB;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["PatientID"] == null)
                {
                    Response.Redirect("~/Patients/PatientLogin.aspx");
                }
                LoadPatientData();
            }
        }



        private void LoadPatientData()
        {
            int patientId = Convert.ToInt32(Request.Cookies["PatientID"].Value);

            string query = "SELECT FullName,Gender,Age,Email,Phone,DateOfBirth,Address FROM Patients WHERE PatientID=@PatientID";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@PatientID", patientId);
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    
                    txtFullName.Text = reader["FullName"].ToString();
                    txtGender.Text = reader["Gender"].ToString();
                    txtEmail.Text = reader["Email"].ToString();
                    txtPhone.Text = reader["Phone"].ToString();
                    txtAge.Text = reader["Age"] != DBNull.Value ? reader["Age"].ToString(): "";

                    if (reader["DateOfBirth"] != DBNull.Value)
                    {
                        txtDOB.Text = Convert.ToDateTime(reader["DateOfBirth"]).ToString("yyyy-MM-dd");
                    }

                    txtAddress.Text = reader["Address"] != DBNull.Value? reader["Address"].ToString(): "";

                }
            }
            catch (Exception ex)
            {
                lblMsg.CssClass = "text-danger mt-3 d-block text-center";
                lblMsg.Text = "Error: " + ex.Message;
            }
            finally
            {
                con.Close();

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int patientId = Convert.ToInt32(Request.Cookies["PatientID"].Value);
            string updateQuery= @"UPDATE Patients SET Email=@Email, DateOfBirth=@DOB, Phone=@Phone, Age=@Age, Address=@Address WHERE PatientID=@PatientID";
            SqlCommand updateCmd = new SqlCommand(updateQuery, con);
            updateCmd.Parameters.AddWithValue("@PatientID", patientId);
            updateCmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            updateCmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
            updateCmd.Parameters.AddWithValue("@Age", txtAge.Text);
            updateCmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
            updateCmd.Parameters.AddWithValue("@Address", txtAddress.Text);

            con.Open();
            updateCmd.ExecuteNonQuery();
            con.Close();

            lblMsg.CssClass = "text-success mt-3 d-block text-center";
            lblMsg.Text = "Profile Updated Successfully";


        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Patients/PatientsDashboard.aspx");
        }
    }
}