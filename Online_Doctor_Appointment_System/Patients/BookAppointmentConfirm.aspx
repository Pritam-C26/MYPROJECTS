<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookAppointmentConfirm.aspx.cs"
    Inherits="Online_Doctor_Appointment_System.Patients.BookAppointmentConfirm" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Appointment Confirmed</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <style>
        body { font-family: "Segoe UI", Arial; background:#f4f6f8; margin:0; padding:20px; }
        .wrapper { max-width:800px; margin:20px auto; }
        .card { background:white; border-radius:10px; padding:22px; box-shadow:0 4px 14px rgba(0,0,0,0.06); }
        .header { display:flex; justify-content:space-between; align-items:center; }
        .success { color:#1e7e34; font-weight:700; font-size:20px; }
        .ref { font-size:14px; color:#555; }
        .section { margin-top:18px; }
        .row { display:flex; gap:18px; flex-wrap:wrap; }
        .col { flex:1; min-width:180px; }
        .label { font-weight:600; color:#333; font-size:13px; }
        .value { margin-top:6px; padding:10px; background:#f7f8fa; border-radius:6px; color:#111; }
        .notes { margin-top:12px; padding:10px; background:#fff8e1; border-radius:6px; color:#666; }
        .actions { margin-top:18px; display:flex; gap:12px; }
        .btn { padding:10px 14px; border-radius:8px; border:none; cursor:pointer; font-weight:600; }
        .btn-print { background:#0d6efd; color:white; }
        .btn-list { background:#e9ecef; color:#333; }
        .small { font-size:13px; color:#666; margin-top:6px; }

        /* For now: NO @media print hiding, so content is visible in preview */
    </style>

    <!-- printReceipt uses your name, but just calls window.print() -->
    <script type="text/javascript">
        function printReceipt() {
            window.print();
            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <div class="card" id="receipt">
                <div class="header">
                    <div>
                        <div class="success">Appointment Confirmed ✔</div>
                        <div class="small">Thank you — your appointment has been successfully booked.</div>
                    </div>
                    <div class="ref">
                        <div class="small">
                            Booked on:
                            <asp:Label ID="lblBookedOn" runat="server" Text="--" />
                        </div>
                    </div>
                </div>

                <div class="section">
                    <h4>Appointment Details</h4>
                    <div class="row">
                        <div class="col">
                            <div class="label">Date</div>
                            <div class="value">
                                <asp:Label ID="lblDate" runat="server" Text="--" />
                            </div>
                        </div>
                        <div class="col">
                            <div class="label">Time</div>
                            <div class="value">
                                <asp:Label ID="lblTime" runat="server" Text="--" />
                            </div>
                        </div>
                        <div class="col">
                            <div class="label">Doctor</div>
                            <div class="value">
                                <asp:Label ID="lblDoctor" runat="server" Text="--" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="section">
                    <h4>Patient Details</h4>
                    <div class="row">
                        <div class="col">
                            <div class="label">Name</div>
                            <div class="value">
                                <asp:Label ID="lblPatientName" runat="server" Text="--" />
                            </div>
                        </div>
                        <div class="col">
                            <div class="label">Patient ID</div>
                            <div class="value">
                                <asp:Label ID="lblPatientID" runat="server" Text="--" />
                            </div>
                        </div>
                        <div class="col">
                            <div class="label">Contact</div>
                            <div class="value">
                                <asp:Label ID="lblPhone" runat="server" Text="--" />
                            </div>
                        </div>
                    </div>

                    <div class="row" style="margin-top:12px;">
                        <div class="col">
                            <div class="label">Age</div>
                            <div class="value">
                                <asp:Label ID="lblAge" runat="server" Text="--" />
                            </div>
                        </div>
                        <div class="col" style="flex:2">
                            <div class="label">Gender</div>
                            <div class="value">
                                <asp:Label ID="lblGender" runat="server" Text="--" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="notes">
                    <div><strong>Instructions:</strong></div>
                    <div>- Please arrive 10 minutes earlier with a valid ID.</div>
                    <div>- Carry any previous reports if available.</div>
                    <div>- To reschedule or cancel, visit your Appointments page or contact the clinic.</div>
                </div>

                <div class="actions">
                    <asp:Button ID="btnPrint" runat="server"
                        Text="Print Receipt"
                        CssClass="btn btn-print"
                        UseSubmitBehavior="false"
                        OnClientClick="return printReceipt();" />

                    <asp:Button ID="btnAppointments" runat="server"
                        Text="My Appointments"
                        CssClass="btn btn-list"
                        OnClick="btnAppointments_Click" />
                </div>

                <div style="margin-top:12px;">
                    <asp:Label ID="lblMessage" runat="server" CssClass="small" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
