 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorDashboard.aspx.cs" Inherits="Online_Doctor_Appointment_System.Doctors.DoctorDashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Doctor Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body { background:#f4f6f8; }

        /* SIDEBAR */
        .sidebar {
            width:240px;
            height:100vh;
            position:fixed;
            left:0;
            top:0;
            background:#198754;
            color:white;
            padding-top:20px;
        }

        .sidebar h4 {
            text-align:center;
            margin-bottom:30px;
        }

        .sidebar a {
            display:block;
            color:white;
            padding:12px 20px;
            text-decoration:none;
        }

        .sidebar a:hover {
            background:#157347;
        }

        /* CONTENT */
        .content {
            margin-left:260px;
            padding:20px;
        }

        .card {
            border-radius:12px;
        }
    </style>
</head>
<body>
<form runat="server">

<!-- SIDEBAR -->
<div class="sidebar">
    <h4>Doctor Panel</h4>

    <a href="DoctorDashboard.aspx">🏠 Dashboard</a>
    <a href="Appointments.aspx">📅 Appointments</a>
    <a href="PrescriptionList.aspx">📝 Prescription List</a>
    <a href="DoctorProfile.aspx">👨‍⚕️ My Profile</a>

    <asp:LinkButton ID="lnkLogout" runat="server"
        CssClass="text-white ps-3 mt-3" OnClick="lnkLogout_Click">🚪 Logout</asp:LinkButton>
</div>

<!-- MAIN CONTENT -->
<div class="content">

    <!-- HEADER -->
    <div class="card p-3 mb-4">
        <h4>Welcome, <asp:Label ID="lblDoctorName" runat="server"></asp:Label></h4>
        <small class="text-muted">Doctor Dashboard</small>
    </div>

    <!-- STATS -->
    <div class="row mb-4">
        <div class="col-md-4">
            <div class="card p-3 text-center">
                <h6>Today's Appointments</h6>
                <h2 class="text-success">
                    <asp:Label ID="lblTodayCount" runat="server"></asp:Label>
                </h2>
            </div>
        </div>
    </div>

    <!-- APPOINTMENT LIST -->
    <div class="card p-3">
        <h5>Appointment List</h5>

        <asp:GridView ID="gvAppointments" runat="server"
            CssClass="table table-striped"
            AutoGenerateColumns="False"
            EmptyDataText="No appointments today">

            <Columns>
                <asp:BoundField DataField="PatientName" HeaderText="Patient" />
                <asp:BoundField DataField="Age" HeaderText="Age" />
                <asp:BoundField DataField="AppointmentDate" HeaderText="Date" />
                <asp:BoundField DataField="TimeSlot" HeaderText="Time" />

                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <a class="btn btn-sm btn-primary"
                           href='WritePrescription.aspx?AppointmentID=<%# Eval("AppointmentID") %>'>
                            Write
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>
    </div>

</div>

</form>
</body>
</html>

