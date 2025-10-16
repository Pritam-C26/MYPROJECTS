<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="Online_Admission_System.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Admission System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        .hero {
                background: url('<%= ResolveUrl("~/image/hero-image.jpg") %>') center/cover no-repeat;
                height: 350px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                text-shadow: 2px 2px 8px rgba(0,0,0,0.8);
                font-size: 2rem;
                font-weight: bold;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top">
            <div class="container">
                <a class="navbar-brand" href="StudentDashboard.aspx">Online Admission System</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="StudentDashboard.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="Courses.aspx">Courses</a></li>
                        <li class="nav-item"><a class="nav-link" href="Contact.aspx">Contact</a></li>
                        <li class="nav-item">
                            
                                <asp:LinkButton ID="btnLogout" runat="server" CssClass="nav-link text-warning" OnClick="btnLogout_Click">Logout</asp:LinkButton>
                            
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


        <!-- Hero Section -->
        <div class="hero">
            Welcome to Our Online Admission Portal
        </div>

        <!-- Quick Links -->
        <div class="container my-5">
            <div class="row g-4 text-center">
                <div class="col-md-4">
                    <div class="card shadow h-100">
                        <div class="card-body">
                            <h5 class="card-title">View Courses</h5>
                            <p class="card-text">Choose Your Course</p>
                            <asp:Button ID="btnView" runat="server" CssClass="btn btn-primary" Text="View Course" OnClick="btnView_Click"/>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card shadow h-100">
                        <div class="card-body">
                            <h5 class="card-title">Check Status</h5>
                            <p class="card-text">Track your application progress.</p>
                            <asp:Button ID="btnStatus" runat="server" CssClass="btn btn-success" Text="Check Status" PostBackUrl="~/statusCheck.aspx" OnClick="btnStatus_Click" />
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card shadow h-100">
                        <div class="card-body">
                            <h5 class="card-title">Download Prospectus</h5>
                            <p class="card-text">Learn more about our courses.</p>
                            <asp:Button ID="btnDownload" runat="server" CssClass="btn btn-warning" Text="Download" OnClick="btnDownload_Click"  />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- About Section -->
        <div class="container my-5">
            <div class="p-4 bg-light rounded shadow">
                <h2>About the Admission System</h2>
                <p>
                    Our Online Admission System allows students to apply for courses easily and securely from anywhere. 
                    You can check the application status, download important documents, and receive updates directly from our portal.
                </p>
            </div>
        </div>

        <!-- Announcements Section -->
        <div class="container my-5">
            <div class="p-4 bg-white border rounded shadow">
                <h2>Important Announcements</h2>
                <ul>
                    <li>Admissions for 2025-26 are now open.</li>
                    <li>Last date for application: 30th August 2025.</li>
                    <li>Entrance exam date: 15th September 2025.</li>
                </ul>
            </div>
        </div>

        <!-- Footer -->
        <footer class="bg-primary text-white text-center py-3 mt-5">
            &copy; 2025 Online Admission System | Contact: admission@example.com
        </footer>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
