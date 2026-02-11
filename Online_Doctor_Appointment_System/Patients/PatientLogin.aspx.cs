using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appointment_System.Patients
{
    public partial class PatientLogin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-K5S8RJV\SQLEXPRESS;Initial Catalog=DoctorAppoinmentDB;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string registerquery = @"INSERT INTO Patients (FullName,Email,PasswordHash,Gender,DateOfBirth,Age,Phone,Address)
                                   VALUES(@FullName,@Email,@PasswordHash,@Gender,@DOB,@Age,@Phone,@Address)";

            SqlCommand registercmd = new SqlCommand(registerquery, con);
            registercmd.Parameters.AddWithValue("@FullName", txtName.Text);
            registercmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            registercmd.Parameters.AddWithValue(@"PasswordHash", txtPassword.Text);
            registercmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
            registercmd.Parameters.AddWithValue("@DOB", Convert.ToDateTime(txtDOB.Text));
            int age = DateTime.Now.Year - Convert.ToDateTime(txtDOB.Text).Year;
            registercmd.Parameters.AddWithValue("@Age", age);
            registercmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
            registercmd.Parameters.AddWithValue("@Address", txtAddress.Text);


            try
            {
                con.Open();
                int row = registercmd.ExecuteNonQuery();

                if (row > 0)
                {   
                    lblMessage.CssClass = "text-success mt-3 d-block text-center";
                    lblMessage.Text="Registration Successful.! You can Login Now.";
                    ClearField();
                }
                else
                {
                    lblMessage.CssClass = "text-danger mt-3 d-block text-center";
                    lblMessage.Text = "Registration Failed. Please try again.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.CssClass = "text-danger mt-3 d-block text-center";
                lblMessage.Text = "Error: " + ex.Message;
            }

            finally
            {
                con.Close();
            }



            string emailcheckquery = "SELECT COUNT(*) FROM Patients WHERE Email=@Email";
            SqlCommand emailcheckcmd = new SqlCommand(emailcheckquery, con);
            emailcheckcmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            try
            {
                con.Open();
                int count = (int)emailcheckcmd.ExecuteScalar();
                if (count > 0)
                {
                    lblMessage.CssClass = "text-danger mt-3 d-block text-center";
                    lblMessage.Text = "Email already exists. Please use a different email.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.CssClass = "text-danger mt-3 d-block text-center";
                lblMessage.Text = "Error: " + ex.Message;
            }
            finally
            {
                con.Close();
            }

        }
        private void ClearField()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtDOB.Text = "";
            ddlGender.SelectedIndex = 0;
            txtPhone.Text = "";
            txtAddress.Text = "";
        }




        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string loginquery = "SELECT PatientID, FullName, Email,PasswordHash  FROM Patients WHERE Email=@Email AND PasswordHash=@PasswordHash";
            SqlCommand logincmd = new SqlCommand(loginquery, con);
            logincmd.Parameters.AddWithValue("@Email", txtLoginEmail.Text);
            logincmd.Parameters.AddWithValue("@PasswordHash", txtLoginPassword.Text);

            con.Open();
            SqlDataReader reader = logincmd.ExecuteReader();
            if (reader.Read())
            {
                // Successful login
                HttpCookie patientidCookie = new HttpCookie("PatientID", reader["PatientID"].ToString());
                HttpCookie patientemailCookie = new HttpCookie("Email", reader["Email"].ToString());

                patientidCookie.Expires = DateTime.Now.AddHours(1);
                patientemailCookie.Expires = DateTime.Now.AddHours(1);

                Response.Cookies.Add(patientidCookie);
                Response.Cookies.Add(patientemailCookie);

                Response.Redirect("../Patients/PatientsDashboard.aspx");
            }
            else
            {
                // Invalid credentials
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid email or password. Please try again.');", true);
            }



            con.Close();
        }

        protected void btnForgotPassword_Click(object sender, EventArgs e)
        {
            string email =txtForgotEmail.Text;
            string newPassword = txtNewPassword.Text;

            if(email=="" || newPassword=="")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter both email and new password.');", true);
                return;
            }

            con.Open();

            string count = "SELECT COUNT(*) FROM Patients WHERE Email=@Email";
            SqlCommand countcmd = new SqlCommand(count, con);

            countcmd.Parameters.AddWithValue("@Email", email);
            int result = (int)countcmd.ExecuteScalar();
            if(result>0)
            {
                string updatequery = "UPDATE Patients SET PasswordHash=@PasswordHash WHERE Email=@Email";
                SqlCommand updatecmd = new SqlCommand(updatequery, con);
                updatecmd.Parameters.AddWithValue("@PasswordHash", newPassword);
                updatecmd.Parameters.AddWithValue("@Email", email);
                int row = updatecmd.ExecuteNonQuery();
                if(row>0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Password updated successfully. You can now login with your new password.');", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Failed to update password. Please try again.');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Email not found. Please check and try again.');", true);
            }
        }
    }
}