<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Online_Admission_System.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Login</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: linear-gradient(to right, #eef2f3, #d9e2ec);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            max-width: 400px;
            width: 100%;
            padding: 30px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0px 8px 24px rgba(0, 0, 0, 0.1);
        }

        .form-label {
            margin-top: 10px;
        }

        .btn-custom {
            background-color: #007BFF;
            color: white;
            border: none;
            transition: 0.3s;
        }

        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-card">
            <h3 class="text-center mb-4">Login</h3>

            <div class="mb-3">
                <asp:Label runat="server" Text="Email" CssClass="form-label" />
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
            </div>

            <div class="mb-3">
                <asp:Label runat="server" Text="Password" CssClass="form-label" />
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
            </div>

            <div class="d-grid gap-3 mt-3">
                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary btn-lg" Text="Login" OnClick="btnLogin_Click" />
                <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="btn btn-secondary btn-lg" PostBackUrl="~/Register.aspx" />
            </div>
        </div>




    </form>
  

    <!-- Bootstrap JS (optional if you add alerts or modal later) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>