<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="studentLogin.aspx.cs" Inherits="PlacementCell.studentLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <div class="mdl-card mdl-shadow--6dp" style="width:auto;">
       <form id="studentLoginForm" method="post" runat="server">
            <div class="mdl-card mdl-shadow--6dp" style="width:100%">
                <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                    <h2 class="mdl-card__title-text" style="text-align: center">Student Login</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">     
                        <asp:TextBox class="mdl-textfield__input" type="text" id="username" runat="server" TextMode="Email"/>
                        <label class="mdl-textfield__label" for="username"><b>Enter Your Svv Mail ID..</b></label>
                    </div>
                    <asp:RequiredFieldValidator ID="username_tb_validator" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="username" Display="Dynamic"></asp:RequiredFieldValidator>
                    <br />
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                        <asp:TextBox class="mdl-textfield__input" type="text" id="password" runat="server" TextMode="Password" />
                        <label class="mdl-textfield__label" for="password"><b>Enter Your Password..</b></label>                        
                    </div>
                    <asp:RequiredFieldValidator ID="password_tb_validator" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="password" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <asp:Button CssClass="mdl-button mdl-button--raised mdl-color--primary mdl-shadow--8dp" ID="btnStudentLogin" runat="server" Text="Login" OnClick="btnStudentLogin_Click" />
                    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="studentReg.aspx">Signup
                    </a>
                </div>
                <br />
                <span>&nbsp;&nbsp;&nbsp;<a href="#" class="mdl-color-text--cyan" style="font-size: 14px">Forgot your password?</a></span>
                <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                <br />
            </div>           
        </form>
    </div>
</asp:Content>
