using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Car_Store
{
    public partial class ViewDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-D4Q5GRH\SQLEXPRESS;Initial Catalog=CarStore;Integrated Security=True;TrustServerCertificate=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                if(!string.IsNullOrEmpty(Request.QueryString["CarId"].ToString()))
                {
                   
                    string carId = Request.QueryString["CarId"].ToString();
                    carDetails(carId);

                }
                else
                {
                    Response.Redirect("Car.aspx");
                }
            }

        }


        private void carDetails(string carId)
        {
            string query= @"SELECT CarName, Brand, Model, Year, Price, FuelType, Transmission, Mileage, Engine, Description, ImagePath, Category, Status FROM Cars WHERE CarId = @CarId";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@CarId", carId);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                lblCarName.Text = reader["CarName"].ToString();
                lblBrand.Text = reader["Brand"].ToString();
                lblModel.Text = reader["Model"].ToString();
                lblYear.Text = reader["Year"].ToString();
                lblPrice.Text = reader["Price"].ToString();
                lblFuel.Text = reader["FuelType"].ToString();
                lblTransmission.Text = reader["Transmission"].ToString();
                lblMileage.Text = reader["Mileage"].ToString();
                lblEngine.Text = reader["Engine"].ToString();
                lblDescription.Text = reader["Description"].ToString();
                imgCar.ImageUrl = reader["ImagePath"].ToString();
                lblCategory.Text = reader["Category"].ToString();
                lblStatus.Text = reader["Status"].ToString();
            }
            con.Close();
        }
        protected void btnBookNow_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["UserId"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                string carId = Request.QueryString["CarId"]; // Or however you retrieve it
                Response.Redirect("CarBooking.aspx?CarId=" + carId);
            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cars.aspx");
        }

        
    }
}