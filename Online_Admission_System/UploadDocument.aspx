<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadDocument.aspx.cs" Inherits="Online_Admission_System.UploadDocument" %>


<!DOCTYPE html>
<html>
<head runat="server">
    <title>Upload Documents</title>
    <style>
        body { font-family: Arial; background: #eef2f3; }
        .form-container {
            width: 450px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.2);
        }
        h2 { text-align: center; }
        .form-group { margin-bottom: 15px; }
        .btn { width: 100%; padding: 10px; border: none; border-radius: 5px; cursor: pointer; }
        .btn-upload { background: #007bff; color: white; }
        .btn-upload:hover { background: #0056b3; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Upload Documents</h2>
            
            <div class="form-group">
                <label>Photo ID:</label>
                <asp:FileUpload ID="fuPhotoId" runat="server" />
            </div>
            
            <div class="form-group">
                <label>Signature:</label>
                <asp:FileUpload ID="fuSignature" runat="server" />
            </div>
            
            <div class="form-group">
                <label>Marksheet:</label>
                <asp:FileUpload ID="fuMarksheet" runat="server" />
            </div>
            
            <div class="d-flex justify-content-center gap-5 mt-3">
                    <asp:Button ID="btnUpload" runat="server" CssClass="btn btn-upload btn-lg" Text="Upload Documents" OnClick="btnUpload_Click" />
                    <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-Secondary btn-lg" OnClick="btnNext_Click" />
            </div>
        </div>
    </form>
</body>
</html>
