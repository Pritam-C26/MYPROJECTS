<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationDetails.aspx.cs" Inherits="Online_Admission_System.ApplicationDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Application Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 75%;
            margin: 30px auto;
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #2c3e50;
        }
        .section {
            margin: 12px 0;
            padding: 12px;
            border-bottom: 1px solid #eee;
        }
        .label {
            font-weight: bold;
            width: 180px;
            display: inline-block;
            color: #34495e;
        }
        img {
            max-width: 150px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top: 8px;
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
        <div class="container">
            <h2>Student Application Details</h2>
            <hr />

            <!-- Photo -->
            <div class="section">
                <span class="label">Photo:</span><br />
                <asp:Image ID="imgPhoto" runat="server" Width="150px" Height="180px" />
            </div>

            <!-- Signature -->
            <div class="section">
                <span class="label">Signature:</span><br />
                <asp:Image ID="imgSign" runat="server" Width="150px" Height="80px" />
            </div>

            <!-- Personal Information -->
            <div class="section">
                <span class="label">Full Name:</span>
                <asp:Label ID="lblFullName" runat="server" />
            </div>
            <div class="section">
                <span class="label">Date of Birth:</span>
                <asp:Label ID="lblDOB" runat="server" />
            </div>
            <div class="section">
                <span class="label">Gender:</span>
                <asp:Label ID="lblGender" runat="server" />
            </div>
            <div class="section">
                <span class="label">Address:</span>
                <asp:Label ID="lblAddress" runat="server" />
            </div>
            <div class="section">
                <span class="label">Email:</span>
                <asp:Label ID="lblEmail" runat="server" />
            </div>
            <div class="section">
                <span class="label">Phone:</span>
                <asp:Label ID="lblPhone" runat="server" />
            </div>
            <div class="section">
                <span class="label">Previous School:</span>
                <asp:Label ID="lblSchool" runat="server" />
            </div>
            <div class="section">
                <span class="label">Marks:</span>
                <asp:Label ID="lblMarks" runat="server" />
            </div>
            <div class="section">
                <span class="label">Last Qualification:</span>
                <asp:Label ID="lblQualification" runat="server" />
            </div>
            <div class="section">
                <span class="label">Passing Year:</span>
                <asp:Label ID="lblYear" runat="server" />
            </div>
            <div class="section">
                <span class="label">Submission Date:</span>
                <asp:Label ID="lblSubDate" runat="server" />
            </div>

            <!-- Back Button -->
            <div class="btn-container">
                <asp:Button ID="btnBack" runat="server" Text="⬅ Back" CssClass="btn-back" OnClick="btnBack_Click" />
            </div>
        </div>
    </form>
</body>
</html>
