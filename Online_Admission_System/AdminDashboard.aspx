<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Online_Admission_System.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            min-height: 100vh;
            background: #343a40;
            color: white;
        }
        .sidebar a {
            color: white;
            display: block;
            padding: 10px 15px;
            text-decoration: none;
        }
        .sidebar a:hover {
            background: #495057;
        }
        .content-area {
            padding: 20px;
        }
        .card {
            border-radius: 15px;
        }
    </style>
</head>
<body>
   <form id="form1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 sidebar p-3">
                <h4 class="mb-4">Admin Panel</h4>
                <ul class="nav flex-column">
                    <li><a href="AdminDashboard.aspx">Dashboard</a></li>
                    <li><a href="ViewApplications.aspx">View Applications</a></li>
                    <li><a href="ConfirmAdmissions.aspx">Confirm Admissions</a></li>
                    <li><a href="CourseList.aspx">Course List</a></li>
                    <li><a href="PaymentList.aspx">Payments</a></li>
                    <li><a href="ViewMessage.aspx">Messages</a></li>
                    <li>
                        <asp:LinkButton ID="btnLogout" runat="server" CssClass="nav-link text-danger" OnClick="btnLogout_Click" >Logout</asp:LinkButton>
                    </li>
                </ul>
              </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 content-area">
                <h2 class="mb-4">Welcome, Admin</h2>

                <div class="row">
                    <!-- Total Applications -->
                    <div class="col-md-3 mb-3">
                        <div class="card text-center shadow">
                            <div class="card-body">
                                <h5 class="card-title">Total Applications</h5>
                                <asp:Label ID="lblApplications" runat="server" CssClass="fs-4 fw-bold text-primary">0</asp:Label>
                            </div>
                        </div>
                    </div>

                    <!-- Confirmed Admissions -->
                    <div class="col-md-3 mb-3">
                        <div class="card text-center shadow">
                            <div class="card-body">
                                <h5 class="card-title">Confirmed Applications</h5>
                                <asp:Label ID="lblConfirmed" runat="server" CssClass="fs-4 fw-bold text-success">0</asp:Label>
                            </div>
                        </div>
                    </div>

                    <!-- Pending Applications -->
                    <div class="col-md-3 mb-3">
                        <div class="card text-center shadow">
                            <div class="card-body">
                                <h5 class="card-title">Pending Applications</h5>
                                <asp:Label ID="lblPending" runat="server" CssClass="fs-4 fw-bold text-warning">0</asp:Label>
                            </div>
                        </div>
                    </div>

                    <!-- Rejected Applications -->
                    <div class="col-md-3 mb-3">
                        <div class="card text-center shadow">
                            <div class="card-body">
                                <h5 class="card-title">Rejected Applications</h5>
                                <asp:Label ID="lblReject" runat="server" CssClass="fs-4 fw-bold text-danger">0</asp:Label>
                            </div>
                        </div>
                    </div>
                </div> 

                    <!-- Latest Applications Table -->
                    <div class="card shadow mt-4">
                        <div class="card-header bg-primary text-white">
                            Latest Applications
                        </div>
                        <div class="card-body">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped"
                                AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="ApplicationId" HeaderText="App ID" />
                                    <asp:BoundField DataField="FullName" HeaderText="Student Name" />
                                    <asp:BoundField DataField="CourseName" HeaderText="Course" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                </div>
            </div>
    </form>
</body>
</html>