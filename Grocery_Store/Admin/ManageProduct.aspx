<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageProduct.aspx.cs" Inherits="GroceryStore.Admin.ManageProduct" %>

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

          #btnLogout {
      background-color: transparent;
      color: white;
      border: none;
      margin-left:16px;
  }

  #btnLogout:hover{
      background-color: #157347;
  }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <!-- Sidebar -->
    <div class="sidebar">
        <h3>Admin Panel</h3>
        <a href="Dashboard.aspx">📊 Dashboard</a>
        <a href="ManageProduct.aspx" class="active">🛒 Manage Products</a>
        <a href="ManageOrders.aspx">📦 Manage Orders</a>
        <a href="ManageUsers.aspx">👤 Manage Users</a>
        <a href="Reports.aspx">📈 Reports</a>
        <a href="Settings.aspx">⚙️ Settings</a>
         <asp:Button ID="btnLogout"  runat="server" Text="🚪 Logout" OnClick="btnLogout_Click"  />
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h2 class="mb-4">Manage Products</h2>

        <!-- Category List -->
        <div class="card p-4 mb-4 shadow-sm">
            <h5 class="mb-3">Product Categories</h5>
            <asp:GridView ID="gvCategories" runat="server" CssClass="table table-bordered table-hover"
                AutoGenerateColumns="false" DataKeyNames="CategoryID">
                <Columns>
                    <asp:BoundField DataField="CategoryID" HeaderText="ID" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
                    
                </Columns>
            </asp:GridView>
        </div>

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
                    <label class="form-label">CategoryID</label>
                    <asp:TextBox ID="txtCategoryID" runat="server" CssClass="form-control" placeholder="Enter Category ID"></asp:TextBox>
                </div>

                <div class="col-md-12">
                    <label class="form-label">Description</label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter product description"></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Upload Image</label>
                    <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" />
                </div>

                <div class="col-md-12">
                    <asp:Button ID="btnAdd" runat="server" Text="Add Product" CssClass="btn btn-success px-4" OnClick="btnAdd_Click" />
                </div>
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="mt-3 fw-semibold text-success"></asp:Label>
        </div>

        <!-- Products Grid -->
        <asp:GridView ID="gvProducts" runat="server" CssClass="table table-bordered table-hover"
                    AutoGenerateColumns="false" DataKeyNames="ProductID" OnRowCommand="gvProducts_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="ProductID" HeaderText="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Product Name" />
                        <asp:BoundField DataField="Price" HeaderText="Price (₹)" />
                        <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" />
        
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# ResolveUrl("~/" + Eval("Image")) %>' Width="200" Height="200" CssClass="img-thumbnail" />
                            </ItemTemplate>
                        </asp:TemplateField>
        
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:ButtonField Text="Delete" ButtonType="Button" CommandName="DeleteProduct" ControlStyle-CssClass="btn btn-danger btn-sm" />
                    </Columns>
                </asp:GridView>
    </div>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
