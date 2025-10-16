<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentSummary.aspx.cs" Inherits="Online_Admission_System.PaymentSummary" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment Summary</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="mb-4 text-center">Payment Summary</h2>

            <asp:DetailsView ID="DetailsViewPayment" runat="server" CssClass="table table-bordered"
                AutoGenerateRows="false">
                <Fields>
                    <asp:BoundField DataField="FullName" HeaderText="Student Name" />
                    <asp:BoundField DataField="CourseName" HeaderText="Course" />
                    <asp:BoundField DataField="Fees" HeaderText="Course Fee" />
                    <asp:BoundField DataField="ApplicationFee" HeaderText="Application Fee" />
                    <asp:BoundField DataField="TotalAmount" HeaderText="Total Payable" />
                </Fields>
            </asp:DetailsView>

            <div class="d-flex justify-content-center gap-4 mt-4">
                <asp:Button ID="btnPay" runat="server" Text="Proceed to Pay" CssClass="btn btn-success btn-lg" OnClick="btnPay_Click" />
                <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-secondary btn-lg" PostBackUrl="finalView.aspx" />
            </div>
        </div>
    </form>
</body>
</html>