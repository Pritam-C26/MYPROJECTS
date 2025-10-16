using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Admission_System
{
    public partial class ApplicationForm : System.Web.UI.Page
    {
        String conStr = "Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=OnlineAdmission;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }


       

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                // Get UserId and CourseId from cookies
                if (Request.Cookies["UserId"] == null || Request.Cookies["SelectedCourseId"] == null)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Session expired. Please login and select a course again.');", true);
                    return;
                }

                int userId = Convert.ToInt32(Request.Cookies["UserId"].Value);
                int courseId = Convert.ToInt32(Request.Cookies["SelectedCourseId"].Value);

                using (SqlConnection con = new SqlConnection(conStr))
                {
                    string query = @"INSERT INTO Applications 
                            (UserId, CourseId, FullName, DOB, Gender, Address, Email, Phone, PreviousSchool, Marks, PassingYear, LastQualification) 
                            VALUES (@UserId, @CourseId, @FullName, @DOB, @Gender, @Address, @Email, @Phone, @PreviousSchool, @Marks, @PassingYear, @LastQualification)";

                    SqlCommand cmd = new SqlCommand(query, con);

                    // Parameters
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@CourseId", courseId);
                    cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
                    cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
                    cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@PreviousSchool", txtSchool.Text);

          
                    cmd.Parameters.AddWithValue("@Marks", Convert.ToInt32(txtMarks.Text)); 
                    cmd.Parameters.AddWithValue("@PassingYear", Convert.ToInt32(txtYear.Text));

                    cmd.Parameters.AddWithValue("@LastQualification", ddlQualification.SelectedValue);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Application submitted successfully!');", true);
            }
            catch (Exception ex)
            {
                // Show error (for debugging)
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: " + ex.Message + "');", true);
            }
            btnSubmit.Enabled = false;
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            String UserId = Request.Cookies["UserId"]?.Value;
            String applicationId = null;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                String query = "SELECT TOP 1 ApplicationId FROM Applications WHERE UserId=@UserId ORDER BY ApplicationId DESC";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", UserId);
                con.Open();
                object result = cmd.ExecuteScalar();
                con.Close();


                if (result != null)
                {
                    applicationId = result.ToString();
                }


                if(applicationId !=null)
                {
                    Session["ApplicationId"] = applicationId;
                    Response.Redirect("UploadDocument.aspx");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please submit your application first.');", true);
                }
            }

        }
    }
}