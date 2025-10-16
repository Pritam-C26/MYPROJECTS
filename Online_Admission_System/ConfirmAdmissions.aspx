<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmAdmissions.aspx.cs" Inherits="Online_Admission_System.ConfirmAdmissions" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Confirmed Admissions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
         body {
             background-color: #f8f9fa;
         }
         .sidebar {
             min-height: 100vh;
             background: #343a40;
             color: white;
         }
         .sidebar a {
             color: white;
             display: block;
             padding: 10px 15px;
             text-decoration: none;
         }
         .sidebar a:hover {
             background: #495057;
         }

         .btn-container {
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
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-3 col-lg-2 sidebar p-3">
                    <h4 class="mb-4">Admin Panel</h4>
                     <ul class="nav flex-column">
                         <li><a href="AdminDashboard.aspx">Dashboard</a></li>
                         <li><a href="ViewApplications.aspx">View Applications</a></li>
                         <li><a href="ConfirmAdmissions.aspx">Confirm Admissions</a></li>
                         <li><a href="CourseList.aspx">Course List</a></li>
                         <li><a href="PaymentList.aspx">Payments</a></li>
                          <li><a href="ViewMessage.aspx">Messages</a></li>
                         <li>
                             <asp:LinkButton ID="btnLogout" runat="server" CssClass="nav-link text-danger" OnClick="btnLogout_Click" >Logout</asp:LinkButton>
                         </li>
                     </ul>
                </div>

                <!-- Main Content -->
                <div class="col-md-9 col-lg-10 p-4">
                    <h2 class="mb-4">Confirmed Admissions</h2>
                    <asp:GridView ID="gvConfirmAdmissions" runat="server" CssClass="table table-bordered table-striped"
                        AutoGenerateColumns="False" AllowPaging="true" PageSize="10" 
                        OnPageIndexChanging="gvConfirmAdmissions_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="ApplicationId" HeaderText="Application ID" />
                            <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="CourseName" HeaderText="Course" />
                            <asp:BoundField DataField="SubmissionDate" HeaderText="Admission Date" DataFormatString="{0:dd-MM-yyyy}" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

             <!-- Back Button -->
             <div class="btn-container">
                 <asp:Button ID="btnBack" runat="server" Text="⬅ Back" CssClass="btn-back" OnClick="btnBack_Click" />
             </div>
        </div>
    </form>
</body>
</html>
