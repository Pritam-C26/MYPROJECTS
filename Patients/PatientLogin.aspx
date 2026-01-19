<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientLogin.aspx.cs" Inherits="Online_Doctor_Appointment_System.Patients.PatientLogin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Patients - Login/Register</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            overflow: hidden;
        }

        .container-fluid {
            height: 100vh;
            display: flex;
            padding: 0;
        }

        .left-panel {
            background: linear-gradient(160deg, #1565c0, #1976d2);
            color: #fff;
            width: 40%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 40px;
        }

        .left-panel h1 {
            font-weight: 700;
            font-size: 2.2rem;
            margin-bottom: 20px;
        }

        .left-panel p {
            font-size: 1rem;
            opacity: 0.9;
            max-width: 400px;
            margin-bottom: 25px;
        }

        .switch-buttons .btn {
            width: 130px;
            border-radius: 25px;
            font-weight: 600;
            margin: 5px;
            transition: 0.3s;
        }

        .switch-buttons .btn:hover {
            transform: scale(1.05);
        }

        .right-panel {
            width: 60%;
            background: #f9f9f9;
            padding: 50px 70px;
            overflow-y: auto;
        }

        h3 {
            font-weight: 700;
            color: #1976d2;
            margin-bottom: 25px;
        }

        .form-label {
            font-weight: 600;
            color: #333;
        }

        .form-control, .form-select {
            border-radius: 8px;
            padding: 10px 12px;
        }

        .btn-custom {
            background-color: #1976d2;
            color: #fff;
            font-weight: 600;
            border-radius: 8px;
            padding: 10px;
            width: 100%;
            transition: 0.3s;
        }

        .btn-custom:hover {
            background-color: #0d47a1;
        }

        #lblMessage {
            display: block;
            text-align: center;
            margin-top: 10px;
            font-weight: 500;
        }

        @media (max-width: 992px) {
            .container-fluid {
                flex-direction: column;
            }

            .left-panel, .right-panel {
                width: 100%;
                height: auto;
                padding: 30px 20px;
            }

            .right-panel {
                padding: 30px 25px;
            }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">
    <div class="container-fluid">

        <!-- LEFT PANEL -->
        <div class="left-panel">
            <h1>Welcome to DocEase</h1>
            <p>Book appointments easily, connect with doctors, and manage your health smarter.</p>
            <div class="switch-buttons">
                <asp:Button ID="btnLoginSwitch" runat="server" Text="LOGIN"
                    CssClass="btn btn-light text-primary"
                    OnClientClick="swapForm('login'); return false;" />
                <asp:Button ID="btnRegisterSwitch" runat="server" Text="REGISTER"
                    CssClass="btn btn-outline-light"
                    OnClientClick="swapForm('register'); return false;" />
            </div>
        </div>

        <!-- RIGHT PANEL -->
        <div class="right-panel">

            <!-- LOGIN PANEL -->
            <asp:Panel ID="pnlLogin" runat="server">
                <h3>Patient Login</h3>

                <div class="mb-3">
                    <label class="form-label">Email Address</label>
                    <asp:TextBox ID="txtLoginEmail" runat="server" CssClass="form-control" Placeholder="Enter your email"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <asp:TextBox ID="txtLoginPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Enter your password"></asp:TextBox>
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-custom mb-2" OnClick="btnLogin_Click" />

                <!-- FORGOT PASSWORD LINK (ADDED) -->
                <div class="text-center">
                    <a href="javascript:void(0);" onclick="swapForm('forgot')" style="font-weight:600;color:#1976d2;text-decoration:none;">
                        Forgot Password?
                    </a>
                </div>
            </asp:Panel>

            <!-- FORGOT PASSWORD PANEL (ADDED) -->
            <asp:Panel ID="pnlForgot" runat="server" Style="display:none;">
                <h3>Forgot Password</h3>

                <div class="mb-3">
                    <label class="form-label">Registered Email</label>
                    <asp:TextBox ID="txtForgotEmail" runat="server" CssClass="form-control" Placeholder="Enter your registered email"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label class="form-label">New Password</label>
                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Enter your new password"></asp:TextBox>
                    </div>

                <asp:Button ID="btnForgotPassword" runat="server" Text="Reset Password" CssClass="btn btn-custom mb-3" OnClick="btnForgotPassword_Click" />

                <div class="text-center">
                    <a href="javascript:void(0);" onclick="swapForm('login')" style="font-weight:600;color:#1976d2;text-decoration:none;">
                        Back to Login
                    </a>
                </div>
            </asp:Panel>

            <!-- REGISTER PANEL -->
            <asp:Panel ID="pnlRegister" runat="server" Style="display:none;">
                <h3>Patient Registration</h3>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Full Name</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Enter your name"></asp:TextBox>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" Placeholder="Enter your email"></asp:TextBox>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Create a password"></asp:TextBox>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Gender</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Select Gender" Value="" />
                            <asp:ListItem Text="Male" Value="Male" />
                            <asp:ListItem Text="Female" Value="Female" />
                            <asp:ListItem Text="Other" Value="Other" />
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Date of Birth</label>
                        <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Age</label>
                        <asp:TextBox ID="txtAge" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Phone</label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Placeholder="Enter your phone number"></asp:TextBox>
                    </div>

                    <div class="col-md-12 mb-3">
                        <label class="form-label">Address</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" Placeholder="Enter your address"></asp:TextBox>
                    </div>
                </div>

                <asp:Label ID="lblMessage" runat="server"></asp:Label>

                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-custom mb-3" OnClick="btnRegister_Click" />
            </asp:Panel>

        </div>
    </div>

    <!-- UPDATED SCRIPT -->
    <script>
        function swapForm(panel) {

            var loginPanel = document.getElementById("<%= pnlLogin.ClientID %>");
            var registerPanel = document.getElementById("<%= pnlRegister.ClientID %>");
            var forgotPanel = document.getElementById("<%= pnlForgot.ClientID %>");

            loginPanel.style.display = "none";
            registerPanel.style.display = "none";
            forgotPanel.style.display = "none";

            if (panel === "login") loginPanel.style.display = "block";
            if (panel === "register") registerPanel.style.display = "block";
            if (panel === "forgot") forgotPanel.style.display = "block";
        }
    </script>
</form>
</body>
</html>
