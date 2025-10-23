<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="GroceryStore.Admin.ManageUsers" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Manage Users - FreshKart Admin</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }

        /* Sidebar - same as ManageOrders */
        .sidebar {
            height: 100vh;
            width: 240px;
            position: fixed;
            left: 0;
            top: 0;
            background-color: #198754;
            color: white;
            padding-top: 20px;
            transition: all 0.3s;
        }

        .sidebar h3 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
        }

        .sidebar a {
            display: block;
            color: white;
            padding: 12px 20px;
            text-decoration: none;
            transition: background 0.3s;
        }

        .sidebar a:hover,
        .sidebar a.active {
            background-color: #157347;
        }

        #btnLogout {
            background-color: transparent;
            color: white;
            border: none;
            margin-left: 16px;
        }

        #btnLogout:hover {
            background-color: #157347;
        }

        /* Navbar & Main content */
        .navbar {
            margin-left: 240px;
            background: white;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-weight: 600;
        }

        .main-content {
            margin-left: 240px;
            padding: 30px;
        }

        /* Table styling */
        .table th {
            background-color: #198754;
            color: white;
        }

        .btn {
            padding: 4px 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- ✅ Sidebar -->
        <div class="sidebar">
            <h3>Admin Panel</h3>
            <a href="Dashboard.aspx">📊 Dashboard</a>
            <a href="ManageProduct.aspx">🛒 Manage Products</a>
            <a href="ManageOrders.aspx">📦 Manage Orders</a>
            <a href="ManageUsers.aspx" class="active">👤 Manage Users</a>
            <a href="Reports.aspx">📈 Reports</a>
            
            <asp:Button ID="btnLogout" runat="server" Text="🚪 Logout" OnClick="btnLogout_Click" />
        </div>

        <!-- ✅ Top Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <span class="navbar-brand">Manage Users</span>
            </div>
        </nav>

        <!-- ✅ Main Content -->
        <div class="main-content">
            <h2 class="mb-4">All Registered Users</h2>

            <asp:GridView ID="gvUsers" runat="server" CssClass="table table-bordered table-hover"
                AutoGenerateColumns="False" DataKeyNames="UserID" OnRowCommand="gvUsers_RowCommand">
                <Columns>
                    <asp:BoundField DataField="UserID" HeaderText="User ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete"
                                CommandName="DeleteUser" CommandArgument='<%# Eval("UserID") %>'
                                CssClass="btn btn-sm btn-danger me-1" />
                            <asp:Button ID="btnBlock" runat="server" Text="Block"
                                CommandName="BlockUser" CommandArgument='<%# Eval("UserID") %>'
                                CssClass="btn btn-sm btn-warning me-1" />
                            <asp:Button ID="btnUnblock" runat="server" Text="Unblock"
                                CommandName="UnblockUser" CommandArgument='<%# Eval("UserID") %>'
                                CssClass="btn btn-sm btn-success" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
