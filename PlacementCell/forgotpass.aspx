<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="forgotpass.aspx.cs" Inherits="PlacementCell.forgotpass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form runat="server" method="post">
        <center>
            <div class="mdl-card mdl-shadow--6dp" style="width:75vw">
                <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                     <h2 class="mdl-card__title-text" style="text-align: center">Forgot Password</h2>
                </div>
                <div style="display: inline; padding-left:5vw; padding-right:5vw;">
                    <label for="lbl_currentPass" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size: 15px">Svv Mail ID :  </label>
                    <div class="mdl-textfield mdl-js-textfield">
                        <asp:TextBox Class="mdl-textfield__input" ID="tb_forgotEmailID" placeholder="Enter Your Svv Mail ID" runat="server" TextMode="Email"></asp:TextBox>
                        <label class="mdl-textfield__label" for="sample1"></label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" Font-Bold="True" Font-Size="Large" ControlToValidate="tb_forgotEmailID"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="adminusername_tb_regex_validator" ForeColor="Red" runat="server" ErrorMessage='&lt;br/&gt;Invalid Email Id&lt;br/&gt;' ValidationExpression="^[a-z0-9](\.?[a-z0-9_-]){0,}@somaiya\.edu" ControlToValidate="tb_forgotEmailID" Display="Dynamic"></asp:RegularExpressionValidator>
                    <br />
                </div>
                <div class='mdl-card__actions mdl-card--border'>
                    <asp:Button ID="btn_forgotPass" runat="server" Text="Request" CssClass="mdl-button mdl-button--accent mdl-button--raised mdl-shadow--6dp" OnClick="btn_forgotPass_Click" />
                    <asp:Label ID="lbl_forgotPassStatus" CssClass="mdl-typography--body-2-force-preferred-font-color-contrast" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>
                    <br />            
                </div>
                <br />
             </div>
          </center>
     </form>
</asp:Content>
