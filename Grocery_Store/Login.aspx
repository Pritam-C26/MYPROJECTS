<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GroceryStore.Login" %>


<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>FRESHKART - Login/Register</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f1f3f6;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .wrapper {
            display: flex;
            width: 900px;
            height: 520px;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }
        .left {
            background: #2e7d32;
            color: #fff;
            width: 40%;
            padding: 40px 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-align: center;
        }
        .left h1 {
            font-size: 34px;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .left p {
            font-size: 16px;
            line-height: 1.6;
            opacity: 0.9;
            margin-bottom: 25px;
        }
        .switch-buttons .btn {
            width: 100%;
            margin: 6px 0;
            font-weight: bold;
            border-radius: 6px;
        }
        .right {
            width: 60%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .form-control {
            margin-bottom: 15px;
        }
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <!-- Left Section -->
            <div class="left">
                <h1>FRESHKART</h1>
                <p>Get your daily groceries delivered fresh to your doorstep.  
                Shop fruits, vegetables, dairy, and essentials with ease.</p>
                <div class="switch-buttons">
                    <asp:Button ID="btnLoginSwitch" runat="server" Text="Login" 
                        CssClass="btn btn-light text-success" 
                        OnClientClick="swapForm('login'); return false;" />

                    <asp:Button ID="btnRegisterSwitch" runat="server" Text="Register" 
                        CssClass="btn btn-warning text-white" 
                        OnClientClick="swapForm('register'); return false;" />
                </div>
            </div>

            <!-- Right Section -->
            <div class="right">
                <!-- Login Form -->
                <asp:Panel ID="pnlLogin" runat="server">
                    <h3 class="mb-4">Login</h3>
                    <asp:TextBox ID="txtLoginEmail" runat="server" CssClass="form-control" Placeholder="Enter Email/Phone"></asp:TextBox>
                    <asp:TextBox ID="txtLoginPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Enter Password"></asp:TextBox>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-success w-100" OnClick="btnLogin_Click" />
                </asp:Panel>

                <!-- Register Form -->
                <asp:Panel ID="pnlRegister" runat="server" CssClass="hidden">
                    <h3 class="mb-4">Register</h3>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Enter Full Name"></asp:TextBox>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Enter Email"></asp:TextBox>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Placeholder="Enter Phone number"></asp:TextBox>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Create Password"></asp:TextBox>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Confirm Password"></asp:TextBox>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" Placeholder="Enter Address"></asp:TextBox>
                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success w-100" OnClick="btnRegister_Click"  />
                </asp:Panel>
            </div>
        </div>
    </form>

    <script>
        function swapForm(form) {
            var loginPanel = document.getElementById('<%= pnlLogin.ClientID %>');
            var registerPanel = document.getElementById('<%= pnlRegister.ClientID %>');

            loginPanel.style.display = "none";
            registerPanel.style.display = "none";

            if (form === "login") {
                loginPanel.style.display = "block";
            } else {
                registerPanel.style.display = "block";
            }
        }
    </script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>