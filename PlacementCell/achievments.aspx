<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="achievments.aspx.cs" Inherits="PlacementCell.achievments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height:100%;
        }
    </style>
    <script type="text/javascript" language="javascript">
        function confirm() {
            if (confirm('Are you sure you want to delete this Achievment ?')) {
                __doPostBack();
            } else {
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <center>
        <form id="achCardPage" runat="server" method="post">
        
        <asp:Panel ID="Panel1" runat="server">
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </asp:Panel>
        </form>
    </center>
</asp:Content>
