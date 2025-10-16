<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentSuccess.aspx.cs" Inherits="Online_Admission_System.PaymentSuccess" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Payment Receipt</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .receipt-box {
            max-width: 700px;
            margin: auto;
            padding: 30px;
            border: 1px solid #eee;
            box-shadow: 0 0 10px rgba(0, 0, 0, .15);
            font-size: 16px;
            line-height: 24px;
            font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
            color: #555;
        }
        .receipt-box h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .print-btn {
            margin-top: 20px;
        }
    </style>
    <script>
        function printReceipt() {
            var receiptContent = document.getElementById("receipt").innerHTML;
            var originalContent = document.body.innerHTML;
            document.body.innerHTML = receiptContent;
            window.print();
            document.body.innerHTML = originalContent;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="receipt-box" id="receipt">
            <h2>Payment Receipt</h2>
            <table class="table table-bordered">
                <tr>
                    <th>Transaction ID</th>
                    <td><asp:Label ID="lblTransactionId" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>User Name</th>
                    <td><asp:Label ID="lblUserName" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>Course</th>
                    <td><asp:Label ID="lblCourse" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>Amount</th>
                    <td>₹ <asp:Label ID="lblAmount" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>Payment Method</th>
                    <td><asp:Label ID="lblPaymentMethod" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>Date</th>
                    <td><asp:Label ID="lblDate" runat="server"></asp:Label></td>
                </tr>
            </table>
        </div>

        <div class="text-center print-btn">
            <button type="button" class="btn btn-success" onclick="printReceipt()">Print Receipt</button>
            <a href="StudentDashboard.aspx" class="btn btn-primary">Back to Dashboard</a>
        </div>
    </form>
</body>
</html>