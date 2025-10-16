<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentList.aspx.cs" Inherits="Online_Admission_System.PaymentList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment List</title>
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
                <div class="col-md-9 col-lg-10 p-4">
                    <h2 class="mb-4">Payment Records</h2>

                    <!-- Payment List -->
                    <div class="card p-3">
                        <asp:GridView ID="gvPayments" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover mt-3" >
    
                            <Columns>
                                <asp:BoundField DataField="TransactionId" HeaderText="Transaction ID" ReadOnly="true" />
                                <asp:BoundField DataField="UserId" HeaderText="User ID" />
                                <asp:BoundField DataField="ApplicationId" HeaderText="Application ID" />
                                <asp:BoundField DataField="CourseId" HeaderText="Course ID" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount (₹)" DataFormatString="{0:N2}" />
                                <asp:BoundField DataField="PaymentMethod" HeaderText="Payment Method" />
                                <asp:BoundField DataField="PaymentDetails" HeaderText="Payment Details" />
                                <asp:BoundField DataField="TransactionDate" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy HH:mm}" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                            </Columns>

                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
