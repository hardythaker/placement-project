﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="adminReg.aspx.cs" Inherits="PlacementCell.adminReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form id="adminloginform" method="post" runat="server">
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
                    pbControl.disabled = false;
                    pbControl = null;
                }
            </script>
        <div class="mdl-card mdl-shadow--6dp" style="width: 75vw;">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                <h2 class="mdl-card__title-text" style="text-align: center">Admin SignUp</h2>
            </div>

            <div style="padding-left: 5vw; padding-right: 5vw;">
                        <div style="display:inline-block; /*border: solid; */padding-left: 5vw; padding-right: 5vw;">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <label for="lbl_adminRegUsername" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size: 15px;">Svv Mail ID :  </label>
                                    <div class="mdl-textfield mdl-js-textfield">
                                        <asp:TextBox class="mdl-textfield__input" AutoPostBack="true" ID="adminRegUsername" runat="server" OnTextChanged="adminRegUsername_TextChanged" TextMode="Email" ViewStateMode="Enabled" Placeholder="Enter Svv MailId of New Admin" />
                                        <label class="mdl-textfield__label" for="sample1"></label>
                                    </div>
                                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                            <asp:RequiredFieldValidator ID="adminusername_tb_validator" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="adminRegUsername" Display="Dynamic" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="UpdatePanel2">
                                <ProgressTemplate>
                                    <span class="mdl-spinner mdl-js-spinner is-active" id="spinner2"></span>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </div>
                        <asp:RegularExpressionValidator ID="adminusername_tb_regex_validator" EnableViewState="true" ForeColor="Red" runat="server" ErrorMessage='&lt;br/&gt;Invalid Email Id' ValidationExpression="^[a-z0-9](\.?[a-z0-9_-]){0,}@somaiya\.edu" ControlToValidate="adminRegUsername" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <%--<asp:CustomValidator ID="CustomValidator1" OnServerValidate="CustomValidator1_ServerValidate" ControlToValidate="adminRegUsername"  runat="server" ErrorMessage="" Display="Dynamic" Font-Strikeout="False" Font-Bold="True"></asp:CustomValidator>--%>
                        
                        <div style="display: inline; padding-left: 5vw; padding-right: 5vw;">
                            <label for="lbl_adminRegPassword" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size: 15px">Password :  </label>
                            <div class="mdl-textfield mdl-js-textfield">
                                <asp:TextBox class="mdl-textfield__input" type="text" ID="adminRegPassword" runat="server" TextMode="Password" placeholder="Enter New Password..." />
                                <label class="mdl-textfield__label" for="sample1"></label>
                            </div>
                            <asp:RequiredFieldValidator ID="adminpassword_tb_validator" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="adminRegPassword" Display="Dynamic" ValidateRequestMode="Inherit" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div style="display: inline; padding-left: 5vw; padding-right: 5vw;">
                            <label for="lbl_re_adminRegPassword" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size: 15px">Re-Password :  </label>
                            <div class="mdl-textfield mdl-js-textfield">
                                <asp:TextBox class="mdl-textfield__input" type="text" ID="re_adminRegPassword" runat="server" TextMode="Password" placeholder="Re-Enter New Password..." />
                                <label class="mdl-textfield__label" for="sample1"></label>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="re_adminRegPassword" Display="Dynamic" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div style="display: inline; padding-left: 5vw; padding-right: 5vw;">
                            <label for="lbl_conformAdminPassword" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size: 15px">Current Password :  </label>
                            <div class="mdl-textfield mdl-js-textfield">
                                <asp:TextBox class="mdl-textfield__input" type="text" ID="conformAdminPassword" runat="server" TextMode="Password" placeholder="Enter Admin Password..." />
                                <label class="mdl-textfield__label" for="sample1"></label>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="conformAdminPassword" Display="Dynamic" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator>
                        </div>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ErrorMessage='&lt;br/&gt;Password Must be 6-12 Characters Long &lt;br/&gt; With at Least One Numeric, &lt;br/&gt; One Alphabet and One Special Character.' ValidationExpression="(?=^.{6,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+}{&quot;:;'?/>.<,])(?!.*\s).*$" ControlToValidate="adminRegPassword" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red" ErrorMessage='&lt;br/&gt;Passwords did not Matched...' ControlToCompare="adminRegPassword" ControlToValidate="re_adminRegPassword" Type="String" Display="Dynamic"></asp:CompareValidator>
                        <div class="mdl-card__actions mdl-card--border">
                            <asp:Button CssClass="mdl-button mdl-button--raised mdl-color--primary mdl-shadow--8dp" ID="btnAdminReg" runat="server" Text="Create Admin" OnClick="btnAdminReg_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
                        </div>
                        <asp:Label ID="Label1" runat="server" Text="" Font-Bold="True" Font-Size="Medium"></asp:Label>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div style="padding-right:80px;padding-bottom:15px;padding-top:0px;">
                    <asp:UpdateProgress ID="UpdateProgress2" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate>
                            <div class="mdl-spinner mdl-js-spinner is-active"></div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
            </div>
        </div>
        </center>
    </form>
</asp:Content>
