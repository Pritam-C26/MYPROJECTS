using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Admission_System
{
    public partial class PaymentGateway : System.Web.UI.Page
    {
        String conStr = "Data Source=DESKTOP-D4Q5GRH\\SQLEXPRESS;Initial Catalog=OnlineAdmission;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            lblCourseName.Text = Session["CourseName"]?.ToString() ?? "Unknown";
            lblAmount.Text = "₹" + (Session["TotalAmount"]?.ToString() ?? "0.00");
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(Request.Cookies["UserId"].Value);
            int applicationId = Convert.ToInt32(Session["ApplicationId"]);
            int courseId = Convert.ToInt32(Session["CourseId"]);
            decimal totalAmount = Convert.ToDecimal(lblAmount.Text.Replace("₹", ""));



            string paymentMethod = "";
            string paymentDetails = "";

            if (rdbCard.Checked)
            {
                paymentMethod = "Card";
                paymentDetails = "XXXX-XXXX-XXXX-" + txtCardNumber.Text.Substring(txtCardNumber.Text.Length - 4);

            }
            else if (rdbUPI.Checked)
            {
                paymentMethod = "UPI";
                paymentDetails = txtUPI.Text;
            }
            else if (rdbNetBanking.Checked)
            {
                paymentMethod = "Net Banking";
                paymentDetails = ddlBank.SelectedValue;
            }

            using(SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"INSERT INTO Transactions(UserId,ApplicationId,CourseId,Amount,PaymentMethod,PaymentDetails) 
                                OUTPUT INSERTED.TransactionId
                                VALUES(@UserId,@ApplicationId,@CourseId,@Amount,@PaymentMethod,@PaymentDetails)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@ApplicationId", applicationId);
                cmd.Parameters.AddWithValue("@CourseId", courseId);
                cmd.Parameters.AddWithValue("@Amount", totalAmount);
                cmd.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
                cmd.Parameters.AddWithValue("@PaymentDetails", paymentDetails);

                con.Open();
                int transactionId = (int)cmd.ExecuteScalar();
                con.Close();


                Response.Redirect("PaymentSuccess.aspx?TransactionId=" + transactionId);

            }
        }
    }
}