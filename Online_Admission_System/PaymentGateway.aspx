<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentGateway.aspx.cs" Inherits="Online_Admission_System.PaymentGateway" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment Gateway</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .details-section {
            max-height: 0;
            overflow: hidden;
            transition: all 0.5s ease-in-out;
            opacity: 0;
        }
        .details-section.show {
            max-height: 500px; /* enough height for content */
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
                        <h3 class="text-center mb-4">Secure Payment</h3>

                        <!-- Summary -->
                        <div class="mb-3">
                            <small class="text-muted">Course</small>
                            <asp:Label ID="lblCourseName" runat="server" CssClass="form-control-plaintext fw-semibold"></asp:Label>
                        </div>
                        <div class="mb-3">
                            <small class="text-muted">Amount</small>
                            <asp:Label ID="lblAmount" runat="server" CssClass="form-control-plaintext text-success fw-bold fs-5"></asp:Label>
                        </div>

                        <hr />

                        <!-- Payment Methods -->
                        <h6 class="mb-3">Choose Payment Method</h6>
                        <div class="list-group mb-3">
                            <label class="list-group-item">
                                <asp:RadioButton ID="rdbCard" runat="server" GroupName="paymentMethod" Text="Credit / Debit Card" CssClass="form-check-input me-2" /> 
                            </label>
                            <label class="list-group-item">
                                <asp:RadioButton ID="rdbUPI" runat="server" GroupName="paymentMethod" Text="UPI" CssClass="form-check-input me-2" /> 
                            </label>
                            <label class="list-group-item">
                                <asp:RadioButton ID="rdbNetBanking" runat="server" GroupName="paymentMethod" Text="Net Banking" CssClass="form-check-input me-2" />
                            </label>
                        </div>

                        <!-- Card Details -->
                        <div id="cardDetails" class="details-section">
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
                        </div>

                        <!-- UPI -->
                        <div id="upiDetails" class="details-section">
                            <div class="mb-3">
                                <label class="form-label">UPI ID</label>
                                <asp:TextBox ID="txtUPI" runat="server" CssClass="form-control" placeholder="example@upi" />
                            </div>
                        </div>

                        <!-- Net Banking -->
                        <div id="netBankingDetails" class="details-section">
                            <div class="mb-3">
                                <label class="form-label">Select Bank</label>
                                <asp:DropDownList ID="ddlBank" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="-- Select Bank --" />
                                    <asp:ListItem Text="SBI" />
                                    <asp:ListItem Text="HDFC" />
                                    <asp:ListItem Text="ICICI" />
                                    <asp:ListItem Text="Axis Bank" />
                                </asp:DropDownList>
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="d-flex justify-content-between mt-4">
                            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-outline-secondary px-4" PostBackUrl="~/finalView.aspx" />
                            <asp:Button ID="btnPay" runat="server" Text="Pay Now" CssClass="btn btn-success px-4" OnClick="btnPay_Click"  />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>
        document.querySelectorAll("input[name='paymentMethod']").forEach(radio => {
            radio.addEventListener("change", function () {
                document.getElementById("cardDetails").classList.remove("show");
                document.getElementById("upiDetails").classList.remove("show");
                document.getElementById("netBankingDetails").classList.remove("show");

                if (this.id.includes("rdbCard")) {
                    document.getElementById("cardDetails").classList.add("show");
                }
                else if (this.id.includes("rdbUPI")) {
                    document.getElementById("upiDetails").classList.add("show");
                }
                else if (this.id.includes("rdbNetBanking")) {
                    document.getElementById("netBankingDetails").classList.add("show");
                }
            });
        });
    </script>
</body>
</html>
