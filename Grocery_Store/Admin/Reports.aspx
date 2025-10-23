< %@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="GroceryStore.Admin.Reports" %>


<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Reports - FreshKart Admin</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }

        /* Sidebar */
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

        /* Navbar */
        .navbar {
            margin-left: 240px;
            background: white;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-weight: 600;
        }

        /* Main content */
        .main-content {
            margin-left: 240px;
            padding: 30px;
        }

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .table th {
            background-color: #198754;
            color: white;
        }

        h2.section-title {
            margin-bottom: 20px;
            font-weight: 600;
            color: #198754;
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
            <a href="ManageUsers.aspx">👤 Manage Users</a>
            <a href="Reports.aspx" class="active">📈 Reports</a>
            
            <asp:Button ID="btnLogout" runat="server" Text="🚪 Logout" OnClick="btnLogout_Click" />
        </div>

        <!-- ✅ Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <span class="navbar-brand">Reports</span>
            </div>
        </nav>

        <!-- ✅ Main content -->
        <div class="main-content">
            <!-- Subscribers Section -->
            <h2 class="section-title">📬 Subscribers List</h2>
            <div class="card mb-5 p-3">
                <asp:GridView ID="gvSubscribers" runat="server" CssClass="table table-bordered table-hover"
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="SubscriberID" HeaderText="ID" />
                        <asp:BoundField DataField="SubscriberEmail" HeaderText="Email" />
                        
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Feedback Section -->
            <h2 class="section-title">💬 Customer Feedback</h2>
            <div class="card p-3">
                <asp:GridView ID="gvFeedback" runat="server" CssClass="table table-bordered table-hover"
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="FeedbackID" HeaderText="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="FeedBackSubject" HeaderText="Subject" />
                        <asp:BoundField DataField="FeedBackMessage" HeaderText="Message" />
                        <asp:BoundField DataField="DateTime" HeaderText="Submitted On" DataFormatString="{0:dd-MM-yyyy}" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
