<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationForm.aspx.cs" Inherits="Online_Admission_System.ApplicationForm" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Application Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: #f4f7f9;
        }
        .form-container {
            max-width: 700px;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.1);
        }
        .form-header {
            text-align: center;
            margin-bottom: 25px;
        }
        .form-header h2 {
            font-weight: bold;
            color: #333;
            text-align:center;

        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="form-container">
                <h2>Application Form</h2>
                </div>

                <!-- Full Name -->
                <div class="mb-3">
                    <asp:Label ID="lblFullName" runat="server" Text="Full Name" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
                </div>

                <!-- DOB -->
                <div class="mb-3">
                    <asp:Label ID="lblDOB" runat="server" Text="Date of Birth" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>

                <!-- Gender -->
                <div class="mb-3">
                    <asp:Label ID="lblGender" runat="server" Text="Gender" CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Select gender" Value=""></asp:ListItem>
                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                        <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <!-- Phone -->
                <div class="mb-3">
                    <asp:Label ID="lblPhone" runat="server" Text="Phone Number" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter phone number" MaxLength="10"></asp:TextBox>
                </div>

                <!-- Email -->
                <div class="mb-3">
                    <asp:Label ID="lblEmail" runat="server" Text="Email Address" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter email address"></asp:TextBox>
                </div>

                <!-- Address -->
                <div class="mb-3">
                    <asp:Label ID="lblAddress" runat="server" Text="Address" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter your address"></asp:TextBox>
                </div>

                <!-- Previous School -->
                <div class="mb-3">
                    <asp:Label ID="lblSchool" runat="server" Text="Previous School" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtSchool" runat="server" CssClass="form-control" placeholder="Enter previous school"></asp:TextBox>
                </div>

                <!-- Marks -->
                <div class="mb-3">
                    <asp:Label ID="lblMarks" runat="server" Text="Marks Obtained (%)" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtMarks" runat="server" CssClass="form-control" placeholder="Enter marks in percentage"></asp:TextBox>
                </div>

                <!-- Passing Year -->
                <div class="mb-3">
                    <asp:Label ID="lblYear" runat="server" Text="Passing Year" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtYear" runat="server" CssClass="form-control" placeholder="Enter passing year"></asp:TextBox>
                </div>

                <!-- Last Qualification -->
                <div class="mb-3">
                    <asp:Label ID="lblQualification" runat="server" Text="Last Qualification" CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="ddlQualification" runat="server" CssClass="form-select">
                         <asp:ListItem Text="Select" Value=""></asp:ListItem>
                         <asp:ListItem Text="11th" Value="11th"></asp:ListItem>
                         <asp:ListItem Text="12th" Value="12th"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <!-- Submit Button -->
             
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-lg" OnClick="btnSubmit_Click" />
                    <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-secondary btn-lg" OnClick="btnNext_Click" />
                </div>

            
      
       

    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>