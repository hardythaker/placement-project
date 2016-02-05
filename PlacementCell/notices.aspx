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
               <asp:Panel ID="Panel1" runat="server">
               
<%--                   <div class='demo-card-wide mdl-card mdl-shadow--8dp' style='width:80vw'>
                       <div class='mdl-card__title'>
                           <h1 class='mdl-typography--display-2 mdl-color-text--primary'>" + title + "</h1>
                       </div>
                       <div class='mdl-card__supporting-text mdl-typography--body-1-force-preferred-font-color-contrast' style='text-align:left; font-size:15px'>
                           <b>" + desc + "</b>
                       </div>
                       <div class='mdl-card__actions mdl-card--border'>
                           <div style ='text-align:left;display:inline-block'>
                               <form method='post'>
                                   <button class='mdl-button mdl-color-text--accent mdl-js-button mdl-js-ripple-effect' runat='server' formaction='showFullEventHtml.aspx' name='viewmore' value=" + fileLink + "> View More</button>
                                   <input type='hidden' value=" <%Server.UrlEncode(fileType); %>" name='fileType'>
                                   
                                   <input type='hidden' value=" + title + " name='title'>
                                   
                                   <input type='hidden' value=" + desc + " name='desc'>
                                   
                                   <input type='hidden' value=" + noticeID + " name='noticeID'>
                                   
                                   <input type='hidden' value=" + fileLink + " name='fileLink'>
                                   
                                   <button class='mdl-button mdl-color-text--accent mdl-js-button mdl-js-ripple-effect' runat='server' formaction='addNewPage.aspx?title' name='edit' value=" + noticeID + "> Edit </button>
                                   
                                </form>
                                <button class='mdl-button mdl-color-text--accent mdl-js-button mdl-js-ripple-effect' runat='server' formaction='notices.aspx' onclick='__doPostBack()' name='delete' value=" + noticeID + "> Delete </button>

                           </div>
                       </div>
                   </div>
                   <br/>--%>

               </asp:Panel>
         </form>  
    </center>
</asp:Content>
