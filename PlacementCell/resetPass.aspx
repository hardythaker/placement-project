<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="resetPass.aspx.cs" Inherits="PlacementCell.resetPass" %>
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
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <script type="text/javascript">
                var pbControl = null;
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_beginRequest(BeginRequestHandler);
                prm.add_endRequest(EndRequestHandler);
                function BeginRequestHandler(sender, args) {
                    pbControl = args.get_postBackElement();  //the control causing the postback 
                    pbControl.disabled = true;
                }
                function EndRequestHandler(sender, args) {
                    $("#spinner").hide();
                    showMessage();
                    pbControl.disabled = false;
                    pbControl = null;
                }
                function showMessage() {
                    alert('Your Password Succesfully Reset...!\n Click Ok to Login');
                    window.location.replace('studentLogin.aspx');
                }
            </script>
         <div runat="server" id="ResetDiv" class="mdl-card mdl-shadow--6dp" style="width:75vw">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                 <h2 class="mdl-card__title-text" style="text-align: center">Reset Password</h2>
            </div>
                <asp:UpdatePanel ID="UpdatePanel_reset" runat="server">
                    <ContentTemplate>
<%--                        <div style="display: inline; padding-left:5vw; padding-right:5vw;">
                            <label for="Reset_Email" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size: 15px">Svv Mail ID :</label>
                            <div class="mdl-textfield mdl-js-textfield">
                                <asp:TextBox Class="mdl-textfield__input" ID="tb_Reset_Email" placeholder="Enter New Password" runat="server" TextMode="Email"></asp:TextBox>
                                <label class="mdl-textfield__label" for="sample1"></label>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" Font-Bold="True" Font-Size="Large" ControlToValidate="tb_Reset_newPass"></asp:RequiredFieldValidator>
                        </div>
                        <asp:RegularExpressionValidator ID="forgotPassEmail_tb_regex_validator" ForeColor="Red" runat="server" ErrorMessage='&lt;br/&gt;Invalid Email Id&lt;br/&gt;' ValidationExpression="^[a-z0-9](\.?[a-z0-9_-]){0,}@somaiya\.edu" ControlToValidate="tb_Reset_Email" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                        <%--<br />--%>
                        <div style="display: inline; padding-left:5vw; padding-right:5vw;">
                            <label for="Reset_newPass" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size: 15px">New Password :</label>
                            <div class="mdl-textfield mdl-js-textfield">
                                <asp:TextBox Class="mdl-textfield__input" ID="tb_Reset_newPass" placeholder="Enter New Password" runat="server" TextMode="Password"></asp:TextBox>
                                <label class="mdl-textfield__label" for="sample1"></label>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" Font-Bold="True" Font-Size="Large" ControlToValidate="tb_Reset_newPass"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div style="display: inline; padding-left:5vw; padding-right:5vw;">
                            <label for="Reset_reNewPass" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size: 15px">Re-Enter New Password :  </label>
                            <div class="mdl-textfield mdl-js-textfield">
                                <asp:TextBox Class="mdl-textfield__input" ID="tb_Reset_reNewPass" placeholder="Confirm New Password" runat="server" TextMode="Password"></asp:TextBox>
                                <label class="mdl-textfield__label" for="sample1"></label>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" Font-Bold="True" Font-Size="Large" ControlToValidate="tb_Reset_reNewPass"></asp:RequiredFieldValidator>
                        </div>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ErrorMessage='&lt;br/&gt;Password Must be 6-12 Characters Long &lt;br/&gt; With at Least One Numeric, &lt;br/&gt; One Alphabet and One Special Character.' ValidationExpression="(?=^.{6,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+}{&quot;:;'?/>.<,])(?!.*\s).*$" Display="Dynamic" ControlToValidate="tb_Reset_newPass"></asp:RegularExpressionValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server"  ForeColor="Red" ErrorMessage='&lt;br/&gt;Passwords did not Matched...' Display="Dynamic" ControlToCompare="tb_Reset_newPass" ControlToValidate="tb_Reset_reNewPass"></asp:CompareValidator>
                        <div class='mdl-card__actions mdl-card--border'>
                            <asp:Button ID="btn_resetPass" runat="server" Text="Reset It" CssClass="mdl-button mdl-button--accent mdl-button--raised mdl-shadow--6dp" OnClick="btn_resetPass_Click1" />
                            <asp:Label ID="lbl_resetPassStatus" CssClass="mdl-typography--body-2-force-preferred-font-color-contrast" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>
                            <br /> 
                        </div>         
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel_reset">
                    <ProgressTemplate>
                        <div id="spinner" class="mdl-spinner mdl-js-spinner is-active"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            <br />
        </div>
            <asp:Label ID="lbl_InvalidToken_attack" runat="server" Text=""></asp:Label>
        </center>
    </form>
</asp:Content>
