<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="GroceryStore.Checkout" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Checkout - Grocery Store</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- ✅ Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background-color: #f4f7fa;
            font-family: "Poppins", sans-serif;
        }

        .checkout-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            background-color: #fff;
            transition: all 0.3s ease;
        }

        .checkout-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
        }

        h2, h4 {
            font-weight: 600;
            color: #212529;
        }

        .btn-success {
            border-radius: 30px;
            padding: 12px 35px;
            font-weight: 600;
        }

        .form-label {
            font-weight: 500;
        }

        .details-section {
            display: none;
            margin-top: 15px;
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 10px;
        }

        .details-section.show {
            display: block;
        }

        .list-group-item {
            cursor: pointer;
        }

        .text-success {
            font-weight: bold;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10">

                    <h2 class="text-center mb-5">🛒 Checkout</h2>

                    <!-- 🧾 Billing Details -->
                    <div class="checkout-card p-4 mb-4">
                        <h4 class="mb-3">Billing Details</h4>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <asp:Label runat="server" AssociatedControlID="txtName" CssClass="form-label" Text="Full Name"></asp:Label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="John Doe" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="form-label" Text="Email"></asp:Label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="john@example.com" />
                            </div>
                            <div class="col-md-6 md-3">
                                <asp:Label  runat="server" AssociatedControlID="txtPhone" CssClass="form-label" Text="Phone Number"></asp:Label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" ></asp:TextBox>
                            </div>
                            <div class="col-md-12 mb-3">
                                <asp:Label runat="server" AssociatedControlID="txtAddress" CssClass="form-label" Text="Address"></asp:Label>
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" placeholder="123 Main Street, City, ZIP" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <asp:Label runat="server" AssociatedControlID="txtCity" CssClass="form-label" Text="City"></asp:Label>
                                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="City" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <asp:Label runat="server" AssociatedControlID="txtPostalCode" CssClass="form-label" Text="Postal Code"></asp:Label>
                                <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control" placeholder="ZIP Code" />
                            </div>
                        </div>
                    </div>

                    <!-- 💳 Payment Methods -->
                    <div class="checkout-card p-4 mb-4">
                        <h4 class="mb-3">Payment Method</h4>

                        <div class="list-group mb-3">
                            <div class="list-group-item">
                                <asp:RadioButton ID="rdbCard" runat="server" GroupName="paymentMethod" 
                                    CssClass="form-check-input me-2" Text="Credit / Debit Card" onclick="showPaymentDetails('card')" />
                                
                            </div>
                            <div class="list-group-item">
                                <asp:RadioButton ID="rdbUPI" runat="server" GroupName="paymentMethod" 
                                    CssClass="form-check-input me-2" Text="UPI" onclick="showPaymentDetails('upi')" />
                               
                            </div>
                            <div class="list-group-item">
                                <asp:RadioButton ID="rdbNetBanking" runat="server" GroupName="paymentMethod" 
                                    CssClass="form-check-input me-2" Text="Net Banking" onclick="showPaymentDetails('net')" />
                                
                            </div>
                            <div class="list-group-item">
                                <asp:RadioButton ID="rdbCOD" runat="server" GroupName="paymentMethod" 
                                    CssClass="form-check-input me-2" Text="Cash On Delivery" onclick="showPaymentDetails('cod')" />
                                
                            </div>
                        </div>

                        <!-- Card Details Panel -->
                        <asp:Panel ID="pnlCard" runat="server" CssClass="details-section">
                            <asp:Label runat="server" Text="Card Number" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-control mb-3" MaxLength="20" placeholder="1234 5678 9012 3456" />

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <asp:Label runat="server" Text="Expiry (MM/YY)" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="txtExpiry" runat="server" CssClass="form-control" placeholder="MM/YY" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <asp:Label runat="server" Text="CVV" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="txtCVV" runat="server" CssClass="form-control" TextMode="Password" MaxLength="3" placeholder="123" />
                                </div>
                            </div>
                        </asp:Panel>

                        <!-- UPI Details Panel -->
                        <asp:Panel ID="pnlUPI" runat="server" CssClass="details-section">
                            <asp:Label runat="server" Text="UPI ID" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtUPI" runat="server" CssClass="form-control" placeholder="example@upi" />
                        </asp:Panel>

                        <!-- Net Banking Details Panel -->
                        <asp:Panel ID="pnlNetBanking" runat="server" CssClass="details-section">
                            <asp:Label runat="server" Text="Select Bank" CssClass="form-label"></asp:Label>
                            <asp:DropDownList ID="ddlBank" runat="server" CssClass="form-select">
                                <asp:ListItem Text="-- Select Bank --" Value="" />
                                <asp:ListItem Text="SBI" Value="SBI" />
                                <asp:ListItem Text="HDFC" Value="HDFC" />
                                <asp:ListItem Text="ICICI" Value="ICICI" />
                                <asp:ListItem Text="Axis Bank" Value="Axis" />
                            </asp:DropDownList>
                        </asp:Panel>

                        <!-- Cash On Delivery -->
                        <asp:Panel ID="pnlCOD" runat="server" CssClass="details-section">
                            <p class="text-muted">You can pay directly in cash when your order is delivered.</p>
                        </asp:Panel>
                    </div>

                    <!-- 💰 Total -->
                    <div class="checkout-card p-4 mb-4 text-end">
                        <h4>Total Amount: <span class="text-success">₹<asp:Label ID="lblTotalAmount" runat="server" Text="0"></asp:Label></span></h4>
                    </div>

                    <!-- ✅ Place Order Button -->
                    <div class="text-center">
                        <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" CssClass="btn btn-success btn-lg px-5" OnClick="btnPlaceOrder_Click" />
                    </div>

                </div>
            </div>
        </div>

        <!-- ✅ Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- ✅ Payment Toggle Script -->
        <script type="text/javascript">
            function showPaymentDetails(selected) {
                document.getElementById('<%= pnlCard.ClientID %>').classList.remove("show");
                document.getElementById('<%= pnlUPI.ClientID %>').classList.remove("show");
                document.getElementById('<%= pnlNetBanking.ClientID %>').classList.remove("show");
                document.getElementById('<%= pnlCOD.ClientID %>').classList.remove("show");

                if (selected === "card") {
                    document.getElementById('<%= pnlCard.ClientID %>').classList.add("show");
                } else if (selected === "upi") {
                    document.getElementById('<%= pnlUPI.ClientID %>').classList.add("show");
                } else if (selected === "net") {
                    document.getElementById('<%= pnlNetBanking.ClientID %>').classList.add("show");
                } else if (selected === "cod") {
                    document.getElementById('<%= pnlCOD.ClientID %>').classList.add("show");
                }
            }
        </script>
    </form>
</body>
</html>
