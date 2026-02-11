<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrescriptionList.aspx.cs"
    Inherits="Online_Doctor_Appointment_System.Doctors.PrescriptionList" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Prescription List</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body { background:#f4f6f8; }

        /* ===== SAME SIDEBAR ===== */
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

<!-- ===== SIDEBAR ===== -->
<div class="sidebar">
    <h4>Doctor Panel</h4>

    <a href="DoctorDashboard.aspx">🏠 Dashboard</a>
    <a href="Appointments.aspx">📅 Appointments</a>
    <a href="PrescriptionList.aspx" style="background:#157347;">📝 Prescription List</a>
    <a href="DoctorProfile.aspx">👨‍⚕️ My Profile</a>

    <asp:LinkButton ID="lnkLogout" runat="server"
        CssClass="text-white ps-3 mt-3"
        OnClick="lnkLogout_Click">🚪 Logout</asp:LinkButton>
</div>

<!-- ===== MAIN CONTENT ===== -->
<div class="content">

    <div class="card shadow p-4">
        <h4 class="text-success mb-4">📝 Prescription List</h4>

        <asp:GridView ID="gvPrescriptions" runat="server"
            CssClass="table table-bordered table-hover"
            AutoGenerateColumns="False"
            EmptyDataText="No prescriptions found"
            HeaderStyle-CssClass="table-success">

            <Columns>
                <asp:BoundField DataField="PrescriptionID" HeaderText="ID" />
                <asp:BoundField DataField="PatientName" HeaderText="Patient Name" />
                <asp:BoundField DataField="Age" HeaderText="Age" />
                <asp:BoundField DataField="CreateAt" HeaderText="CreateAt" DataFormatString="{0:yyyy-MM-dd}" /> 

                <asp:BoundField DataField="Diagnosis" HeaderText="Diagnosis" />
                <asp:BoundField DataField="Medicines" HeaderText="Medicines" />
                <asp:BoundField DataField="Advice"   HeaderText="Advice" />

                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <a class="btn btn-sm btn-success"
                           href='EditPrescription.aspx?PrescriptionID=<%# Eval("PrescriptionID") %>'>
                            Edit
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
