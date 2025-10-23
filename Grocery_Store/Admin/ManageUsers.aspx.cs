using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceryStore.Admin
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=GroceryStoreDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["Username"] == null)
                {
                    Response.Redirect("../Admin/AdminLogin.aspx");
                }
                loadUsers();
            }

        }



        private void loadUsers()
        {
            string userquery = "SELECT UserID,Name,Email FROM Users";
            SqlCommand usercmd = new SqlCommand(userquery, con);

            SqlDataAdapter da = new SqlDataAdapter(usercmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvUsers.DataSource= dt;
            gvUsers.DataBind();
        }


        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteUser" || e.CommandName == "BlockUser" || e.CommandName=="UnblockUser")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int userId = Convert.ToInt32(gvUsers.DataKeys[index].Value);

                if (e.CommandName == "DeleteUser")
                {
                    string deleteQuery = "DELETE FROM Users WHERE UserID = @UserID";
                    using (SqlCommand deleteCmd = new SqlCommand(deleteQuery, con))
                    {
                        deleteCmd.Parameters.AddWithValue("@UserID", userId);
                        con.Open();
                        deleteCmd.ExecuteNonQuery();
                        con.Close();
                    }

                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                "alert('User has been deleted successfully!');", true);
                }
                else if (e.CommandName == "BlockUser")
                {
                    string blockQuery = "UPDATE Users SET IsBlocked = 1 WHERE UserID = @UserID";
                    using (SqlCommand blockCmd = new SqlCommand(blockQuery, con))
                    {
                        blockCmd.Parameters.AddWithValue("@UserID", userId);
                        con.Open();
                        blockCmd.ExecuteNonQuery();
                        con.Close();
                    }
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                "alert('User has been blocked successfully!');", true);

                }
                else if (e.CommandName == "UnblockUser")
                {

                    string unblockquery = "Update Users SET IsBlocked=0 WHERE UserID=@UserID";
                    using (SqlCommand unblockcmd = new SqlCommand(unblockquery, con))
                    {
                        unblockcmd.Parameters.AddWithValue("@UserID", userId);
                        con.Open();
                        unblockcmd.ExecuteNonQuery();
                        con.Close();

                    }
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                "alert('User has been Unblocked successfully!');", true);

                }

                    loadUsers();
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