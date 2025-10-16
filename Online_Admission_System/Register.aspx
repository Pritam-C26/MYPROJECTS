<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Online_Admission_System.Register" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Student Registration</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #e0f7fa, #ffffff);
        }
        .register-card {
            max-width: 450px;
            margin: 60px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0px 4px 20px rgba(0,0,0,0.1);
        }
        .register-card h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #0d6efd;
        }
        .btn-custom {
            width: 100%;
            background-color: #0d6efd;
            color: white;
            font-weight: bold;
            border-radius: 6px;
        }
        
        .btn-primary{
            width:100%;
            color: white;
            font-weight: bold;
            border-radius: 6px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-card">
            <h2>Student Registration</h2>

            <div class="mb-3">
                <label class="form-label">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter email"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Confirm Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Re-enter password"></asp:TextBox>
            </div>
            
            <div class="mb-3">
                <asp:Label runat="server" Text="Role"></asp:Label>
                <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                    <asp:ListItem Text="Student" Value="Student"></asp:ListItem>
                </asp:DropDownList>

            </div>
            <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-custom mb-3" Text="Register" OnClick="btnRegister_Click"  />
            <asp:Button ID="btnSignIn" runat="server" Text="Sign In" CssClass=" btn btn-primary mb-3"   PostBackUrl="~/Login.aspx"/>
            
            <div class="text-center">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>



                <asp:GridView ID="GridView1" runat="server" 
                    CssClass="table table-bordered table-striped mt-4"
                    AutoGenerateColumns="False" 
                    DataKeyNames="UserId"
                    AllowPaging="true" PageSize="5">

                    <Columns>
                        <asp:BoundField DataField="UserId" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="Username" HeaderText="Username" />
                        <asp:BoundField DataField="Role" HeaderText="Role" />
                    </Columns>
                </asp:GridView>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>