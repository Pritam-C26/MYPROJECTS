<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientsDashboard.aspx.cs" Inherits="Online_Doctor_Appointment_System.Patients.PatientsDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DocEase | Patient Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body { background-color: #f8f9fa; }
        .navbar {
            background-color: #0077b6 !important;
        }
        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
            color: #fff !important;
        }
        .nav-link {
            color: white !important;
            font-weight: 500;
            margin-right: 20px;
        }
        .nav-link:hover, .nav-link.active {
            color: #caf0f8 !important;
        }
        .logout-link {
            color: white !important;
            font-weight: 500;
            margin-left: 20px;
            background: none;
            border: none;
            cursor: pointer;
        }
        .logout-link:hover {
            color: #caf0f8 !important;
            text-decoration: underline;
        }
        .doctor-card {
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        .doctor-card:hover {
            transform: translateY(-5px);
        }
        .doctor-card h5 {
            color: #0077b6;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- 🔹 Top Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="PatientsDashboard.aspx">DocEase</a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto align-items-center">
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkProfile" runat="server" NavigateUrl="~/Patients/EditProfile.aspx" CssClass="nav-link active">👤 My Profile</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkAppointments" runat="server" NavigateUrl="~/Patients/AppointmentList.aspx" CssClass="nav-link">📅 My Appointments</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkPrescriptions" runat="server" NavigateUrl="~/Patients/PrescriptionList.aspx" CssClass="nav-link">💊 Prescriptions</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="btnLogout" runat="server" CssClass="nav-link logout-link" OnClick="btnLogout_Click">🚪 Logout</asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- 🔹 Main Content -->
        <div class="container my-5">
            <h3 class="mb-4 text-primary fw-bold text-center">Available Doctors</h3>
            <div class="row" id="doctorsList" runat="server">
                <!-- Doctors loaded dynamically -->

                <asp:Repeater ID="rptDoctors" runat="server">
    <ItemTemplate>
        <div class="doctor-card shadow-sm mb-3 p-3">
            <h5><%# Eval("FullName") %></h5>
            <p><b>Specialization:</b> <%# Eval("Specialization") %></p>
            <p><b>Experience:</b> <%# Eval("ExperienceYears") %> years</p>
            <p><b>Available Days:</b> <%# Eval("AvailableDays") %></p>
            <p><b>Fee:</b> ₹<%# Eval("ConsultationFee", "{0:F2}") %></p>
            <p><b>Address:</b> <%# Eval("Address") %></p>
            <p><b>Phone Number:</b> <%# Eval("PhoneNumber") %></p>
            <a href='../Patients/BookAppointment.aspx?DoctorID=<%# Eval("DoctorID") %>' class="btn btn-primary mt-2">Book Appointment</a>
        </div>
    </ItemTemplate>
</asp:Repeater>


            </div>
        </div>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
