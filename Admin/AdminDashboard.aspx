<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Online_Doctor_Appointment_System.Admin.AdminDashboard" %>


<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Dashboard | DocEase</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: #f4f6f9;
        }

        /* ===== TOP NAVBAR ===== */
        .topbar {
            height: 60px;
            background: #0d6efd;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 25px;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .topbar h5 {
            margin: 0;
            font-weight: 600;
        }

        /* ===== SIDEBAR ===== */
        .sidebar {
            width: 240px;
            height: 100vh;
            background: #0b5ed7;
            position: fixed;
            top: 60px;
            left: 0;
            color: #fff;
            padding-top: 20px;
        }

        .sidebar .profile {
            text-align: center;
            padding: 15px;
            border-bottom: 1px solid rgba(255,255,255,0.2);
        }

        .sidebar .profile img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            margin-bottom: 8px;
        }

        .sidebar a {
            display: block;
            color: #fff;
            padding: 12px 20px;
            text-decoration: none;
            font-weight: 500;
        }

        .sidebar a:hover,
        .sidebar a.active {
            background: rgba(255,255,255,0.15);
        }

        /* ===== CONTENT ===== */
        .content {
            margin-left: 240px;
            margin-top: 80px;
            padding: 20px;
        }

        /* ===== DASHBOARD CARDS ===== */
        .stat-card {
            border-radius: 12px;
            color: #fff;
            padding: 20px;
            font-weight: 600;
        }

        .bg-green { background: linear-gradient(135deg, #20c997, #0ca678); }
        .bg-purple { background: linear-gradient(135deg, #845ef7, #5f3dc4); }
        .bg-blue { background: linear-gradient(135deg, #339af0, #1864ab); }
        .bg-orange { background: linear-gradient(135deg, #ff922b, #e8590c); }

        /* ===== TABLE ===== */
        .table-card {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            margin-top: 25px;
        }
    </style>
</head>

<body>
<form runat="server">

    <!-- TOP BAR -->
    <div class="topbar">
        <h5>Admin Dashboard | DocEase</h5>
        <asp:LinkButton ID="btnLogout" runat="server" CssClass="text-white text-decoration-none" OnClick="btnLogout_Click"
            >Logout</asp:LinkButton>
    </div>

    <!-- SIDEBAR -->
    <div class="sidebar">
        <div class="profile">
           <asp:Image ID="imgAdmin" runat="server" ImageUrl="~/Image/admin.jpg" Width="60" Height="60"
        CssClass="rounded-circle" />

            <h6><asp:Label ID="lblAdminName" runat="server"></asp:Label></h6>
            <small>Administrator</small>
        </div>

        <a href="AdminDashboard.aspx" class="active">Dashboard</a>
        <a href="ManageDoctors.aspx">Doctors</a>
        <a href="ManagePatients.aspx">Patients</a>
        <a href="Appointments.aspx">Appointments</a>
        <a href="Reports.aspx">Reports</a>
    </div>

    <!-- CONTENT -->
    <div class="content">

        <!-- STATS -->
        <div class="row g-4">
            <div class="col-md-3">
                <div class="stat-card bg-green">
                    <h2><asp:Label ID="lblDoctors" runat="server"></asp:Label></h2>
                    Total Doctors
                </div>
            </div>

            <div class="col-md-3">
                <div class="stat-card bg-purple">
                    <h2><asp:Label ID="lblPatients" runat="server"></asp:Label></h2>
                    Total Patients
                </div>
            </div>

            <div class="col-md-3">
                <div class="stat-card bg-blue">
                    <h2><asp:Label ID="lblAppointments" runat="server"></asp:Label></h2>
                    Appointments
                </div>
            </div>

            <div class="col-md-3">
                <div class="stat-card bg-orange">
                    <h2><asp:Label ID="lblToday" runat="server"></asp:Label></h2>
                    Today
                </div>
            </div>
        </div>

        <!-- TABLE -->
        <div class="table-card">
            <h5 class="mb-3">Recent Appointments</h5>

            <asp:GridView ID="gvAppointments" runat="server"
                CssClass="table table-hover"
                AutoGenerateColumns="False">

                <Columns>
                    <asp:BoundField DataField="PatientName" HeaderText="Patient" />
                    <asp:BoundField DataField="DoctorName" HeaderText="Doctor" />
                    <asp:BoundField DataField="AppointmentDate" HeaderText="Date" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                </Columns>
            </asp:GridView>
        </div>

    </div>

</form>
</body>
</html>

