<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="notices.aspx.cs" Inherits="PlacementCell.notices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <center>
        <form runat="server" id="eventCardPage" method="post">
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">--%>  
            <%--<ContentTemplate>--%>
               <asp:Panel ID="Panel1" runat="server">
                   <%--<button class='mdl-button mdl-color-text--accent mdl-js-button mdl-js-ripple-effect' runat='server' onserverclick="deleteEvent()" formmethod='post' formaction='self' name='delete' value=" + noticeID + "> Delete </button>--%>
               </asp:Panel>
            <%--</ContentTemplate>--%>
         <%--</asp:UpdatePanel>--%>
        
         </form>  
    </center>
</asp:Content>
