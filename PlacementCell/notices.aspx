<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="notices.aspx.cs" Inherits="PlacementCell.notices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
    </style>
    <script type="text/javascript" language="javascript">
     function confirmation() {
           if (confirm('Are you sure you want to delete this Notice ?')) {
            __doPostBack();
           }else{
               return false;
           }
     }
   </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <center>
        <form runat="server" id="eventCardPage" method="post">
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>       
                <asp:Panel ID="Panel1" runat="server">
               </asp:Panel>
         </form>  
    </center>
</asp:Content>
