<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminReg.aspx.cs" Inherits="PlacementCell.adminReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <div class="mdl-card mdl-shadow--6dp" style="width: auto">
        <form id="adminloginform" method="post" runat="server">
            <div class="mdl-card mdl-shadow--6dp" style="width: 100%">
                <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                    <h2 class="mdl-card__title-text" style="text-align: center">Admin SignUp</h2>
                </div>
                <div class="mdl-card__supporting-text">
                   
                     <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                        <asp:TextBox class="mdl-textfield__input" type="text" ID="adminRegUsername" runat="server" TextMode="Email" ViewStateMode="Enabled" />
                        <label class="mdl-textfield__label" for="adminRegUsername"><b>Enter New Mail ID...</b></label>
                    </div>
                   
                    <asp:RequiredFieldValidator ID="adminusername_tb_validator" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="adminRegUsername" Display="Dynamic" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="adminusername_tb_regex_validator" ForeColor="Red" runat="server" ErrorMessage='&lt;br/&gt;Invalid Email Id' ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="adminRegUsername" Display="Dynamic"></asp:RegularExpressionValidator>
                    
                    <br />
                    
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                        <asp:TextBox class="mdl-textfield__input" type="text" ID="adminRegPassword" runat="server" TextMode="Password" />
                        <label class="mdl-textfield__label" for="adminRegPassword"><b>Enter New Password...</b></label>
                    </div>
                   
                     <asp:RequiredFieldValidator ID="adminpassword_tb_validator" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="adminRegPassword" Display="Dynamic" ValidateRequestMode="Inherit" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator>
                    
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                        <asp:TextBox class="mdl-textfield__input" type="text" ID="re_adminRegPassword" runat="server" TextMode="Password" />
                        <label class="mdl-textfield__label" for="re_adminRegPassword"><b>Re-Enter New Password...</b></label>
                    </div>
                   
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="re_adminRegPassword" Display="Dynamic" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ErrorMessage='&lt;br/&gt;Password Must be 6-12 Characters Long &lt;br/&gt; With at Least One Numeric, &lt;br/&gt; One Alphabet and One Special Character.' ValidationExpression="(?=^.{6,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+}{&quot;:;'?/>.<,])(?!.*\s).*$" ControlToValidate="adminRegPassword" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red" ErrorMessage='&lt;br/&gt;Passwords did not Matched...' ControlToCompare="adminRegPassword" ControlToValidate="re_adminRegPassword" Type="String" Display="Dynamic"></asp:CompareValidator>
                   
                     <br />
                   
                     <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                        <asp:TextBox class="mdl-textfield__input" type="text" ID="conformAdminPassword" runat="server" TextMode="Password" />
                        <label class="mdl-textfield__label" for="conformAdminPassword"><b>Enter Your Admin Password...</b></label>
                    </div>
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="conformAdminPassword" Display="Dynamic" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator>
                    
                    <div class="mdl-card__actions mdl-card--border">
                        <asp:Button CssClass="mdl-button mdl-button--raised mdl-color--primary mdl-shadow--8dp" ID="btnAdminReg" runat="server" Text="Create Admin" OnClick="btnAdminReg_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
                    </div>
                    
                    <asp:Label ID="Label1" runat="server" Text="" Font-Bold="True" Font-Size="Medium"></asp:Label>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
