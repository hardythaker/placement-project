﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="PlacementCell.admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <div class="mdl-card mdl-shadow--6dp" style="width:auto">
       <form id="adminloginform" method="post" runat="server">
            <div class="mdl-card mdl-shadow--6dp" style="width:100%">
                <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                    <h2 class="mdl-card__title-text" style="text-align: center">Admin Login</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">     
                        <asp:TextBox class="mdl-textfield__input" type="text" id="adminusername" runat="server" TextMode="Email"/>
                        <label class="mdl-textfield__label" for="adminusername"><b>Email..</b></label>
                    </div>
                    <asp:RequiredFieldValidator ID="adminusername_tb_validator" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="adminusername" Display="Dynamic"></asp:RequiredFieldValidator>
                    <br />
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                        <asp:TextBox class="mdl-textfield__input" type="text" id="adminpassword" runat="server" TextMode="Password" />
                        <label class="mdl-textfield__label" for="adminpassword"><b>Password..</b></label>                        
                    </div>
                    <asp:RequiredFieldValidator ID="adminpassword_tb_validator" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="adminpassword" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="mdl-card__actions mdl-card--border" style="padding-right:6em">
                    <asp:Button CssClass="mdl-button mdl-button--raised mdl-color--primary mdl-shadow--8dp" ID="btnAdminLogin" runat="server" Text="Login" OnClick="btnAdminLogin_Click" />
                </div>
                <span style="padding-right:6em"><a href="#" class="mdl-color-text--cyan" style="font-size: 14px">Forgot your password?</a>
                <br />
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>               
                    </span>
                <br />
            </div>           
        </form>
    </div>
</asp:Content>
