<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageDoctors.aspx.cs" Inherits="Online_Doctor_Appointment_System.Admin.ManageDoctors" %>



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

        .table-card {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
        }
    </style>
</head>

<body>
<form runat="server">

    <!-- TOP BAR  -->
    <div class="topbar">
        <h5>Admin Dashboard | DocEase</h5>
        <asp:LinkButton ID="btnLogout" runat="server"
            CssClass="text-white text-decoration-none" OnClick="btnLogout_Click"
            >Logout</asp:LinkButton>
    </div>

    <!-- SIDEBAR  -->
    <div class="sidebar">
        <div class="profile">
            <asp:Image ID="imgAdmin" runat="server"
                ImageUrl="~/Image/admin.jpg"
                Width="60" Height="60"
                CssClass="rounded-circle" />

            <h6><asp:Label ID="lblAdminName" runat="server"></asp:Label></h6>
            <small>Administrator</small>
        </div>

        <!--  SIDEBAR ITEMS -->
        <a href="AdminDashboard.aspx">Dashboard</a>
        <a href="ManageDoctors.aspx" class="active">Doctors</a>
        <a href="ManagePatients.aspx">Patients</a>
        <a href="Appointments.aspx">Appointments</a>
        <a href="Reports.aspx">Reports</a>
    </div>

    <!-- main content area -->

    <div class="content">

        <div class="table-card">
            <h5 class="mb-3">Doctors</h5>

           <asp:GridView ID="gvDoctors" runat="server" CssClass="table table-hover"
            AutoGenerateColumns="False" OnRowCommand="gvDoctors_RowCommand" >


               <Columns>
                    <asp:BoundField DataField="DoctorID" HeaderText="ID" />
                    <asp:BoundField DataField="DoctorName" HeaderText="Doctor Name" />
                    <asp:BoundField DataField="ExperienceYears" HeaderText="Experience Years" />
                    <asp:BoundField DataField="Specialization" HeaderText="Specialization" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />

                    
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>

                            <!-- BLOCK BUTTON -->
                            <asp:LinkButton ID="btnBlock" runat="server"
                                Text="Block"
                                CssClass="btn btn-sm btn-danger me-1"
                                CommandName="BlockDoctor"
                                CommandArgument='<%# Eval("DoctorID") %>'
                                Visible='<%# Eval("Status").ToString() == "Active" %>' />

                            <!-- UNBLOCK BUTTON -->
                            <asp:LinkButton ID="btnUnblock" runat="server"
                                Text="Unblock"
                                CssClass="btn btn-sm btn-success"
                                CommandName="UnblockDoctor"
                                CommandArgument='<%# Eval("DoctorID") %>'
                                Visible='<%# Eval("Status").ToString() == "Blocked" %>' />

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </div>

</form>
</body>
</html>
