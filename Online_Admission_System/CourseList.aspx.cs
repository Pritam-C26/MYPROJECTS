using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Admission_System
{
    public partial class CourseList : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=OnlineAdmission;Integrated Security=True;Encrypt=True;TrustServerCertificate=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               LoadCourse();
            }
        }

        protected void btnAddCourse_Click(object sender, EventArgs e)
        {
            string coursename = txtCourseName.Text;
            string courseduration = txtDuration.Text;
            decimal coursefees = Convert.ToDecimal(txtFees.Text);
            string imagePath = "";


            if (fuCourseImage.HasFile)
            {
                string fileName =Path.GetFileName(fuCourseImage.FileName);
                fuCourseImage.SaveAs(Server.MapPath("~/Uploads/")+fileName);
                imagePath="Uploads/" + fileName;
            }

            string query = @"INSERT INTO Courses (CourseName, Duration, Fees, ImagePath) VALUES(@CourseName,@Duration,@Fees,@ImagePath)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@CourseName", coursename);
            cmd.Parameters.AddWithValue("@Duration", courseduration);
            cmd.Parameters.AddWithValue("@Fees", coursefees);
            cmd.Parameters.AddWithValue("@ImagePath", imagePath);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Write("<script>alert('Course Added Successfully');</script>");
        }


        private void LoadCourse()
        {
            string query = @"SELECT * FROM Courses";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvCourses.DataSource = dt;
            gvCourses.DataBind();

        }

        protected void gvCourses_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int courseId = Convert.ToInt32(gvCourses.DataKeys[e.RowIndex].Value);

            // Check if applications exist for this course
            SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM Applications WHERE CourseId=@id", con);
            checkCmd.Parameters.AddWithValue("@id", courseId);

            con.Open();
            int count = (int)checkCmd.ExecuteScalar();

            if (count > 0)
            {
                // Show message (instead of crashing)
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cannot delete this course because applications exist for it.');", true);
            }
            else
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Courses WHERE CourseId=@id", con);
                cmd.Parameters.AddWithValue("@id", courseId);
                cmd.ExecuteNonQuery();

                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Course deleted successfully.');", true);
            }

            con.Close();

            // Reload GridView
            LoadCourse();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            if (Request.Cookies["Role"] == null || Request.Cookies["Role"].Value != "Admin")
            {
                HttpCookie myCookie = new HttpCookie("Role");
                myCookie.Expires = DateTime.Now.AddDays(-1); // expire immediately
                Response.Cookies.Add(myCookie);
            }

            // Redirect to login page
            Response.Redirect("Login.aspx");
        }
    }
}