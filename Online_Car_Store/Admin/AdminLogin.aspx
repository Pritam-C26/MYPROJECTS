<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Online_Car_Store.Admin.AdminLogin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card shadow">
                        <div class="card-header text-center bg-primary text-white">
                            <h4>Wheelz Admin Login</h4>
                        </div>
                        <div class="card-body">
                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control mb-3" Placeholder="Username"></asp:TextBox>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control mb-3" TextMode="Password" Placeholder="Password"></asp:TextBox>
                            <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary w-100" Text="Login" OnClick="btnLogin_Click"  />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>