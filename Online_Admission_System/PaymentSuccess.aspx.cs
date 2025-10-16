using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Admission_System
{
    public partial class PaymentSuccess : System.Web.UI.Page
    {
        String conStr = "Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=OnlineAdmission;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int transactionId = Convert.ToInt32(Request.QueryString["TransactionId"]);
                LoadPaymentDetails(transactionId);
;            }
        }


        private void LoadPaymentDetails(int transactionId)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"SELECT t.TransactionId, u.Username,c.CourseName,t.Amount,t.PaymentMethod,t.TransactionDate
                    FROM Transactions t 
                      JOIN Users u ON t.UserId=u.UserId
                    JOIN Courses c ON t.CourseId=c.CourseId
                    WHERE t.TransactionId=@TransactionId";



                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@TransactionId", transactionId);


                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblTransactionId.Text = reader["TransactionId"].ToString();
                    lblUserName.Text = reader["Username"].ToString();
                    lblCourse.Text = reader["CourseName"].ToString();
                    lblAmount.Text = reader["Amount"].ToString();
                    lblPaymentMethod.Text = reader["PaymentMethod"].ToString();
                    lblDate.Text = Convert.ToDateTime(reader["TransactionDate"]).ToString("dd/MM/yyyy");
                }
                con.Close();
            }
        }
    }
}