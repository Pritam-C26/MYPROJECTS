<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="finalView.aspx.cs" Inherits="Online_Admission_System.finalView" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Application Summary</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="mb-4 text-center">Application Summary</h2>

            <h4>Application Details</h4>
            <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-bordered"
                AutoGenerateRows="true">
            </asp:DetailsView>

            <h4 class="mt-4">Uploaded Documents</h4>
            <asp:GridView ID="GridViewDocs" runat="server" CssClass="table table-striped" AutoGenerateColumns="false">
                <Columns>
                    
                    <asp:TemplateField HeaderText="Photo ID">
                        <ItemTemplate>
                            <asp:Image ID="imgPhoto" runat="server" ImageUrl='<%# Eval("PhotoIdPath") %>' Width="150px" Height="150px" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Signature">
                        <ItemTemplate>
                            <asp:Image ID="imgSign" runat="server" ImageUrl='<%# Eval("SignaturePath") %>' width="200px" Height="200px"/>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Marksheet">
                        <ItemTemplate>
                            <asp:Image ID="imgMarksheet" runat="server" ImageUrl='<%# Eval("MarksheetPath") %>' Width="300px" Height="400px"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

       <div class="d-flex justify-content-center mt-4">
    <asp:Button 
        ID="btnNext" 
        runat="server" 
        Text="Next ➡️" 
        CssClass="btn btn-primary btn-lg px-5 shadow-sm rounded-pill" 
        OnClick="btnNext_Click" />
</div>

    </form>
</body>
</html>