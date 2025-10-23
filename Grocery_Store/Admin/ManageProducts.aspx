<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageProducts.aspx.cs" Inherits="GroceryStore.Admin.ManageProducts" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Manage Products - FreshKart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }

        .sidebar {
            height: 100vh;
            width: 240px;
            position: fixed;
            left: 0;
            top: 0;
            background-color: #198754;
            color: white;
            padding-top: 20px;
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
        }

        .sidebar a:hover, .sidebar a.active {
            background-color: #157347;
        }

        .main-content {
            margin-left: 240px;
            padding: 30px;
        }

        .card {
            border: none;
            border-radius: 10px;
        }

        .form-label {
            font-weight: 500;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <!-- Sidebar -->
    <div class="sidebar">
        <h3>Admin Panel</h3>
        <a href="Dashboard.aspx">📊 Dashboard</a>
        <a href="ManageProducts.aspx" class="active">🛒 Manage Products</a>
        <a href="ManageOrders.aspx">📦 Manage Orders</a>
        <a href="ManageUsers.aspx">👤 Manage Users</a>
        <a href="Reports.aspx">📈 Reports</a>
        <a href="Settings.aspx">⚙️ Settings</a>
        <div class="mt-auto p-3">
            <asp:Button ID="btnLogout" runat="server" Text="🚪 Logout" CssClass="btn btn-danger w-100 fw-semibold" OnClick="btnLogout_Click" />
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h2 class="mb-4">Manage Products</h2>

        <!-- Add Product Form -->
        <div class="card p-4 mb-4 shadow-sm">
            <h5 class="mb-3">Add New Product</h5>
            <div class="row g-3">
                <div class="col-md-4">
                    <label class="form-label">Product Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter product name"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Price (₹)</label>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Enter price"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Category</label>
                    <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control" placeholder="Enter category"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Image URL</label>
                    <asp:TextBox ID="txtImage" runat="server" CssClass="form-control" placeholder="Enter image URL"></asp:TextBox>
                </div>
                <div class="col-md-12">
                    <asp:Button ID="btnAdd" runat="server" Text="Add Product" CssClass="btn btn-success px-4"  />
                </div>
            </div>
        </div>

        <!-- Products Grid -->
        <div class="card p-4 shadow-sm">
            <h5 class="mb-3">All Products</h5>
            <asp:GridView ID="gvProducts" runat="server" CssClass="table table-bordered table-hover"
                AutoGenerateColumns="false" DataKeyNames="ProductID" OnRowCommand="gvProducts_RowCommand">
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="ID" />
                    <asp:BoundField DataField="ProductName" HeaderText="Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price (₹)" />
                    <asp:BoundField DataField="Category" HeaderText="Category" />
                    <asp:ImageField DataImageUrlField="Image" HeaderText="Image" ControlStyle-Width="80" ControlStyle-Height="80" />
                    <asp:ButtonField Text="Delete" ButtonType="Button" CommandName="DeleteProduct" ControlStyle-CssClass="btn btn-danger btn-sm" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
