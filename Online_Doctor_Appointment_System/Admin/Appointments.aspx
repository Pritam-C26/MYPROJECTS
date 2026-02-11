<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="Online_Doctor_Appointment_System.Admin.Appointments" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Dashboard | Appointments</title>

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

        .table-card {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
        }
    </style>
</head>

<body>
<form runat="server">

    <!-- ===== TOP BAR ===== -->
    <div class="topbar">
        <h5>Admin Dashboard</h5>
        <asp:LinkButton ID="btnLogout" runat="server"
            CssClass="text-white text-decoration-none"
            OnClick="btnLogout_Click">Logout</asp:LinkButton>
    </div>

    <!-- ===== SIDEBAR ===== -->
    <div class="sidebar">
        <div class="profile">
            <asp:Image ID="imgAdmin" runat="server"
                ImageUrl="~/Image/admin.jpg"
                Width="60" Height="60"
                CssClass="rounded-circle mb-2" />

            <h6 class="mb-0">
                <asp:Label ID="lblAdminName" runat="server"></asp:Label>
            </h6>
            <small>Administrator</small>
        </div>

        <a href="AdminDashboard.aspx">Dashboard</a>
        <a href="ManageDoctors.aspx">Doctors</a>
        <a href="ManagePatients.aspx">Patients</a>
        <a href="Appointments.aspx" class="active">Appointments</a>
        <a href="Reports.aspx">Reports</a>
    </div>

    <!-- ===== CONTENT ===== -->
    <div class="content">
        <div class="table-card">
            <h5 class="mb-3">Appointments List</h5>

            <asp:GridView ID="gvAppointments" runat="server"
                CssClass="table table-hover"
                AutoGenerateColumns="False">

                <Columns>
                    <asp:BoundField DataField="AppointmentID" HeaderText="Appointment ID" />
                    <asp:BoundField DataField="DoctorID" HeaderText="Doctor ID" />
                    <asp:BoundField DataField="PatientID" HeaderText="Patient ID" />
                    <asp:BoundField DataField="AppointmentDay" HeaderText="Day" />
                    <asp:BoundField DataField="TimeSlot" HeaderText="Time Slot" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:BoundField DataField="AppointmentDate" HeaderText="Date"
                        DataFormatString="{0:dd-MMM-yyyy}" />
                    <asp:BoundField DataField="CreateAt" HeaderText="Created At"
                        DataFormatString="{0:dd-MMM-yyyy}" />
                </Columns>

            </asp:GridView>
        </div>
    </div>

</form>
</body>
</html>
