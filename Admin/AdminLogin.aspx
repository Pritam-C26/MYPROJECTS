<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Online_Doctor_Appointment_System.Admin.AdminLogin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Login | DocEase</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            font-family: 'Poppins', sans-serif;
        }

        .login-box {
            max-width: 420px;
            margin: auto;
            margin-top: 8%;
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
        }

        .login-box h3 {
            font-weight: 700;
            color: #2c5364;
            text-align: center;
            margin-bottom: 25px;
        }

        .form-label {
            font-weight: 600;
        }

        .form-control {
            border-radius: 8px;
            padding: 10px;
        }

        .btn-admin {
            background: #2c5364;
            color: #fff;
            font-weight: 600;
            border-radius: 8px;
            padding: 10px;
            transition: 0.3s;
        }

        .btn-admin:hover {
            background: #203a43;
        }

        .brand {
            text-align: center;
            font-size: 1.8rem;
            font-weight: 800;
            color: #ffffff;
            margin-top: 40px;
        }

        .brand span {
            color: #90caf9;
        }
    </style>
</head>

<body>
    <div class="brand">
        Doc<span>Ease</span> Admin Panel
    </div>

    <form id="form1" runat="server">
        <div class="login-box">
            <h3>Administrator Login</h3>

            <div class="mb-3">
                <label class="form-label">Username / Email</label>
                <asp:TextBox ID="txtAdminEmail" runat="server"
                    CssClass="form-control"
                    Placeholder="Enter admin email"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <asp:TextBox ID="txtAdminPassword" runat="server"
                    TextMode="Password"
                    CssClass="form-control"
                    Placeholder="Enter password"></asp:TextBox>
            </div>

            <asp:Button ID="btnAdminLogin" runat="server"
                Text="Login"
                CssClass="btn btn-admin w-100 mb-3" OnClick="btnAdminLogin_Click"/>

            <asp:Label ID="lblAdminMessage" runat="server"
                CssClass="text-danger fw-semibold text-center d-block"></asp:Label>
        </div>
    </form>
</body>
</html>

