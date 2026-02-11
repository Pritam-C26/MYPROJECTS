<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorProfile.aspx.cs" Inherits="Online_Doctor_Appointment_System.Doctors.DoctorProfile" %>



<!DOCTYPE html>
<html>
<head runat="server">
    <title>Doctor Profile</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: #f4f6f8;
        }

        /* ===== SIDEBAR (SAME AS EditPrescription) ===== */
        .sidebar {
            width: 240px;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            background: #198754;
            color: white;
            padding-top: 20px;
        }

        .sidebar h4 {
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;
            color: white;
            padding: 12px 20px;
            text-decoration: none;
        }

        .sidebar a:hover {
            background: #157347;
        }

        /* ===== CONTENT ===== */
        .content {
            margin-left: 260px;
            padding: 20px;
        }
    </style>
</head>

<body>
<form runat="server">

<!-- ===== SIDEBAR ===== -->
<div class="sidebar">
    <h4>Doctor Panel</h4>

    <a href="DoctorDashboard.aspx">Dashboard</a>
    <a href="AppointmentList.aspx">Appointments</a>
    <a href="PrescriptionList.aspx">Prescriptions</a>
    <a href="DoctorProfile.aspx" style="background:#157347;">Edit Profile</a>

    <asp:LinkButton ID="lnkLogout" runat="server"
        CssClass="text-white ps-3 mt-3"
        OnClick="lnkLogout_Click">🚪 Logout</asp:LinkButton>
</div>

<!-- ===== CONTENT ===== -->
<div class="content">

    <div class="card shadow p-4">
        <h4 class="text-success mb-4">Doctor Profile</h4>

        <!-- READ ONLY -->
        <div class="mb-3">
            <label class="fw-bold">Full Name</label>
            <asp:TextBox ID="txtFullName" runat="server"
                CssClass="form-control" Enabled="false" />
        </div>

        <div class="mb-3">
            <label class="fw-bold">Specialization</label>
            <asp:TextBox ID="txtSpecialization" runat="server"
                CssClass="form-control" Enabled="false" />
        </div>

        <!-- EDITABLE -->
        <div class="mb-3">
            <label class="fw-bold">Experience (Years)</label>
            <asp:TextBox ID="txtExperience" runat="server"
                CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label class="fw-bold">Available Days</label>
            <asp:TextBox ID="txtAvailableDays" runat="server"
                CssClass="form-control"
                Placeholder="Mon, Tue, Wed, Thu" />
        </div>

        <div class="mb-3">
            <label class="fw-bold">Consultation Fee (₹)</label>
            <asp:TextBox ID="txtFee" runat="server"
                CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label class="fw-bold">Address</label>
            <asp:TextBox ID="txtAddress" runat="server"
                CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label class="fw-bold">Phone Number</label>
            <asp:TextBox ID="txtPhone" runat="server"
                CssClass="form-control" />
        </div>

        <asp:Button ID="btnUpdate" runat="server"
            Text="Update Profile"
            CssClass="btn btn-success"
            OnClick="btnUpdate_Click" />

        <asp:Label ID="lblMsg" runat="server"
            CssClass="ms-3 fw-bold"></asp:Label>

    </div>

</div>

</form>
</body>
</html>

