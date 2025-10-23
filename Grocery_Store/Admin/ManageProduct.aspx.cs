using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceryStore.Admin
{
    public partial class ManageProduct : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=GroceryStoreDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] == null)
                {
                    Response.Redirect("../Admin/AdminLogin.aspx");
                }
                loadProducts();
                loadCategories();
            }
        }

        //load categories to gridview

        private void loadCategories()
        {
            string loadquery = "SELECT * FROM Categories";
            SqlCommand cmd = new SqlCommand(loadquery, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvCategories.DataSource = dt;
            gvCategories.DataBind();
        }



        //load products to gridview
        private void loadProducts()
        {
            string loadquery = "SELECT * FROM Products";
            SqlCommand cmd = new SqlCommand(loadquery, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();
            da.Fill(dt);
            gvProducts.DataSource = dt;
            gvProducts.DataBind();
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string imgPath = ""; 

            if (fuImage.HasFile)
            {
                string folderPath = Server.MapPath("Image/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string ePath = folderPath + Path.GetFileName(fuImage.FileName);
                fuImage.SaveAs(ePath);

                imgPath = "Image/" + Path.GetFileName(fuImage.FileName);
            }

            // Now the adding to the database
            if (txtName.Text != "" && txtPrice.Text != "" && txtCategoryID.Text != "" && txtDescription.Text != "")
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("INSERT INTO Products (Name, Price, CategoryID, Description, Image) VALUES (@Name, @Price, @CategoryID, @Description, @Image)", con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Price", txtPrice.Text);
                cmd.Parameters.AddWithValue("@CategoryID", txtCategoryID.Text);
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                cmd.Parameters.AddWithValue("@Image", imgPath);
                cmd.ExecuteNonQuery();

                con.Close();

                lblMessage.Text = "Product Added Successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;

                txtName.Text = txtCategoryID.Text = txtDescription.Text = txtPrice.Text = "";
                loadProducts();
            }
        }


        protected void gvProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteProduct")
            {
                int index =Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvProducts.Rows[index];
                int productId = Convert.ToInt32(row.Cells[0].Text);
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Products WHERE ProductID=@ProductID", con);
                cmd.Parameters.AddWithValue("@ProductID", productId);
                cmd.ExecuteNonQuery();
                con.Close();
                
                loadProducts();

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Product Deleted Successfully')", true);
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();

            Response.Redirect("../Admin/AdminLogin.aspx");
        }
    }
}