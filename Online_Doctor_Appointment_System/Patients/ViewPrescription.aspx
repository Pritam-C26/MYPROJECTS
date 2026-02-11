<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPrescription.aspx.cs" Inherits="Online_Doctor_Appointment_System.Patients.ViewPrescription" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>View Prescription</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: #f4f6f8;
        }

        /* ===== TOP BAR ===== */
        .topbar {
            background: #0d47a1;
            padding: 14px;
            text-align: center;
            margin-bottom: 20px;
        }

        .brand-title {
            color: #ffffff;
            font-weight: 700;
            font-size: 1.9rem;
            margin: 0;
        }

        /* ===== CARD ===== */
        .prescription-box {
            background: #ffffff;
            border-radius: 12px;
        }

        textarea {
            resize: none;
        }

        /* ===== PRINT ===== */
       @media print {

        /* Hide buttons and top header */
        .no-print,
        .topbar {
            display: none !important;
        }

        /* Remove page background */
        body {
            background: #fff !important;
            font-size: 13px;
        }

        /* Make container full width like paper */
        .container {
            max-width: 100% !important;
            margin: 0 !important;
            padding: 0 !important;
        }

        /* Card should look like plain paper */
        .prescription-box {
            box-shadow: none !important;
            border-radius: 0 !important;
            border: none !important;
            padding: 0 !important;
        }

        /* Inputs & textareas look like printed text */
        textarea,
        input {
            border: none !important;
            background: transparent !important;
            color: #000 !important;
            box-shadow: none !important;
            padding-left: 0 !important;
        }

        label {
            font-weight: 600;
        }

        @page {
            size: A4;
            margin: 15mm;
        }
    }

    </style>
</head>

<body>
<form runat="server">

    <!-- TOP HEADER -->
    <div class="topbar">
        <h3 class="brand-title">DocEase</h3>
    </div>

    <!-- CONTENT -->
    <div class="container">

        <div class="card p-4 shadow prescription-box">

            <!-- HEADER -->

            <div class="border-bottom pb-3 mb-4">

                <h4 class="text-success mb-1">
                    <asp:Label ID="lblDoctorName" runat="server" />
                </h4>

                <div class="text-muted mb-1">
                    <asp:Label ID="lblSpecialization" runat="server" CssClass="fw-semibold" />
                </div>

                <div class="row mt-2">
                    <div class="col-md-6">
                        <strong>Phone:</strong>
                        <asp:Label ID="lblDoctorPhone" runat="server" CssClass="fw-semibold" />
                    </div>    
                </div>

            </div>

            <div class="my-4"></div>


            <div class="border-bottom mb-3 pb-2">

                <div class="row">
                    <div class="col-md-4">
                        <strong>Patient:</strong>
                        <asp:Label ID="lblPatientName" runat="server" CssClass="fw-semibold"/>
                    </div>

                    <div class="col-md-4">
                        <strong>Age:</strong>
                        <asp:Label ID="lblAge" runat="server" CssClass="fw-semibold"/>
                    </div>

                    <div class="col-md-4 text-end">
                        <strong>Date:</strong>
                        <asp:Label ID="lblDate" runat="server" CssClass="fw-semibold" />
                    </div>
                </div>
            </div>

            <!-- DIAGNOSIS -->
            <div class="mb-3">
                <label class="fw-bold">Diagnosis</label>
                <asp:TextBox ID="txtDiagnosis" runat="server"
                    CssClass="form-control"
                    TextMode="MultiLine"
                    Rows="3"
                    ReadOnly="true" />
            </div>

            <!-- MEDICINES -->
            <div class="mb-3">
                <label class="fw-bold">Medicines</label>
                <asp:TextBox ID="txtMedicines" runat="server"
                    CssClass="form-control"
                    TextMode="MultiLine"
                    Rows="5"
                    ReadOnly="true" />
            </div>

            <!-- ADVICE -->
            <div class="mb-3">
                <label class="fw-bold">Advice</label>
                <asp:TextBox ID="txtAdvice" runat="server"
                    CssClass="form-control"
                    TextMode="MultiLine"
                    Rows="3"
                    ReadOnly="true" />
            </div>

            <!-- ACTION BUTTONS -->
            <div class="d-flex justify-content-between mt-4 no-print">
                <asp:Button ID="btnBack" runat="server"
                    Text="← Back"
                    CssClass="btn btn-outline-primary" OnClick="btnBack_Click"
                     />

                <button type="button"
                    class="btn btn-secondary"
                    onclick="window.print();">
                    🖨 Print
                </button>
            </div>

        </div>
    </div>

</form>
</body>
</html>

