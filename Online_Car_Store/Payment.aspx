<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Online_Car_Store.Payment" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Wheelz - Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .details-section {
            max-height: 0;
            overflow: hidden;
            transition: all 0.5s ease-in-out;
            opacity: 0;
        }
        .details-section.show {
            max-height: 500px;
            opacity: 1;
            margin-top: 10px;
        }
    </style>
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="card shadow p-4 rounded-4">
                        <h3 class="text-center mb-4">Complete Your Payment</h3>

                        <!-- Payment Summary -->
                        <div class="mb-3">
                            <small class="text-muted">Booking ID</small>
                            <asp:Label ID="lblBookingId" runat="server" CssClass="form-control-plaintext fw-semibold"></asp:Label>
                        </div>
                        <div class="mb-3">
                            <small class="text-muted">Car Name</small>
                            <asp:Label ID="lblCarName" runat="server" CssClass="form-control-plaintext fw-semibold"></asp:Label>
                        </div>
                        <div class="mb-3">
                            <small class="text-muted">Booking Amount</small>
                            <asp:Label ID="lblBookingAmount" runat="server" CssClass="form-control-plaintext text-success fw-bold fs-5"></asp:Label>
                        </div>

                        <hr />

                        <!-- Payment Methods -->
                        <h6 class="mb-3">Select Payment Method</h6>
                        <div class="list-group mb-3">
                            <label class="list-group-item">
                                <asp:RadioButton ID="rdbCard" runat="server" GroupName="paymentMethod" Text="Credit / Debit Card" CssClass="form-check-input me-2" AutoPostBack="true"  />
                            </label>
                            <label class="list-group-item">
                                <asp:RadioButton ID="rdbUPI" runat="server" GroupName="paymentMethod" Text="UPI" CssClass="form-check-input me-2" AutoPostBack="true"  />
                            </label>
                            <label class="list-group-item">
                                <asp:RadioButton ID="rdbNetBanking" runat="server" GroupName="paymentMethod" Text="Net Banking" CssClass="form-check-input me-2" AutoPostBack="true"  />
                            </label>
                        </div>

                        <!-- Card Details Panel -->
                        <asp:Panel ID="pnlCard" runat="server" CssClass="details-section">
                            <div class="mb-3">
                                <label class="form-label">Card Number</label>
                                <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-control" MaxLength="20" />
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Expiry (MM/YY)</label>
                                    <asp:TextBox ID="txtExpiry" runat="server" CssClass="form-control" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">CVV</label>
                                    <asp:TextBox ID="txtCVV" runat="server" CssClass="form-control" TextMode="Password" MaxLength="3" />
                                </div>
                            </div>
                        </asp:Panel>

                        <!-- UPI Details Panel -->
                        <asp:Panel ID="pnlUPI" runat="server" CssClass="details-section">
                            <div class="mb-3">
                                <label class="form-label">UPI ID</label>
                                <asp:TextBox ID="txtUPI" runat="server" CssClass="form-control" placeholder="example@upi" />
                            </div>
                        </asp:Panel>

                        <!-- Net Banking Details Panel -->
                        <asp:Panel ID="pnlNetBanking" runat="server" CssClass="details-section">
                            <div class="mb-3">
                                <label class="form-label">Select Bank</label>
                                <asp:DropDownList ID="ddlBank" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="-- Select Bank --" Value="" />
                                    <asp:ListItem Text="SBI" Value="SBI" />
                                    <asp:ListItem Text="HDFC" Value="HDFC" />
                                    <asp:ListItem Text="ICICI" Value="ICICI" />
                                    <asp:ListItem Text="Axis Bank" Value="Axis" />
                                </asp:DropDownList>
                            </div>
                        </asp:Panel>

                        <!-- Hidden fields to store IDs -->
                        <asp:HiddenField ID="hfCarId" runat="server" />
                        <asp:HiddenField ID="hfUserId" runat="server" />

                        <!-- Action Buttons -->
                        <div class="d-flex justify-content-between mt-4">
                            <asp:Button ID="btnPay" runat="server" Text="Pay Now" CssClass="btn btn-success px-4" OnClick="btnPay_Click"  />
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    // Function to show the correct payment details panel
    function showPaymentDetails() {
        var card = document.getElementById('<%= rdbCard.ClientID %>');
        var upi = document.getElementById('<%= rdbUPI.ClientID %>');
        var netBanking = document.getElementById('<%= rdbNetBanking.ClientID %>');

        var pnlCard = document.getElementById('<%= pnlCard.ClientID %>');
        var pnlUPI = document.getElementById('<%= pnlUPI.ClientID %>');
        var pnlNetBanking = document.getElementById('<%= pnlNetBanking.ClientID %>');

        pnlCard.classList.remove('show');
        pnlUPI.classList.remove('show');
        pnlNetBanking.classList.remove('show');

        if (card.checked) {
            pnlCard.classList.add('show');
        } else if (upi.checked) {
            pnlUPI.classList.add('show');
        } else if (netBanking.checked) {
            pnlNetBanking.classList.add('show');
        }
    }

    // Attach event listeners when the page loads
    window.onload = function () {
        document.getElementById('<%= rdbCard.ClientID %>').addEventListener('change', showPaymentDetails);
        document.getElementById('<%= rdbUPI.ClientID %>').addEventListener('change', showPaymentDetails);
        document.getElementById('<%= rdbNetBanking.ClientID %>').addEventListener('change', showPaymentDetails);

        // Initialize the display based on which is checked by default
        showPaymentDetails();
    };
    </script>

</body>
</html>