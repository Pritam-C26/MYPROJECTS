<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageCars.aspx.cs" Inherits="Online_Car_Store.Admin.ManageCars" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Wheelz Admin Panel - Manage Cars</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
        body {
            min-height: 100vh;
            background-color: #f8f9fa;
        }
        .sidebar {
            min-width: 200px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #343a40;
            color: white;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #495057;
            color: white;
        }
        .content {
            margin-left: 200px;
            padding: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar d-flex flex-column p-3">
            <h4 class="text-center">Wheelz Admin</h4>
            <hr />
            <ul class="nav nav-pills flex-column mb-auto">
                <li class="nav-item">
                    <a href="AdminDashboard.aspx" class="nav-link"><i class="bi bi-speedometer2 me-2"></i> Dashboard</a>
                </li>
                <li class="nav-item">
                    <a href="AddCar.aspx" class="nav-link"><i class="bi bi-car-front me-2"></i> Add Cars</a>
                </li>
                <li class="nav-item">
                    <a href="ManageCars.aspx" class="nav-link active"><i class="bi bi-car-front me-2"></i> Manage Cars</a>
                </li>
                <li class="nav-item">
                    <a href="ManageBookings.aspx" class="nav-link"><i class="bi bi-journal-check me-2"></i> Manage Bookings</a>
                </li>
                <li class="nav-item">
                    <a href="PaymentList.aspx" class="nav-link"><i class="bi bi-graph-up me-2"></i>Payment List</a>
                </li>
                <li class="nav-item">
                     <a href="TestDriveList.aspx" class="nav-link"><i class="bi bi-car-front"></i> Test Drive List</a>
                </li>
                 <li>
                     <a href="Subscribers.aspx" class="nav-link"><i class="bi bi-people"></i> Subscribers</a>
                 </li>
                <li>
                    <a href="FeedbackList.aspx" class="nav-link "><i class="bi bi-chat-dots"></i> Feedback List</a>
                </li>
                <li class="nav-item mt-auto">
                    <asp:LinkButton ID="btnLogout" runat="server" CssClass="nav-link text-danger" OnClick="btnLogout_Click">
                        <i class="bi bi-box-arrow-right me-2"></i> Logout
                    </asp:LinkButton>
                </li>
            </ul>
        </div>

        <div class="content">
            <h2>Manage Cars</h2>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped table-hover" AutoGenerateColumns="False"
                AllowPaging="true" PageSize="10" DataKeyNames="CarId" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="CarId" HeaderText="Car ID" ReadOnly="True" />
                    <asp:BoundField DataField="CarName" HeaderText="Car Name" />
                    <asp:BoundField DataField="Brand" HeaderText="Car Brand" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnAvailable" runat="server" Text="Available" CssClass="btn btn-sm btn-info me-1" CommandArgument='<%# Eval("CarId") %>' CommandName="Available"/>
                            <asp:Button ID="btnUnavailable" runat="server" Text="UnAvailable" CssClass="btn btn-sm btn-warning me-1" CommandArgument='<%# Eval("CarId") %>' CommandName="UnAvailable"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="true" />
                </Columns>
            </asp:GridView>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>