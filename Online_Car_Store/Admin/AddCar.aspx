<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCar.aspx.cs" Inherits="Online_Car_Store.Admin.ManageCar" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Wheelz Admin Panel - Add Car</title>
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
                <li class="nav-item"><a href="AdminDashboard.aspx" class="nav-link"><i class="bi bi-speedometer2"></i> Dashboard</a></li>
                <li><a href="AddCar.aspx" class="nav-link active"><i class="bi bi-car-front"></i> Add Cars</a></li>
                <li><a href="ManageCars.aspx" class="nav-link"><i class="bi bi-car-front"></i> Manage Cars</a></li>
                <li><a href="ManageBookings.aspx" class="nav-link"><i class="bi bi-journal-check"></i> Manage Bookings</a></li>
                <li><a href="PaymentList.aspx" class="nav-link"><i class="bi bi-graph-up"></i> Payment List</a></li>
                <li><a href="Settings.aspx" class="nav-link"><i class="bi bi-gear"></i> Settings</a></li>
                <li><a href="Subscribers.aspx" class="nav-link"><i class="bi bi-people"></i> Subscribers</a></li>
                <li><a href="FeedbackList.aspx" class="nav-link"><i class="bi bi-chat-dots"></i> Feedback List</a></li>
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
                <h2>Add New Car</h2>
                <div class="card mb-4">
                    <div class="card-header">Car Details</div>
                    <div class="card-body">
                        <asp:Label ID="lblMessage" runat="server" CssClass="text-success mb-3 d-block"></asp:Label>

                        <fieldset class="mb-4">
                            <legend>Basic Info</legend>
                            <div class="row g-3">
                                <div class="col-md-6"><asp:TextBox ID="txtCarName" runat="server" CssClass="form-control" placeholder="Car Name" /></div>
                                <div class="col-md-6"><asp:TextBox ID="txtCarBrand" runat="server" CssClass="form-control" placeholder="Car Brand" /></div>
                                <div class="col-md-6"><asp:TextBox ID="txtCarModel" runat="server" CssClass="form-control" placeholder="Car Model" /></div>
                                <div class="col-md-6"><asp:TextBox ID="txtYear" runat="server" CssClass="form-control" placeholder="Year" /></div>
                                <div class="col-md-6"><asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Price" /></div>
                            </div>
                        </fieldset>

                        <fieldset class="mb-4">
                            <legend>Specifications</legend>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlfuel" runat="server" CssClass="form-select">
                                        <asp:ListItem Text="-- Select Fuel Type --" Value="" Disabled="true" Selected="true" />
                                        <asp:ListItem Text="Petrol" Value="Petrol" />
                                        <asp:ListItem Text="Hybrid" Value="Hybrid" />
                                        <asp:ListItem Text="Electric" Value="Electric" />
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-6"><asp:TextBox ID="txtTransmission" runat="server" CssClass="form-control" placeholder="Transmission" /></div>
                                <div class="col-md-6"><asp:TextBox ID="txtMileage" runat="server" CssClass="form-control" placeholder="Mileage" /></div>
                                <div class="col-md-6"><asp:TextBox ID="txtEngine" runat="server" CssClass="form-control" placeholder="Engine" /></div>
                                <div class="col-md-12"><asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Description" /></div>
                            </div>
                        </fieldset>

                        <fieldset class="mb-4">
                            <legend>Category & Image</legend>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
                                        <asp:ListItem Text="-- Select Category --" Value="" Disabled="true" Selected="true" />
                                        <asp:ListItem Text="Electric" Value="Electric" />
                                        <asp:ListItem Text="Sedans" Value="sedans" />
                                        <asp:ListItem Text="Sports" Value="Sports" />
                                        <asp:ListItem Text="SUV" Value="SUV" />
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-6"><asp:FileUpload ID="fileCarImg" runat="server" CssClass="form-control" />

                                    <asp:Image ID="imgCar" runat="server" Width="200px" Height="150px" CssClass="img-thumbnail" />
                                <asp:Label ID="Label1" runat="server" CssClass="mt-2 d-block" />
                                </div>
                            </div>
                        </fieldset>

                        <fieldset class="mb-4">
                            <legend>Status</legend>
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select w-50">
                                <asp:ListItem Value="Available">Available</asp:ListItem>
                                <asp:ListItem Value="Not Available">Not Available</asp:ListItem>
                            </asp:DropDownList>
                        </fieldset>

                        <asp:Button ID="btnAddCar" runat="server" Text="Add Car" CssClass="btn btn-primary" OnClick="btnAddCar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
