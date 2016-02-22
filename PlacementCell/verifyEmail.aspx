<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="verifyEmail.aspx.cs" Inherits="PlacementCell.verifyEmail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <asp:Label ID="lbl_InvalidToken_attack" runat="server" Text=""></asp:Label>
    <center> 
    <div runat="server" id="ResetDiv" class="mdl-card mdl-shadow--6dp" style="width:75vw; display:block">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                 <h2 class="mdl-card__title-text" style="text-align: center">SuccessFully VeriFied</h2>
            </div>
             <h4 class="mdl-typography--body-2-force-preferred-font-color-contrast">Thank You..!</h4>
             <h5 class="mdl-typography--body-2-force-preferred-font-color-contrast">Your Svv Mail ID is SuccessFully Verified..</h5>
             <h5 class="mdl-typography--body-2-force-preferred-font-color-contrast">Please Click Ok To Login and Get Started</h5>
                <div class='mdl-card__actions mdl-card--border'>
                    <a class="mdl-button mdl-button--colored mdl-color--accent mdl-js-button mdl-js-ripple-effect" href="studentLogin.aspx">Okay !</a>    
                </div>    
        
        </div>
        </center>
</asp:Content>
