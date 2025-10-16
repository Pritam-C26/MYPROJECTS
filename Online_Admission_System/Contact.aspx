<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Online_Admission_System.Contact" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Contact Us - Online Admission System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
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
                        <li class="nav-item"><a class="nav-link" href="Courses.aspx">Courses</a></li>
                        <li class="nav-item"><a class="nav-link active" href="Contact.aspx">Contact</a></li>
                        <li class="nav-item">
                            <asp:LinkButton ID="btnLogout" runat="server" CssClass="nav-link text-warning" OnClick="btnLogout_Click">Logout</asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <%-- Contact Form Section --%>
        <div class="container mt-5 mb-5">
            <h2 class="mb-4">Contact Us</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="mb-3">
                        <asp:Label runat="server" AssociatedControlID="txtName" Text="Name:" CssClass="form-label" />
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your name" />
                    </div>
                    <div class="mb-3">
                        <asp:Label runat="server" AssociatedControlID="txtEmail" Text="Email:" CssClass="form-label" />
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter your email" />
                    </div>
                    <div class="mb-3">
                        <asp:Label runat="server" AssociatedControlID="txtMessage" Text="Message:" CssClass="form-label" />
                        <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Write your message here..." />
                    </div>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                    <asp:Label ID="lblStatus" runat="server" CssClass="mt-3 d-block text-success fw-bold" />
                </div>

                <%-- Contact Info Card --%>
                <div class="col-md-6">
                    <div class="card shadow-lg border-0">
                        <div class="card-body">
                            <h5 class="card-title text-primary">Our Contact Details</h5>
                            <p class="card-text mb-2"><strong>Address:</strong><br />
                                Online Admission System HQ,<br />
                                123 Education Street,<br />
                                Kolkata, West Bengal, India
                            </p>
                            <p class="card-text mb-2"><strong>Phone:</strong><br />
                                +91 98765 43210
                            </p>
                            <p class="card-text mb-2"><strong>Email:</strong><br />
                                support@onlineadmission.com
                            </p>
                            <p class="card-text"><strong>Working Hours:</strong><br />
                                Mon - Sat, 9:00 AM - 6:00 PM
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- Bootstrap JS --%>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
