<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="addNewPage.aspx.cs" Inherits="PlacementCell.addNewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <br />
    <br />
    <div style="text-align:left">
        <form runat="server" method="post">
            Enter Title for New Page:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="false" />
            <asp:Button ID="saveUploadedFile" runat="server" Text="Upload" OnClick="saveUploadedFile_Click" />
            <asp:Button ID="Button2" runat="server" Text="Submit" />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </form>
    </div>
</asp:Content>
