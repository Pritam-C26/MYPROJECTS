<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="statusCheck.aspx.cs" Inherits="Online_Admission_System.statusCheck" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Application Status</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>.btn-container {
    text-align: center;
    margin-top: 20px;
}
.btn-back {
    background-color: #3498db;
    color: #fff;
    padding: 10px 18px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 15px;
    transition: background 0.3s;
}
.btn-back:hover {
    background-color: #217dbb;
}</style>
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow-lg p-4">
                        <h3 class="text-center mb-4">Check Application Status</h3>
                        
                        <div class="mb-3">
                            <label for="txtUserId" class="form-label">Enter User ID</label>
                            <asp:TextBox ID="txtApplicationId" runat="server" CssClass="form-control" placeholder="User ID"></asp:TextBox>
                        </div>
                        

                        <asp:Button ID="btnCheck" runat="server" Text="Check Status" CssClass="btn btn-primary w-100" OnClick="btnCheck_Click"  />

                        <div class="mt-4">
                           <asp:GridView ID="gvStatus" runat="server" CssClass="table table-bordered table-striped text-center" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="ApplicationId" HeaderText="Application ID" />
                                    <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                                    <asp:BoundField DataField="CourseName" HeaderText="Course" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" />
                                    <asp:BoundField DataField="SubmissionDate" HeaderText="Applied Date" DataFormatString="{0:dd/MM/yyyy}" />
                                </Columns>
                            </asp:GridView>
                            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Back Button -->
        <div class="btn-container">
            <asp:Button ID="btnBack" runat="server" Text="Back to Dashboard" CssClass="btn-back" OnClick="btnBack_Click" />
        </div>
    </form>
</body>
</html>