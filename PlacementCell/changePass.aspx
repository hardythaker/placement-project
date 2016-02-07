<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="changePass.aspx.cs" Inherits="PlacementCell.WebForm1" %>

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
                 <h2 class="mdl-card__title-text" style="text-align: center">Change Password</h2>
            </div>
            <div style="display: inline; padding-left:5vw; padding-right:5vw;">
                <label for="lbl_currentPass" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size: 15px">Password :  </label>
                <div class="mdl-textfield mdl-js-textfield">
                    <asp:TextBox Class="mdl-textfield__input" ID="tb_currentPass" placeholder="Old Password" runat="server" TextMode="Password"></asp:TextBox>
                    <label class="mdl-textfield__label" for="sample1"></label>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" Font-Bold="True" Font-Size="Large" ControlToValidate="tb_currentPass"></asp:RequiredFieldValidator>
            </div>
            <div style="display: inline; padding-left:5vw; padding-right:5vw;">
                <label for="lbl_newPass" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size: 15px">New Password :  </label>
                <div class="mdl-textfield mdl-js-textfield">
                    <asp:TextBox Class="mdl-textfield__input" ID="tb_newPass" placeholder="Enter New Password" runat="server" TextMode="Password"></asp:TextBox>
                    <label class="mdl-textfield__label" for="sample1"></label>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" Font-Bold="True" Font-Size="Large" ControlToValidate="tb_newPass"></asp:RequiredFieldValidator>
            </div>
            <div style="display: inline; padding-left:5vw; padding-right:5vw;">
                <label for="lbl_reNewPass" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size: 15px">Re-Enter New Password :  </label>
                <div class="mdl-textfield mdl-js-textfield">
                    <asp:TextBox Class="mdl-textfield__input" ID="tb_reNewPass" placeholder="Confirm New Password" runat="server" TextMode="Password"></asp:TextBox>
                    <label class="mdl-textfield__label" for="sample1"></label>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" Font-Bold="True" Font-Size="Large" ControlToValidate="tb_reNewPass"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ErrorMessage='&lt;br/&gt;Password Must be 6-12 Characters Long &lt;br/&gt; With at Least One Numeric, &lt;br/&gt; One Alphabet and One Special Character.' ValidationExpression="(?=^.{6,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+}{&quot;:;'?/>.<,])(?!.*\s).*$" Display="Dynamic" ControlToValidate="tb_newPass"></asp:RegularExpressionValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server"  ForeColor="Red" ErrorMessage='&lt;br/&gt;Passwords did not Matched...' Display="Dynamic" ControlToCompare="tb_newPass" ControlToValidate="tb_reNewPass"></asp:CompareValidator>

            </div>
            <div>
                <asp:Button ID="btn_changePass" runat="server" Text="Change It" CssClass="mdl-button mdl-button--accent mdl-button--raised mdl-shadow--6dp" OnClick="btn_changePass_Click" />
                
                <asp:Label ID="lbl_changePassStatus" CssClass="mdl-typography--body-2-force-preferred-font-color-contrast" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />            
            </div>
            <br />
        </div>
            </center>
    </form>
</asp:Content>
