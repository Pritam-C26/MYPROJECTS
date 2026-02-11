<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Online_Doctor_Appointment_System.Patients.EditProfile" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Edit Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>

        label
        {
            display: inline-block;
            font-weight: 700;
        }



    </style>
</head>
<body class="bg-light">

<form id="form1" runat="server">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-7">

            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center">
                    <h4>My Profile</h4>
                </div>

                <div class="card-body">

                    <!-- READ ONLY -->
                    <label>Full Name</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control mb-2"
                        ReadOnly="true" />

                    <label>Gender</label>
                    <asp:TextBox ID="txtGender" runat="server" CssClass="form-control mb-2"
                        ReadOnly="true" />

                    

                    <hr />

                    <!-- EDITABLE -->
                    <label>Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control mb-2" />

                    <label>Phone</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control mb-2" />

                    <label>Date of Birth</label>
                    <asp:TextBox ID="txtDOB" runat="server" TextMode="Date"
                        CssClass="form-control mb-2" />

                    <label>Age</label>
                    <asp:TextBox ID="txtAge" runat="server" CssClass="form-control mb-2" />

                    <label>Address</label>
                    <asp:TextBox ID="txtAddress" runat="server"
                        TextMode="MultiLine" Rows="3"
                        CssClass="form-control mb-3" />

                    <div class="text-center">
                        <asp:Button ID="btnUpdate" runat="server"
                            Text="Update Profile"
                            CssClass="btn btn-success me-2"
                            OnClick="btnUpdate_Click" />

                        <asp:Button ID="btnBack" runat="server"
                            Text="Back"
                            CssClass="btn btn-secondary"
                            OnClick="btnBack_Click" />
                    </div>


                    <asp:Label ID="lblMsg" runat="server"
                        CssClass="text-success text-center d-block mt-3" />

                </div>
            </div>

        </div>
    </div>
</div>

</form>
</body>
</html>

