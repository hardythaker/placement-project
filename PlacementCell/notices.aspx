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
           <asp:Panel ID="Panel1" runat="server">
            <asp:Panel ID="Panel2" runat="server">
                <%--<asp:Button CssClass="mdl-button mdl-button--raised mdl-color--primary mdl-shadow--8dp" ID="btnViewMore" runat="server" OnClick="btnViewMore_Click" Text="View More"></asp:Button>--%>
                <%--<button runat='server' formmethod='get' formaction="showFullEvent.aspx" value=' '></button>--%>
            </asp:Panel>
               <%--<div class="demo-card-wide mdl-card mdl-shadow--8dp" style="width:70vw">
               <div class="mdl-card__title">
                    <h1 class="mdl-typography--display-2 mdl-color-text--primary">
                        TCS
                    </h1>
                </div>
                <div class="mdl-card__supporting-text mdl-typography--body-1-force-preferred-font-color-contrast" style="text-align:left; font-size:15px">
                    <b>
                        TCS Shortlisted Candided. InterView Held on 12/6/2016...
                    </b>
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <div style="text-align:left">
                       <a class="mdl-button mdl-color-text--accent mdl-js-button mdl-js-ripple-effect" href="#">
                         View More
                       </a>
                    </div>
                </div>
             </div>--%>
           </asp:Panel>    
          </form>  
    </center>
</asp:Content>
