<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppointmentList.aspx.cs" Inherits="Online_Doctor_Appointment_System.Patients.AppointmentList" %>


<!DOCTYPE html>
<html>
<head runat="server">
    <title>My Appointments</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background-color: #f4f6f9;
        }

        .card {
            border-radius: 12px;
        }

       /* Modern Floating Back Button */
        .floating-back-btn-modern {
            position: fixed;
            bottom: 28px;
            right: 28px;
            display: flex;
            align-items: center;
            gap: 10px;

            padding: 12px 18px;
            border-radius: 999px;

            background: rgba(33, 37, 41, 0.85);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);

            color: #fff;
            text-decoration: none;
            font-weight: 500;
            font-size: 14px;

            box-shadow: 
                0 8px 25px rgba(0, 0, 0, 0.25),
                inset 0 0 0 1px rgba(255, 255, 255, 0.08);

            z-index: 999;
            transition: all 0.35s ease;
        }

        /* Arrow circle */
        .floating-back-btn-modern .arrow {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.12);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
        }

        /* Hover effects */
        .floating-back-btn-modern:hover {
            background: rgba(13, 110, 253, 0.95);
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(13, 110, 253, 0.45);
            color: #fff;
            text-decoration: none;
        }

        /* Mobile: icon only */
        @media (max-width: 576px) {
            .floating-back-btn-modern .text {
                display: none;
            }
        }

    </style>
</head>

<body>
    <form runat="server">

        <div class="container mt-5">
            <div class="card shadow p-4">

                <h4 class="mb-3">My Appointments</h4>

                <asp:GridView ID="gvAppointments" runat="server"
                    CssClass="table table-bordered table-striped"
                    AutoGenerateColumns="False"
                    EmptyDataText="No appointments found">

                    <Columns>
                        <asp:BoundField DataField="AppointmentID" HeaderText="ID" />
                        <asp:BoundField DataField="AppointmentDay" HeaderText="Day" />
                        <asp:BoundField DataField="AppointmentDate" HeaderText="Date"
                            DataFormatString="{0:dd MMM yyyy}" />
                        <asp:BoundField DataField="TimeSlot" HeaderText="Time Slot" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />


                    </Columns>

                </asp:GridView>

            </div>
        </div>

      
        <a href="PatientsDashboard.aspx" class="floating-back-btn-modern">
            <span class="arrow">←</span>
            <span class="text">Back to Dashboard</span>
        </a>


    </form>
</body>
</html>

