<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorLogin.aspx.cs" Inherits="Online_Doctor_Appointment_System.Doctors.DoctorLogin" %>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Doctors - Login/Register</title>

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

        #lblMessageDoctor {
            display: block;
            text-align: center;
            margin-top: 10px;
            font-weight: 500;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">
<div class="container-fluid">

    <!-- LEFT PANEL -->
    <div class="left-panel">
        <h1>Welcome Doctors — DocEase</h1>
        <p>Manage your availability, consultation fees and appointments in one place.</p>
        <div class="switch-buttons">
            <asp:Button ID="btnLoginSwitchDoc" runat="server" Text="LOGIN"
                CssClass="btn btn-light text-primary"
                OnClientClick="swapForm('login'); return false;" />
            <asp:Button ID="btnRegisterSwitchDoc" runat="server" Text="REGISTER"
                CssClass="btn btn-outline-light"
                OnClientClick="swapForm('register'); return false;" />
        </div>
    </div>

    <!-- RIGHT PANEL -->
    <div class="right-panel">

        <!-- LOGIN PANEL -->
        <asp:Panel ID="pnlLoginDoc" runat="server">
            <h3>Doctor Login</h3>

            <div class="mb-3">
                <label class="form-label">Email Address</label>
                <asp:TextBox ID="txtLoginEmailDoc" runat="server" CssClass="form-control" Placeholder="Enter your email"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <asp:TextBox ID="txtLoginPasswordDoc" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Enter your password"></asp:TextBox>
            </div>

            <asp:Button ID="btnLoginDoc" runat="server" Text="Login" CssClass="btn btn-custom mb-3" OnClick="btnLoginDoc_Click" />

            <asp:LinkButton ID="lnkForgotPassword" runat="server"
                CssClass="text-primary fw-semibold"
                OnClientClick="showForgot(); return false;">
                Forgot Password ?
            </asp:LinkButton>

            <asp:Label ID="lblloginMessage" runat="server"></asp:Label>
        </asp:Panel>

        <!-- FORGOT PASSWORD PANEL -->
        <asp:Panel ID="pnlForgotPassword" runat="server" Style="display:none" CssClass="card shadow-sm mt-4">
            <div class="card-body">
                <h5 class="text-primary fw-semibold mb-3">Reset Password</h5>

                <div class="mb-3">
                    <asp:TextBox ID="txtUsername" CssClass="form-control" Placeholder="Enter your Username" runat="server"></asp:TextBox>
                </div>

                <asp:TextBox ID="txtNewPassword" TextMode="Password" CssClass="form-control" Placeholder="Enter New Password" runat="server"></asp:TextBox>

                <asp:Label ID="lblForgotMsg" CssClass="text-danger fw-semibold" runat="server"></asp:Label>

                <asp:Button ID="btnResetPassword" Text="Update Password" CssClass="btn btn-custom mt-3"
                    OnClick="btnResetPassword_Click" runat="server" />
            </div>
        </asp:Panel>

        <!-- REGISTER PANEL (FULL & UNCHANGED) -->
        <asp:Panel ID="pnlRegisterDoc" runat="server" Style="display:none;">
            <h3>Doctor Registration</h3>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Full Name</label>
                    <asp:TextBox ID="txtDocName" runat="server" CssClass="form-control" Placeholder="Enter your full name"></asp:TextBox>
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">Email Address</label>
                    <asp:TextBox ID="txtDocEmail" runat="server" TextMode="Email" CssClass="form-control" Placeholder="Enter your email"></asp:TextBox>
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">Password</label>
                    <asp:TextBox ID="txtDocPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Create a password"></asp:TextBox>
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">Specialization</label>
                    <asp:TextBox ID="txtSpecialization" runat="server" CssClass="form-control" Placeholder="e.g. Cardiology, Dermatology"></asp:TextBox>
                </div>

                <div class="col-md-4 mb-3">
                    <label class="form-label">Experience (Years)</label>
                    <asp:TextBox ID="txtExperienceYears" runat="server" CssClass="form-control" Placeholder="e.g. 5"></asp:TextBox>
                </div>

                <div class="col-md-8 mb-3">
                    <label class="form-label">Available Days / Timings</label>
                    <asp:TextBox ID="txtAvailableDays" runat="server" CssClass="form-control" Placeholder="e.g. Mon-Fri 10:00-14:00"></asp:TextBox>
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">Consultation Fee</label>
                    <asp:TextBox ID="txtConsultationFee" runat="server" CssClass="form-control" Placeholder="e.g. 500"></asp:TextBox>
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">Phone</label>
                    <asp:TextBox ID="txtDocPhone" runat="server" CssClass="form-control" Placeholder="Enter phone number"></asp:TextBox>
                </div>

                <div class="col-md-12 mb-3">
                    <label class="form-label">Clinic / Address</label>
                    <asp:TextBox ID="txtDocAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" Placeholder="Enter clinic address"></asp:TextBox>
                </div>
            </div>

            <asp:HiddenField ID="hfRole" runat="server" Value="Doctor" />
            <asp:Label ID="lblMessageDoctor" runat="server"></asp:Label>

            <asp:Button ID="btnRegisterDoc" runat="server" Text="Register"
                CssClass="btn btn-custom mb-3"
                OnClick="btnRegisterDoc_Click" />


        </asp:Panel>

    </div>
</div>

<script>
    function swapForm(panel) {
        var loginPanel = document.getElementById("<%= pnlLoginDoc.ClientID %>");
        var registerPanel = document.getElementById("<%= pnlRegisterDoc.ClientID %>");
        var forgotPanel = document.getElementById("<%= pnlForgotPassword.ClientID %>");

        loginPanel.style.display = "none";
        registerPanel.style.display = "none";
        forgotPanel.style.display = "none";

        if (panel === "login") loginPanel.style.display = "block";
        if (panel === "register") registerPanel.style.display = "block";
    }

    function showForgot() {
        document.getElementById("<%= pnlLoginDoc.ClientID %>").style.display = "none";
        document.getElementById("<%= pnlRegisterDoc.ClientID %>").style.display = "none";
        document.getElementById("<%= pnlForgotPassword.ClientID %>").style.display = "block";
    }
</script>

</form>
</body>
</html>
