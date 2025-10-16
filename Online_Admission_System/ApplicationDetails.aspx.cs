using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Admission_System
{
    public partial class ApplicationDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=OnlineAdmission;Integrated Security=True;Encrypt=True;TrustServerCertificate=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ApplicationId"] != null)
                {
                    int ApplicationId = Convert.ToInt32(Request.QueryString["ApplicationId"]);
                    LoadApplicationDetails(ApplicationId);
                }
            }
        }



        private void LoadApplicationDetails(int ApplicationId)
        {
            string query = @"SELECT d.PhotoIdPath, d.SignaturePath, a.FullName,a.DOB,a.Gender,a.Address,a.Email,a.Phone,a.PreviousSchool,a.Marks,a.PassingYear,a.LastQualification,a.SubmissionDate
                            FROM Applications a
                            INNER JOIN ApplicationDocuments d ON a.ApplicationId=d.ApplicationId WHERE a.ApplicationId=@ApplicationId";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@ApplicationId", ApplicationId);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                imgPhoto.ImageUrl = reader["PhotoIdPath"].ToString();
                imgSign.ImageUrl = reader["SignaturePath"].ToString();


                lblFullName.Text = reader["FullName"].ToString();
                lblDOB.Text = Convert.ToDateTime(reader["DOB"]).ToString("dd-MM-yyyy");
                lblGender.Text = reader["Gender"].ToString();
                lblAddress.Text = reader["Address"].ToString();
                lblEmail.Text = reader["Email"].ToString();
                lblPhone.Text = reader["Phone"].ToString();
                lblSchool.Text = reader["PreviousSchool"].ToString();
                lblMarks.Text = reader["Marks"].ToString();
                lblYear.Text = reader["PassingYear"].ToString();
                lblQualification.Text = reader["LastQualification"].ToString();
                lblSubDate.Text = Convert.ToDateTime(reader["SubmissionDate"]).ToString("dd-MM-yyyy");

            }
            con.Close();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewApplications.aspx");

        }
    }
}