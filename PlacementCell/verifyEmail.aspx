<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="verifyEmail.aspx.cs" Inherits="PlacementCell.verifyEmail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <asp:Label ID="lbl_InvalidToken_attack" runat="server" Text=""></asp:Label>
    <center> 
    <div runat="server" id="ResetDiv" class="mdl-card mdl-shadow--6dp" style="width:75vw; display:none">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                 <h2 class="mdl-card__title-text" style="text-align: center">SuccessFully VeriFied</h2>
            </div>
             <h3>Thank You..!</h3>
             <h4>You Svv Mail ID is SuccessFully Verified..</h4><br/>
             <h3>Please Click Ok To Login and Get Started</h3>
                <div class='mdl-card__actions mdl-card--border'>
                    <a class="mdl-button mdl-button--colored mdl-color--accent mdl-js-button mdl-js-ripple-effect" href="studentLogin.aspx">Okay !</a>    
                </div>    
        
        </div>
        </center>
</asp:Content>
