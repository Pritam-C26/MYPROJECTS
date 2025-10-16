<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="Online_Admission_System.Courses" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Courses</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        
        <%-- Navbar --%>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top">
            <div class="container">
                <a class="navbar-brand" href="StudentDashboard.aspx">Online Admission System</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="StudentDashboard.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link active" href="Courses.aspx">Courses</a></li>
                        <li class="nav-item"><a class="nav-link" href="Contact.aspx">Contact</a></li>
                        <li class="nav-item">
                                <asp:LinkButton ID="btnLogout" runat="server" CssClass="nav-link text-warning" OnClick="btnLogout_Click">Logout</asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <%-- Course Cards --%>
                     <div class="container py-5">
                        <h2 class="text-center mb-4">Our Courses</h2>
                        <div class="row g-4">
                            <asp:Repeater ID="rptCourses" runat="server" OnItemCommand="rptCourses_ItemCommand1">
                                <ItemTemplate>
                                    <div class="col-md-4">
                                        <div class="card shadow-lg h-100">
                                            <img src='<%# ResolveUrl(Eval("ImagePath").ToString()) %>' 
                                                 class="card-img-top" style="height: 220px; object-fit: cover;" alt="Course" />
                                            <div class="card-body text-center">
                                                <h5 class="card-title"><%# Eval("CourseName") %></h5>
                                                <p class="card-text">
                                                    Duration: <%# Eval("Duration") %><br />
                                                    Fees: $<%# Eval("Fees") %>
                                                </p>
                                                <asp:Button ID="btnApply" runat="server" Text="Apply Now" 
                                                    CommandName="ApplyCourse"
                                                    CommandArgument='<%# Eval("CourseId") %>' 
                                                    CssClass="btn btn-primary" />
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>


        <%-- Footer --%>
        <footer class="bg-primary text-white text-center py-3 mt-5">
            &copy; 2025 Online Admission System | Contact: admission@example.com
        ntact: admission@example.com
        </footer>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
