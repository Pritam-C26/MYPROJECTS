<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentList.aspx.cs" Inherits="Online_Car_Store.Admin.PaymentList" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Wheelz Admin Panel - Payment List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
        body { min-height: 100vh; }
        .sidebar {
            min-width: 200px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #343a40;
            color: white;
        }
        .sidebar a { color: white; text-decoration: none; }
        .sidebar a:hover { background-color: #495057; }
        .content { margin-left: 200px; padding: 20px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Sidebar -->
        <div class="sidebar d-flex flex-column p-3">
            <h4 class="text-center">Wheelz Admin</h4>
            <hr />
            <ul class="nav nav-pills flex-column mb-auto">
                <li class="nav-item">
                    <a href="AdminDashboard.aspx" class="nav-link"><i class="bi bi-speedometer2"></i> Dashboard</a>
                </li>
                <li>
                    <a href="AddCar.aspx" class="nav-link"><i class="bi bi-car-front"></i> Add Cars</a>
                </li>
                <li>
                    <a href="ManageCars.aspx" class="nav-link"><i class="bi bi-car-front"></i> Manage Cars</a>
                </li>
                <li>
                    <a href="ManageBookings.aspx" class="nav-link"><i class="bi bi-journal-check"></i> Manage Bookings</a>
                </li>
                <li>
                    <a href="PaymentList.aspx" class="nav-link active"><i class="bi bi-graph-up"></i> Payment List</a>
                </li>
                <li>
                     <a href="TestDriveList.aspx" class="nav-link"><i class="bi bi-car-front"></i> Test Drive List</a>
                </li>
                 <li>
                     <a href="Subscribers.aspx" class="nav-link"><i class="bi bi-people"></i> Subscribers</a>
                 </li>
                <li>
                    <a href="FeedbackList.aspx" class="nav-link"><i class="bi bi-chat-dots"></i> Feedback List</a>
                </li>
                <li>
                    <asp:LinkButton ID="btnLogout" runat="server" CssClass="nav-link text-danger" OnClick="btnLogout_Click">
                        <i class="bi bi-box-arrow-right"></i> Logout
                    </asp:LinkButton>
                </li>
            </ul>
        </div>

        <!-- Content Area -->
        <div class="content">
            <div class="container-fluid">
                <h2>Payment List</h2>
                <asp:GridView ID="GridViewPayments" runat="server" CssClass="table table-bordered table-striped table-hover"
                    AutoGenerateColumns="False" AllowPaging="true" PageSize="10" DataKeyNames="PaymentId"
                    OnPageIndexChanging="GridViewPayments_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="PaymentId" HeaderText="Payment ID" ReadOnly="True" />
                        <asp:BoundField DataField="BookingId" HeaderText="Booking ID" />
                        <asp:BoundField DataField="CarId" HeaderText="Car ID" />
                        <asp:BoundField DataField="UserId" HeaderText="User ID" />
                        <asp:BoundField DataField="BookingAmount" HeaderText="Booking Amount ($)" />
                        <asp:BoundField DataField="RemainingAmount" HeaderText="Remaining Amount" />
                        <asp:BoundField DataField="PaymentDate" HeaderText="Payment Date" />
                        <asp:BoundField DataField="PaymentStatus" HeaderText="Payment Status" />
                        <asp:BoundField DataField="PaymentMode" HeaderText="Payment Mode" />
                        <asp:BoundField DataField="PaymentDetails" HeaderText="Payment Details" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>