﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="PlacementCell.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
            /*background-image: url('http://localhost:50312/images/Thumbnails.jpg');*/
        }

        iframe {
            display: block; /* iframes are inline by default */
            background: #000;
            border: none; /* Reset default border */
            height: 100vh; /* Viewport-relative units */
            width: 100vw;
        }

        .bgc {
            height: 100%;
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <div style="border:double; height:100vh; background-image: url('http://localhost:50312/images/Thumbnails.jpg'); background-repeat:no-repeat; background-size:100vw 100vh">
        <img src="images/somaiya_logo.jpg" />
            <h3>S K Somaiya Degree College Of Arts, Science And Commerce </h3>
        <%--<asp:Image CssClass="bgc" ID="bg" runat="server" src="images/Thumbnails.jpg" />--%>
        <%--<iframe style="" runat="server" id="iFrame_home" draggable="false" oninit="iFrame_home_Init"></iframe>--%>
        <br />
        <br />
        <br />
    </div>
</asp:Content>
