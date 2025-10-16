<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recipt.aspx.cs" Inherits="Online_Car_Store.Recipt" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Booking Receipt</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
       body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f8f9fa, #e6f2ff);
            padding: 20px;
        }

        .receipt-container {
            max-width: 700px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
            border: 1px solid #ddd;
        }

        .receipt-header {
            text-align: center;
            margin-bottom: 25px;
        }

        .receipt-header img {
            max-width: 100px;
            margin-bottom: 15px;
        }

        .receipt-header h2 {
            color: #ff4c29;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .receipt-header p {
            color: #555;
            margin-bottom: 0;
        }

        .receipt-details {
            border-top: 1px solid #ddd;
            padding-top: 20px;
        }

        .receipt-details p {
            font-size: 1rem;
            margin: 10px 0;
        }

        .receipt-details p strong {
            width: 150px;
            display: inline-block;
            color: #333;
        }

        .btn-print {
            background: linear-gradient(45deg, #ff4c29, #ffb347);
            color: #fff;
            border-radius: 30px;
            padding: 10px 25px;
            font-weight: bold;
            transition: all 0.3s ease;
            border: none;
            margin-top: 20px;
        }

        .btn-print:hover {
            background: linear-gradient(45deg, #ffb347, #ff4c29);
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(255,180,71,0.5);
        }

        .receipt-footer {
            text-align: center;
            margin-top: 25px;
            font-size: 0.9rem;
            color: #777;
        }

        @media print {
            .btn-print {
                display: none;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="receipt-container" id="receipt">
            <div class="receipt-header">
                <h2>Booking Receipt</h2>
                <p>Thank you for choosing Wheelz!</p>
            </div>

            <div class="receipt-details">
                <p><strong>Customer Name:</strong> <asp:Label ID="lblCustomerName" runat="server"></asp:Label></p>
                <p><strong>Car Name:</strong> <asp:Label ID="lblCarName" runat="server"></asp:Label></p>
                <p><strong>Brand:</strong> <asp:Label ID="lblBrand" runat="server"></asp:Label></p>
                <p><strong>Model:</strong> <asp:Label ID="lblModel" runat="server"></asp:Label></p>
                <p><strong>Total Price:</strong> $<asp:Label ID="lblTotalPrice" runat="server"></asp:Label></p>
                <p><strong>Booking Amount:</strong> $<asp:Label ID="lblBookingAmount" runat="server"></asp:Label></p>
                <p><strong>Remaining Amount:</strong> $<asp:Label ID="lblRemainingAmount" runat="server"></asp:Label></p>
                <p><strong>Booking Date:</strong> <asp:Label ID="lblBookingDate" runat="server"></asp:Label></p>
                <p><strong>Payment Date:</strong> <asp:Label ID="lblPaymentDate" runat="server"></asp:Label></p>
                <p><strong>PaymentMode:</strong> <asp:Label ID="lblPaymentMode" runat="server"></asp:Label></p>
               
            </div>

            <div class="text-center">
                <button type="button" class="btn btn-print" onclick="printReceipt()">Print Receipt</button>
            </div>

            <div class="receipt-footer">
                <p>For support, contact us at support@wheelz.com or call 1800-123-456.</p>
            </div>
        </div>
    </form>

    <script>
        function printReceipt() {
            var printContents = document.getElementById('receipt').innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
            location.reload();
        }
    </script>
</body>
</html>
