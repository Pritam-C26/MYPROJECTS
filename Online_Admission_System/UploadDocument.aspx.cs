using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Admission_System
{
    public partial class UploadDocument : System.Web.UI.Page
    {
        String conStr = "Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=OnlineAdmission;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            String applicationId = Session["ApplicationId"]?.ToString();

            if(applicationId == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(),"alert", "alert('Please Complete Your Application First.');", true);
                return;
            }



            string folderPath = Server.MapPath("~/Uploads/");

            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }


            string photoPath = "", signPath = "", marksheetPath = "";

            if (fuPhotoId.HasFile)
            {
                photoPath = "~/Uploads/" + Path.GetFileName(fuPhotoId.FileName);
                fuPhotoId.SaveAs(Server.MapPath(photoPath));
            }

            if (fuSignature.HasFile)
            {
                signPath="~/Uploads/" +Path.GetFileName(fuSignature.FileName);
                fuSignature.SaveAs(Server.MapPath(signPath));
            }

            if (fuMarksheet.HasFile)
            {
                marksheetPath="~/Uploads/" + Path.GetFileName(fuMarksheet.FileName);
                fuMarksheet.SaveAs(Server.MapPath(marksheetPath));
            }



            using (SqlConnection con = new SqlConnection(conStr))
            {
                String query = "INSERT INTO ApplicationDocuments(ApplicationId,PhotoIdPath,SignaturePath,MarksheetPath)VALUES(@ApplicationId,@PhotoIdPath,@SignaturePath,@MarksheetPath)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ApplicationId", applicationId);
                cmd.Parameters.AddWithValue("@PhotoIdPath", photoPath);
                cmd.Parameters.AddWithValue("@SignaturePath", signPath);
                cmd.Parameters.AddWithValue("@MarksheetPath", marksheetPath);

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Documents uploaded successfully!');", true);
                }
                catch (Exception ex)
                {
                    // Show error (for debugging)
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: " + ex.Message + "');", true);
                }
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("FinalView.aspx");
        }
    }
}