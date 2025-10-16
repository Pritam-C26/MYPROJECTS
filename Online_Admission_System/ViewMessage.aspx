<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewMessage.aspx.cs" Inherits="Online_Admission_System.ViewMessage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Messages</title>
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
            border-radius: 5px;
            margin-bottom: 5px;
        }
        .sidebar a:hover {
            background: #495057;
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
                            <asp:LinkButton ID="btnLogout" runat="server" CssClass="nav-link text-danger" OnClick="btnLogout_Click">Logout</asp:LinkButton>
                         </li>
                     </ul>
                </div>

                <!-- Main Content -->
                <div class="col-md-9 col-lg-10 p-4">
                    <div class="card shadow">
                        <div class="card-header bg-primary text-white">
                            Messages from Students
                        </div>
                        <div class="card-body">
                            <asp:GridView ID="GridViewMessages" runat="server" 
                                CssClass="table table-bordered table-striped" AutoGenerateColumns="False" EmptyDataText="No messages found."
                                AllowPaging="true" PageSize="10" OnPageIndexChanging="GridViewMessages_PageIndexChanging" >
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="ID" />
                                    <asp:BoundField DataField="Name" HeaderText="Name" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" />
                                    <asp:BoundField DataField="Message" HeaderText="Message" />
                                    <asp:BoundField DataField="CreateAt" HeaderText="Date" DataFormatString="{0:dd-MM-yyyy HH:mm}" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>