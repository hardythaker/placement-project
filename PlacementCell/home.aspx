<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="PlacementCell.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       body {
           height:100%;
           margin:0;
       }
iframe {
    display: block;       /* iframes are inline by default */
    background: #000;
    border: none;         /* Reset default border */
    height: 100vh;        /* Viewport-relative units */
    width: 100vw;
}
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <h3> <img src="images/somaiya_logo.jpg" /> S K Somaiya Degree College Of Arts, Science And Commerce </h3>
        <iframe style="" runat="server" id="iFrame_home" draggable="false" oninit="iFrame_home_Init"></iframe>
    <br /><br /><br />
</asp:Content>
