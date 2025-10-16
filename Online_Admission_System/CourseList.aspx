<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseList.aspx.cs" Inherits="Online_Admission_System.CourseList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Course List</title>
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
                    <h2 class="mb-4">Course Management</h2>

                    <!-- Add Course -->
                    <div class="card p-3 mb-4">
                        <h5>Add New Course</h5>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <asp:TextBox ID="txtCourseName" runat="server" CssClass="form-control" placeholder="Course Name"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtFees" runat="server" CssClass="form-control" placeholder="Course Fees"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control" placeholder="Course Duration"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <!-- Upload Image -->
                                <asp:FileUpload ID="fuCourseImage" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <asp:Button ID="btnAddCourse" runat="server" Text="Add Course" CssClass="btn btn-primary mt-3" OnClick="btnAddCourse_Click"   />
                    </div>


                    <!-- Course List -->
                    <div class="card p-3">
                        <h5>Available Courses</h5>
                        <asp:GridView ID="gvCourses" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered mt-3"
                            DataKeyNames="CourseId" OnRowDeleting="gvCourses_RowDeleting" >
                            <Columns>
                                <asp:BoundField DataField="CourseId" HeaderText="ID" ReadOnly="true" />
                                <asp:BoundField DataField="CourseName" HeaderText="Course Name" />
                                <asp:BoundField DataField="Duration" HeaderText="Course Duration" /> 
                                <asp:BoundField DataField="Fees" HeaderText="Course Fees" />
                                <asp:CommandField ShowDeleteButton="True" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>