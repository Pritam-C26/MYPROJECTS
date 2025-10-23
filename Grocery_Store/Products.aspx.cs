using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceryStore
{
    public partial class Products : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-D4Q5GRH\SQLEXPRESS;Initial Catalog=GroceryStoreDB;Integrated Security=True;Encrypt=False");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["UserID"] != null)
                {
                    btnLoginLogout.Text = "Logout";
                    lblWelcome.Text = "Welcome, " + Request.Cookies["Name"].Value;
                }
                else
                {
                    btnLoginLogout.Text = "Login";
                    lblWelcome.Text = "Welcome, Guest";
                    btnLoginLogout.PostBackUrl = "Login.aspx";
                }

                BindProduct();
            }
        }

        private void BindProduct()
        {
            //get all categories

            string query = "SELECT  * FROM Categories";
            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataAdapter daCat = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            daCat.Fill(dt);

            // Add a virtual column to hold products for nested repeater
            if (!dt.Columns.Contains("Products"))
            {
                dt.Columns.Add("Products", typeof(DataTable));
            }

            // Iterate through the rows in the DataTable, not SqlDataAdapter
            foreach (DataRow row in dt.Rows)
            {
                // Process each row here
                int categoryId = Convert.ToInt32(row["CategoryID"]);

                // Create a new SqlCommand for each category
                SqlDataAdapter daProducts = new SqlDataAdapter("SELECT * FROM Products WHERE CategoryID = @categoryId", con);
               
                daProducts.SelectCommand.Parameters.AddWithValue("@categoryId", categoryId);
                DataTable dtProducts = new DataTable();
                daProducts.Fill(dtProducts);

                // Add products as a DataTable property for nested repeater
                row["Products"]= dtProducts;


            }

            rptCategories.DataSource = dt;
            rptCategories.DataBind();

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtSearch.Text.Trim();

            // Get all categories
            string query = "SELECT * FROM Categories";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter daCat = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            daCat.Fill(dt);

            // Add a virtual column to hold products 
            if (!dt.Columns.Contains("Products"))
            {
                dt.Columns.Add("Products", typeof(DataTable));
            }

            foreach (DataRow row in dt.Rows)
            {
                int categoryId = Convert.ToInt32(row["CategoryID"]);

                string searchQuery = @"
                                    SELECT  p.ProductID, p.Name, p.Price, p.Image, p.Description 
                                    FROM Products p
                                    JOIN Categories c ON c.CategoryID = p.CategoryID
                                    WHERE c.CategoryID = @categoryId
                                      AND (p.Name LIKE @keyword OR p.Description LIKE @keyword OR c.CategoryName LIKE @keyword)";

                SqlDataAdapter daProducts = new SqlDataAdapter(searchQuery, con);
                daProducts.SelectCommand.Parameters.AddWithValue("@categoryId", categoryId);
                daProducts.SelectCommand.Parameters.AddWithValue("@keyword", "%" + keyword + "%");

                DataTable dtProducts = new DataTable();
                daProducts.Fill(dtProducts);

                // Store product list into this category row
                row["Products"] = dtProducts;
            }

            for(int i = dt.Rows.Count - 1; i>=0; i--)
            {
                DataRow row = dt.Rows[i];
                DataTable products = row["Products"] as DataTable;
                if (products == null || products.Rows.Count == 0)
                {
                    dt.Rows.Remove(row);
                }
            }

            // Bind the main category repeater after the loop
            rptCategories.DataSource = dt;
            rptCategories.DataBind();
        }


        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["UserID"] == null || string.IsNullOrEmpty(Request.Cookies["UserID"].Value)) 
            { 
                    Response.Redirect("Login.aspx");
                return;
            }



            int userID = Convert.ToInt32(Request.Cookies["UserID"].Value);
            int productID = Convert.ToInt32(((Button)sender).CommandArgument);
            int quantity = 1;

            HttpCookie productCookie = new HttpCookie("ProductID", productID.ToString());
           
            Response.Cookies.Add(productCookie);


            string checkquery=@"SELECT COUNT(*) FROM Cart WHERE UserID=@userID AND ProductID=@productID";
            SqlCommand checkCmd = new SqlCommand(checkquery, con);
            checkCmd.Parameters.AddWithValue("@userID", userID);
            checkCmd.Parameters.AddWithValue("@productID", productID);

            con.Open();
            int exist= (int)checkCmd.ExecuteScalar();

            if (exist > 0)
            {
                string updatequery =@"UPDATE Cart SET Quantity = Quantity + @quantity WHERE UserID =@userID AND ProductID=@ProductID";
                SqlCommand updateCmd = new SqlCommand(updatequery, con);
                updateCmd.Parameters.AddWithValue("@quantity",quantity);
                updateCmd.Parameters.AddWithValue("@userID", userID);
                updateCmd.Parameters.AddWithValue("@ProductID", productID);
                updateCmd.ExecuteNonQuery();

            }
            else
            {
                string insertQuery = @"
                    INSERT INTO Cart (UserID, ProductID, Name, Price, Quantity, Image, Description)
                    SELECT 
                        @userID, 
                        p.ProductID, 
                        p.Name, 
                        p.Price, 
                        @quantity, 
                        p.Image, 
                        p.Description
                    FROM Products p
                    WHERE p.ProductID = @productID";

                SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                insertCmd.Parameters.AddWithValue("@userID", userID);
                insertCmd.Parameters.AddWithValue("@productID", productID);
                insertCmd.Parameters.AddWithValue("@quantity", quantity);
                insertCmd.ExecuteNonQuery();
            }
            con.Close();


            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Product added to cart successfully!');", true);


            
        }


        protected void btnLoginLogout_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["UserID"] != null)
            {
                Session.Clear();
                Session.Abandon();

                HttpCookie userIdCookie = new HttpCookie("UserID");
                userIdCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(userIdCookie);
                Response.Redirect("Home.aspx");
            }
        }

    
    }
}