<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageOrders.aspx.cs" Inherits="GroceryStore.Admin.ManageOrders" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Manage Orders - FreshKart Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;/
        }

        /* Sidebar styles - same as Dashboard */
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

        /* Navbar & Main */
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

        .status-btn {
            margin-right: 5px;
        }

        .status-badge {
            padding: 6px 10px;
            border-radius: 8px;
            font-size: 0.9rem;
        }

        .status-shipped {
            background-color: #ffc107;
            color: black;
        }

        .status-delivery {
            background-color: #0dcaf0;
            color: black;
        }

        .status-delivered {
            background-color: #198754;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Sidebar (same as dashboard) -->
        <div class="sidebar">
            <h3>Admin Panel</h3>
            <a href="Dashboard.aspx">📊 Dashboard</a>
            <a href="ManageProduct.aspx">🛒 Manage Products</a>
            <a href="ManageOrders.aspx" class="active">📦 Manage Orders</a>
            <a href="ManageUsers.aspx">👤 Manage Users</a>
            <a href="Reports.aspx">📈 Reports</a>
           
            <asp:Button ID="btnLogout" runat="server" Text="🚪 Logout" OnClick="btnLogout_Click"  />
        </div>

        <!-- Top Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <span class="navbar-brand">Manage Orders</span>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="main-content">
            <h2 class="mb-4">All Customer Orders</h2>

            <asp:GridView ID="gvOrders" runat="server" CssClass="table table-bordered table-hover"
                AutoGenerateColumns="False" DataKeyNames="OrderID" OnRowCommand="gvOrders_RowCommand">
                <Columns>
                    <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                    <asp:BoundField DataField="Name" HeaderText="Customer Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" />
                    <asp:BoundField DataField="PaymentMethod" HeaderText="Payment Method" />
                    <asp:BoundField DataField="OrderStatus" HeaderText="Status" />
                      
                    <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:dd MMM yyyy}" />

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnShipped" runat="server" Text="Shipped"
                                CommandName="Shipped" CommandArgument='<%# Eval("OrderID") %>'
                                CssClass="btn btn-sm btn-warning status-btn" />
                            <asp:Button ID="btnOutForDelivery" runat="server" Text="Out For Delivery"
                                CommandName="OutForDelivery" CommandArgument='<%# Eval("OrderID") %>'
                                CssClass="btn btn-sm btn-info status-btn" />
                            <asp:Button ID="btnDelivered" runat="server" Text="Delivered"
                                CommandName="Delivered" CommandArgument='<%# Eval("OrderID") %>'
                                CssClass="btn btn-sm btn-success status-btn" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
