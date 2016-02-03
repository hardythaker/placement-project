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
    <iframe style="" runat="server" id="iFrame_showFullEvent" draggable="false" oninit="iFrame_showFullEvent_Init"></iframe>
</asp:Content>
