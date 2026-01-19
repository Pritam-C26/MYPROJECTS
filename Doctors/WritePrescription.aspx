<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="WritePrescription.aspx.cs"
    Inherits="Online_Doctor_Appointment_System.Doctors.WritePrescription" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Write Prescription</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: #f4f6f8;
        }

        /* ===== SIDEBAR ===== */
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

        /* ===== TOP HEADER BAR ===== */
        .topbar {
            background: #0d47a1;
            padding: 12px;
            text-align: center;
            margin-bottom: 15px;
        }

        .brand-title {
            color: #ffffff;
            font-weight: 700;
            font-size: 1.8rem;
            letter-spacing: 1px;
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
        }

        .card {
            border-radius: 12px;
        }

        textarea {
            resize: none;
        }

        /* ===== PRINT STYLES ===== */
        @media print {

            * {
                -webkit-print-color-adjust: exact !important;
                print-color-adjust: exact !important;
            }

            /* Hide sidebar */
            .sidebar {
                display: none !important;
            }

            /* Full width content */
            .content {
                margin-left: 0 !important;
                width: 100% !important;
            }

            /* Hide buttons */
            .no-print {
                display: none !important;
            }

            /* Keep header */
            .topbar {
                background: #0d47a1 !important;
                padding: 12px !important;
            }

            .brand-title {
                color: #ffffff !important;
                font-size: 1.9rem !important;
                font-weight: 800 !important;
                display: block !important;
                visibility: visible !important;
            }

            textarea,
            input {
                border: 1px solid #ccc !important;
                background: #fff !important;
                color: #000 !important;
                box-shadow: none !important;
            }

            @page {
                margin: 12mm;
            }

            body {
                background: #fff !important;
            }
        }
    </style>
</head>

<body>
<form runat="server">

    <!-- ===== SIDEBAR ===== -->
    <div class="sidebar">
        <h4>Doctor Panel</h4>

        <a href="DoctorDashboard.aspx">🏠 Dashboard</a>
        <a href="Appointments.aspx" style="background:#157347;">📅 Appointments</a>
        <a href="PrescriptionList.aspx">📝 Prescription List</a>
        <a href="DoctorProfile.aspx">👨‍⚕️ My Profile</a>

        <asp:LinkButton ID="lnkLogout" runat="server"
            CssClass="text-white ps-3 mt-3"
            OnClick="lnkLogout_Click">🚪 Logout</asp:LinkButton>
    </div>

    <!-- ===== CONTENT ===== -->
    <div class="content">

        <!-- HEADER BAR -->
        <div class="topbar">
            <h3 class="brand-title">DocEase</h3>
        </div>

        <!-- PRESCRIPTION CARD -->
        <div class="card p-4 shadow">

            <!-- HEADER -->
            <div class="border-bottom mb-3 pb-2">
                <h4 class="text-success mb-1">
                    <asp:Label ID="lblDoctorName" runat="server"></asp:Label>
                </h4>

                <div class="row">
                    <div class="col-md-4">
                        <strong>Patient:</strong>
                        <asp:Label ID="lblPatientName" runat="server"></asp:Label>
                    </div>

                    <div class="col-md-4">
                        <strong>Age:</strong>
                        <asp:Label ID="lblAge" runat="server"></asp:Label>
                    </div>

                    <div class="col-md-4 text-end">
                        <strong>Date:</strong>
                        <asp:Label ID="lblDate" runat="server"></asp:Label>
                    </div>
                </div>
            </div>

            <!-- BODY -->
            <div class="mb-3">
                <label class="fw-bold">Diagnosis</label>
                <asp:TextBox ID="txtDiagnosis" runat="server"
                    CssClass="form-control"
                    TextMode="MultiLine" Rows="3" />
            </div>

            <div class="mb-3">
                <label class="fw-bold">Medicines</label>
                <asp:TextBox ID="txtMedicines" runat="server"
                    CssClass="form-control"
                    TextMode="MultiLine" Rows="5"
                    Placeholder="Medicine – Dose – Duration" />
            </div>

            <div class="mb-3">
                <label class="fw-bold">Advice</label>
                <asp:TextBox ID="txtAdvice" runat="server"
                    CssClass="form-control"
                    TextMode="MultiLine" Rows="3" />
            </div>

            <!-- BUTTONS -->
            <div class="text-end mt-4">
                <button type="button"
                    class="btn btn-secondary me-2 no-print"
                    onclick="window.print();">
                    🖨 Print
                </button>

                <asp:Button ID="btnUpload" runat="server"
                    Text="⬆ Upload Prescription"
                    CssClass="btn btn-success px-4 no-print"
                    OnClick="btnUpload_Click" />
            </div>

        </div>
    </div>

</form>
</body>
</html>
