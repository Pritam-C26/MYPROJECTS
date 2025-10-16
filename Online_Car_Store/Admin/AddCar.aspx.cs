using System;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Car_Store.Admin
{
    public partial class ManageCar : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=CarStore;Integrated Security=True;Encrypt=True;TrustServerCertificate=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["AdminId"] == null)
            {
                Response.Redirect("../Admin/AdminLogin.aspx");
            }
        }

        protected void btnAddCar_Click(object sender, EventArgs e)
        {
            string relativePath = "";

            if (fileCarImg.HasFile)
            {
                try
                {
                    // Save uploaded file in "images" folder inside project
                    string folderPath = Server.MapPath("~/images/");
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    string fileName = Path.GetFileName(fileCarImg.FileName);
                    string savePath = Path.Combine(folderPath, fileName);
                    fileCarImg.SaveAs(savePath);

                    // Relative path for DB
                    relativePath = "~/images/" + fileName;

                    // Show uploaded file
                    lblMessage.Text = "File uploaded successfully! ";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    imgCar.ImageUrl = relativePath;

                    // Insert into database
                 
                    string query = @"INSERT INTO Cars(CarName, Brand, Model, Year, Price, FuelType, Transmission, Mileage, Engine, Description, ImagePath, Category, Status)
                                     VALUES(@CarName, @Brand, @Model, @Year, @Price, @FuelType, @Transmission, @Mileage, @Engine, @Description, @ImagePath, @Category, @Status)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@CarName", txtCarName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Brand", txtCarBrand.Text.Trim());
                        cmd.Parameters.AddWithValue("@Model", txtCarModel.Text.Trim());
                        cmd.Parameters.AddWithValue("@Year", txtYear.Text.Trim());
                        cmd.Parameters.AddWithValue("@Price", txtPrice.Text.Trim());
                        cmd.Parameters.AddWithValue("@FuelType", ddlfuel.SelectedValue);
                        cmd.Parameters.AddWithValue("@Transmission", txtTransmission.Text.Trim());
                        cmd.Parameters.AddWithValue("@Mileage", txtMileage.Text.Trim());
                        cmd.Parameters.AddWithValue("@Engine", txtEngine.Text.Trim());
                        cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                        cmd.Parameters.AddWithValue("@ImagePath", relativePath);
                        cmd.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue);
                        cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }

                    lblMessage.Text += " Car added successfully to the database!";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblMessage.Text = "Please choose a file to upload.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            if (Request.Cookies["AdminId"] != null)
            {
                HttpCookie cookie = new HttpCookie("AdminId");
                cookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(cookie);
            }

            Response.Redirect("../Admin/AdminLogin.aspx");
        }
    }
}
