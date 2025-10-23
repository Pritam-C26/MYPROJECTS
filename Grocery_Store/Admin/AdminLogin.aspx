<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="GroceryStore.Admin.AdminLogin" %>



<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>FRESHKART Admin - Login</title>

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
            width: 905px;
            height: 710px;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }
        .left {
            background: #1b5e20;
            color: #fff;
            width: 45%;
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
        .right {
            width: 55%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .form-control {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <div class="wrapper">
            <!-- Left Side -->
            <div class="left">
                <h1>FRESHKART</h1>
                <p>Admin Dashboard Access<br />Manage products, orders, and users efficiently.</p>
                <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" 
                     alt="Admin Icon" class="img-fluid" style="width:120px; margin:0 auto;">
            </div>

            <!-- Right Side -->
            <div class="right">
                <h3 class="mb-4 text-center text-success fw-bold">Admin Login</h3>
                <asp:TextBox ID="txtAdminUsername" runat="server" CssClass="form-control" Placeholder="Enter Admin Username"></asp:TextBox>
                <asp:TextBox ID="txtAdminPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Enter Password" ></asp:TextBox>
                <asp:Button ID="btnAdminLogin" runat="server" Text="Login" CssClass="btn btn-success w-100 mt-2" OnClick="btnAdminLogin_Click" />
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="mt-3 d-block text-center"></asp:Label>
            </div>
        </div>
    </form>

    </body>
</html>
