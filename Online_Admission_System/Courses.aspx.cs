using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Admission_System
{
    public partial class Courses : System.Web.UI.Page
    {
        String conStr = "Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=OnlineAdmission;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // avoid rebinding on every postback
            {
                course_view();
            }
        }

        protected void course_view()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                String query = "SELECT * FROM Courses";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                rptCourses.DataSource = reader; // Changed to Repeater
                rptCourses.DataBind();
                con.Close();
            }
        }

        protected void rptCourses_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ApplyCourse")
            {
                int courseId = Convert.ToInt32(e.CommandArgument);

                HttpCookie courseCookie = new HttpCookie("SelectedCourseId");
                courseCookie.Value = courseId.ToString();
                courseCookie.Expires = DateTime.Now.AddMinutes(30); // expires after 30 mins
                Response.Cookies.Add(courseCookie);

                // Redirect with courseId
                Response.Redirect("ApplicationForm.aspx?courseId=" + courseId);
            }
        }


        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            if (Request.Cookies["Role"] == null || Request.Cookies["Role"].Value != "Student")
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
