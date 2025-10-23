<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="GroceryStore.Admin.Dashboard" %>



<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard - FreshKart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }

        /* Sidebar styles */
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

        .sidebar a:hover, .sidebar a.active {
            background-color: #157347;
        }
          #btnLogout {
              background-color: transparent;
              color: white;
              border: none;
              margin-left:16px;
          }

          #btnLogout:hover{
              background-color: #157347;
          }

        /* Main content */
        .main-content {
            margin-left: 240px;
            padding: 30px;
        }

        .card {
            border: none;
            border-radius: 15px;
        }

        .card h5 {
            font-weight: 600;
        }

        .navbar {
            margin-left: 240px;
            background: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .navbar-brand {
            font-weight: 600;
        }

      
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Sidebar -->
        <div class="sidebar">
            <h3>Admin Panel</h3>
            <a href="Dashboard.aspx" class="active">📊 Dashboard</a>
            <a href="ManageProduct.aspx">🛒 Manage Products</a>
            <a href="ManageOrders.aspx">📦 Manage Orders</a>
            <a href="ManageUsers.aspx">👤 Manage Users</a>
            <a href="Reports.aspx">📈 Reports</a>
           
            <asp:Button ID="btnLogout"  runat="server" Text="🚪 Logout" OnClick="btnLogout_Click"  />

        </div>

        <!-- Top Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <span class="navbar-brand">Welcome, Admin</span>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="main-content">
            <h2 class="mb-4">Dashboard Overview</h2>
            <div class="row g-4">
                <div class="col-md-3">
                    <div class="card shadow-sm text-center p-3 bg-success text-white">
                        <h5>Total Products</h5>
                        <h3><asp:Label ID="lblProducts" runat="server" Text="0"></asp:Label></h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card shadow-sm text-center p-3 bg-primary text-white">
                        <h5>Total Orders</h5>
                        <h3><asp:Label ID="lblOrders" runat="server" Text="0"></asp:Label></h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card shadow-sm text-center p-3 bg-warning text-dark">
                        <h5>Delivered Orders</h5>
                        <h3><asp:Label ID="lblDelivered" runat="server" Text="0"></asp:Label></h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card shadow-sm text-center p-3 bg-danger text-white">
                        <h5>Cancelled Orders</h5>
                        <h3><asp:Label ID="lblCancelled" runat="server" Text="0" ></asp:Label></h3>
                    </div>
                </div>
            </div>

            <hr class="my-5" />

            <h4>Recent Orders</h4>
            <asp:GridView ID="gvRecentOrders" runat="server" CssClass="table table-striped table-hover mt-3" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                    <asp:BoundField DataField="CustomerName" HeaderText="Customer" />
                    <asp:BoundField DataField="TotalAmount" HeaderText="Amount (₹)" />
                    <asp:BoundField DataField="OrderDate" HeaderText="Date" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
