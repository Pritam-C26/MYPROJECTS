<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookAppointment.aspx.cs" Inherits="Online_Doctor_Appointment_System.Patients.BookAppointment" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DocEase | Book Appointment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body { background-color: #f8f9fa; }

        /* 🔹 Navbar (same as Dashboard) */
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

        /* 🔹 Main Box */
        .container-box {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-top: 40px;
            margin-bottom: 40px;
        }
        h3 {
            color: #0077b6;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .calendar-card {
            border-radius: 10px;
            border: 1px solid #e0e0e0;
            padding: 15px;
        }

        .section-title {
            font-weight: 600;
            color: #495057;
            margin-bottom: 10px;
        }

        .msg {
            margin-top: 15px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- 🔹 Top Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="~/Patients/PatientsDashboard.aspx">DocEase</a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto align-items-center">
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkProfile" runat="server" NavigateUrl="~/Patients/EditProfile.aspx" CssClass="nav-link">👤 My Profile</asp:HyperLink>
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
        <div class="container">
            <div class="container-box">
                <!-- Doctor Header -->
                <div class="row mb-3">
                    <div class="col-12">
                        <h3>Book Appointment with <asp:Label ID="lblDoctorName" runat="server"></asp:Label></h3>
                        <p class="mb-1"><b>Specialization:</b> <asp:Label ID="lblSpecialization" runat="server"></asp:Label></p>
                        <p class="mb-0"><b>Consultation Fee:</b> ₹<asp:Label ID="lblFee" runat="server"></asp:Label></p>
                    </div>
                </div>

                <div class="row mt-4">
                    <!-- Left: Calendar -->
                    <div class="col-md-6 mb-4">
                        <div class="calendar-card">
                            <div class="section-title">Select Date</div>
                            <asp:Calendar ID="Calendar1" runat="server"
                                OnSelectionChanged="Calendar1_SelectionChanged"
                                OnDayRender="Calender1_DayRender"
                                NextPrevFormat="ShortMonth"
                                CssClass="w-100">
                            </asp:Calendar>
                      <!--      <div class="mt-2 small text-muted">
                                Selected Date:
                                <asp:Label ID="lblSelectedDate" runat="server"></asp:Label>
                            </div> 
                          -->
                        </div>
                    </div>

                    <!-- Right: Time Selection -->
                    <div class="col-md-6 mb-4">
                        <div class="calendar-card">
                            <div class="section-title">Select Time</div>

                            <!-- Time dropdown -->
                            <asp:DropDownList ID="ddlTimeSlots" runat="server" CssClass="form-select mb-3">
                            </asp:DropDownList>

                   <!--         <div class="mb-3 small text-muted">
                                Selected Time:
                                <asp:Label ID="lblSelectedTime" runat="server"></asp:Label>
                            </div> -->

                            <!-- Continue / Book button -->
                            <asp:Button ID="btnContinue" runat="server"
                                Text="Continue"
                                CssClass="btn btn-primary w-100"
                                OnClick="btnContinue_Click" />

                            <!-- Message label -->
                            <asp:Label ID="lblMessage" runat="server" CssClass="msg d-block" ForeColor="Green"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
