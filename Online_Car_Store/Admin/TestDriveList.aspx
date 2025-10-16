<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestDriveList.aspx.cs" Inherits="Online_Car_Store.Admin.TestDriveList" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Wheelz Admin Panel - Test Drive List</title>
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
                    <a href="PaymentList.aspx" class="nav-link"><i class="bi bi-graph-up"></i> Payment List</a>
                </li>
                <li>
                    <a href="TestDriveList.aspx" class="nav-link active"><i class="bi bi-car-front"></i> Test Drive List</a>
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
                <h2>Test Drive List</h2>
                <asp:GridView ID="gvTestDrive" runat="server" CssClass="table table-bordered table-striped table-hover"
                    AutoGenerateColumns="False" AllowPaging="true" PageSize="10" DataKeyNames="BookingId"
                    OnPageIndexChanging="gvTestDrive_PageIndexChanging" OnRowCommand="gvTestDrive_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="BookingId" HeaderText="Booking ID" />
                        <asp:BoundField DataField="CarId" HeaderText="Car ID" />
                        <asp:BoundField DataField="UserId" HeaderText="User ID" />
                        <asp:BoundField DataField="PreferredD" HeaderText="Preferred Date" />
                        <asp:BoundField DataField ="PreferredT" HeaderText="Preferred Time" />
                        <asp:BoundField DataField="Status" HeaderText="Booking Status" />
                        <asp:BoundField DataField="RequestDate" HeaderText="Date & Time of Booking" />
                         <asp:TemplateField HeaderText="Actions">
                         <ItemTemplate>
                             <asp:Button ID="btnAvailable" runat="server" Text="Your Booking is Accepted." CssClass="btn btn-sm btn-info me-1" CommandArgument='<%# Eval("BookingId") %>' CommandName="Available"/>
                             <asp:Button ID="btnUnavailable" runat="server" Text="Choose Another Date & Time." CssClass="btn btn-sm btn-warning me-1" CommandArgument='<%# Eval("BookingId") %>' CommandName="UnAvailable"/>
                         </ItemTemplate>
                     </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>