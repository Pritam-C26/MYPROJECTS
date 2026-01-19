using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Doctor_Appointment_System.Doctors
{
    public partial class DoctorLogin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-K5S8RJV\SQLEXPRESS;Initial Catalog=DoctorAppoinmentDB;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
               if(Session["UserID"] != null && Session["Role"] != null && Session["Role"].ToString() == "Doctor")
                {
                    Response.Redirect("~/Doctors/DoctorDashboard.aspx");
                }
            }
        }

        protected void btnLoginDoc_Click(object sender, EventArgs e)
        {
            string email = txtLoginEmailDoc.Text.Trim();
            string password = txtLoginPasswordDoc.Text.Trim();

            if (email == "" || password == "")
            {
                lblloginMessage.Text = "Email and Password are required.";
                return;
            }

            con.Open();

            //  Login from USERS table
            string loginquery = @"SELECT UserID, FullName 
                          FROM Users 
                          WHERE Email=@Email AND Password=@Password AND Role='Doctor'";

            SqlCommand logincmd = new SqlCommand(loginquery, con);
            logincmd.Parameters.AddWithValue("@Email", email);
            logincmd.Parameters.AddWithValue("@Password", password);

            SqlDataReader reader = logincmd.ExecuteReader();

            if (reader.Read())
            {
                int userId = Convert.ToInt32(reader["UserID"]);
                string fullName = reader["FullName"].ToString();
                reader.Close();

                //  Get DoctorID from DOCTORS table
                string doctorQuery = @"SELECT DoctorID 
                               FROM Doctors 
                               WHERE UserID=@UserID";

                SqlCommand doctorCmd = new SqlCommand(doctorQuery, con);
                doctorCmd.Parameters.AddWithValue("@UserID", userId);

                object result = doctorCmd.ExecuteScalar();

                if (result == null)
                {
                    lblloginMessage.Text = "Doctor profile not found.";
                    return;
                }

                int doctorId = Convert.ToInt32(result);

                
                Session["UserID"] = userId;
                Session["DoctorID"] = doctorId;
                Session["FullName"] = fullName;
                Session["Role"] = "Doctor";

                Response.Redirect("~/Doctors/DoctorDashboard.aspx");
            }
            else
            {
                lblloginMessage.Text = "Invalid Email or Password.";
            }

            con.Close();
        }


        protected void btnRegisterDoc_Click(object sender, EventArgs e)
        {
            string fullName = txtDocName.Text.Trim();
            string email = txtDocEmail.Text.Trim();
            string password = txtDocPassword.Text.Trim();
            string specialization = txtSpecialization.Text.Trim();
            string availabledays = txtAvailableDays.Text.Trim();
            string phone = txtDocPhone.Text.Trim();
            string address= txtDocAddress.Text.Trim();

            int expYears = 0;
            int.TryParse(txtExperienceYears.Text.Trim(),out expYears);

            decimal fee=0;
            decimal.TryParse(txtConsultationFee.Text.Trim(),out fee);


            //validation

            if(fullName == "" || email  == "" || password == "")
            {
                lblMessageDoctor.Text = "Full Name, Email and Password are required.";
                return;
            }


            con.Open();

            SqlTransaction trans = con.BeginTransaction();

            try
            {
               string checkquery = @"SELECT COUNT(*) FROM Users Where Email=@Email AND Role='Doctor'";
                SqlCommand checkcmd = new SqlCommand(checkquery, con, trans);

                checkcmd.Parameters.AddWithValue("@Email", email);

                int exist = Convert.ToInt32(checkcmd.ExecuteScalar());

                if (exist > 0)
                {
                    lblMessageDoctor.Text = "This Email is already exist";
                    trans.Rollback();
                    return;
                }

                //insertuser
                string insertuser = @"INSERT INTO Users( FullName, Email, Password, Role) VALUES(@FullName,@Email,@Password,'Doctor');
                SELECT SCOPE_IDENTITY();";

                SqlCommand usercmd = new SqlCommand(insertuser, con, trans);

                usercmd.Parameters.AddWithValue("@FullName", fullName);
                usercmd.Parameters.AddWithValue("@Email", email);
                usercmd.Parameters.AddWithValue("@Password", password);

                int UserID = Convert.ToInt32(usercmd.ExecuteScalar());


                //insertDoctor

                string insertDoctor = @"INSERT INTO Doctors(UserID,FullName,Specialization,ExperienceYears,AvailableDays,ConsultationFee,Address,PhoneNumber)
                                     VALUES(@UserID,@FullName,@Specialization,@ExperienceYears,@AvailableDays,@ConsultationFee,@Address,@PhoneNumber)";
                SqlCommand doctorcmd = new SqlCommand(insertDoctor, con, trans);

                doctorcmd.Parameters.AddWithValue("@UserID", UserID);
                doctorcmd.Parameters.AddWithValue("@FullName", fullName);
                doctorcmd.Parameters.AddWithValue("@Specialization", specialization);
                doctorcmd.Parameters.AddWithValue("@ExperienceYears", expYears);
                doctorcmd.Parameters.AddWithValue("@AvailableDays", availabledays);
                doctorcmd.Parameters.AddWithValue("@ConsultationFee", fee);
                doctorcmd.Parameters.AddWithValue("@PhoneNumber", phone);
                doctorcmd.Parameters.AddWithValue("@Address", address);


                doctorcmd.ExecuteNonQuery();
                trans.Commit();
                lblMessageDoctor.Text = "Registration Successful.! You can no Login";


                //switch panel
                pnlRegisterDoc.Style["display"] = "none";
                pnlLoginDoc.Style["display"] = "block";
            }
            catch(Exception ex)
            {
                trans.Rollback();
                lblMessageDoctor.Text="Error" + ex.Message;
            }

            con.Close();


        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
           string email =txtUsername.Text.Trim();
           string newpassword = txtNewPassword.Text.Trim();

            if(email == "" || newpassword == "")
            {
                lblForgotMsg.Text = "Username and New Password are required.";
                return;
            }


            con.Open();


            //check email exist
            string checkquery = @"SELECT COUNT(*) FROM Users  WHERE Email =@Email AND Role='Doctor'";
            SqlCommand checkcmd = new SqlCommand(checkquery, con);

            checkcmd.Parameters.AddWithValue("@Email", email);
            int exist = Convert.ToInt32(checkcmd.ExecuteScalar());
            if (exist == 0)
            {
                lblForgotMsg.Text = "Invalid Email.";
                return;
            }


            //update password
            string updatequery = @"UPDATE Users SET Password=@Password WHERE Email=@Email AND Role='Doctor'";
            SqlCommand updatecmd = new SqlCommand(updatequery, con);
            updatecmd.Parameters.AddWithValue("@Email", email);
            updatecmd.Parameters.AddWithValue("@Password", newpassword);
            updatecmd.ExecuteNonQuery();
            con.Close();

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Password Reset Successful. You can now login with your new password.');", true);



        }
    }
}