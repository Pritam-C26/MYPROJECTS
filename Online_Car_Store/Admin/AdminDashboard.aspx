<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Online_Car_Store.Admin.AdminDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Wheelz Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
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
                <a href="AdminDashboard.aspx" class="nav-link active"><i class="bi bi-speedometer2"></i> Dashboard</a>
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
                <a href="TestDriveList.aspx" class="nav-link"><i class="bi bi-car-front"></i> Test Drive List</a>

            </li>
             <li>
                 <a href="Subscribers.aspx" class="nav-link"><i class="bi bi-people"></i> Subscribers</a>
             </li>
            <li>
                <a href="FeedbackList.aspx" class="nav-link"><i class="bi bi-chat-dots"></i> Feedback List</a>
            </li>
            <li>
                <asp:LinkButton ID="btnLogout" runat="server" CssClass="nav-link text-danger" OnClick="btnLogout_Click"> <i class="bi bi-box-arrow-right"></i> Logout
                </asp:LinkButton>
            </li>
        </ul>
    </div>
     
    <div class="content">
        <div class="container-fluid">
            <h2>Welcome, Admin!</h2>
            <p class="text-muted">Here is the Wheelz dashboard overview.</p>

           <!-- Inside the cards section -->
            <div class="row">
                <div class="col-md-3 mb-4">
                    <div class="card text-white bg-primary">
                        <div class="card-body">
                            <h5 class="card-title">Total Cars</h5>
                            <p class="card-text fs-4"><asp:Label ID="lblTotalCars" runat="server" Text="0"></asp:Label></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card text-white bg-success">
                        <div class="card-body">
                            <h5 class="card-title">Total Bookings</h5>
                            <p class="card-text fs-4"><asp:Label ID="lblTotalBookings" runat="server" Text="0"></asp:Label></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card text-white bg-warning">
                        <div class="card-body">
                            <h5 class="card-title">Active Users</h5>
                            <p class="card-text fs-4"><asp:Label ID="lblActiveUsers" runat="server" Text="0"></asp:Label></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card text-white bg-danger">
                        <div class="card-body">
                            <h5 class="card-title">Subscribers</h5>
                            <p class="card-text fs-4"><asp:Label ID="lblSubscribers" runat="server" Text="0"></asp:Label></p>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Example Chart Placeholder -->
            <div class="card mb-4">
                <div class="card-header">
                    Booking Trends
                </div>
                <div class="card-body">
                    <canvas id="bookingChart" height="100"></canvas>
                </div>
            </div>
        </div>
    </div>
</form>
    <!-- Bootstrap and Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        const ctx = document.getElementById('bookingChart').getContext('2d');
        const bookingChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Bookings',
                    data: [12, 19, 3, 5, 2, 3],
                    borderColor: 'rgba(75, 192, 192, 1)',
                    tension: 0.4
                }]
            }
        });
    </script>
</body>
</html>