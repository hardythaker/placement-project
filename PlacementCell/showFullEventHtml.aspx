<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="showFullEventHtml.aspx.cs" Inherits="PlacementCell.showFullEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height : 100%;
        }
        iframe {
            display: block; /* iframes are inline by default */
            background: #FFF;
            border: none; /* Reset default border */
            height: 100vh; /* Viewport-relative units */
            width: 100vw;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <div style="width:inherit; overflow: hidden; padding-right:50vw;">
        <iframe style="width:calc(100% + 18px); overflow: hidden;" seamless="seamless"  runat="server" id="iFrame_showFullEvent" draggable="true" oninit="iFrame_showFullEvent_Init"></iframe>
    </div>
    <asp:Panel ID="Panel1" runat="server"></asp:Panel>
</asp:Content>
