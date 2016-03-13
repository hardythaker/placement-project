<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangeSvvEmailId.aspx.cs" Inherits="PlacementCell.ChangeSvvEmailId" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form runat="server" method="post">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <%--<script type="text/javascript">
            var pbControl = null;
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(BeginRequestHandler);
            prm.add_endRequest(EndRequestHandler);
            function BeginRequestHandler(sender, args) {
                $("#btn_ChangeSvvMailId").hide()
                pbControl = args.get_postBackElement();  //the control causing the postback 
                pbControl.disabled = true;
            }
            function EndRequestHandler(sender, args) {
                pbControl.disabled = false;
                pbControl = null;
            }
        </script>--%>

        <div class="mdl-card mdl-shadow--6dp" style="width: 100%; align-items: center">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white" style="width: 100%">
                <h2 class="mdl-card__title-text">Registration Successfull</h2>
            </div>
            <br />
            <asp:Label ID="lbl_forAuthentectionFirstTime" runat="server" Text=""></asp:Label>
            <div id="form_content" runat="server">
                <div>
                    <div>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                            <ContentTemplate>
                                <div>
                                    <label for="tb_newSvvMailId">SvvMail ID:</label>
                                    <div class="mdl-textfield mdl-js-textfield">
                                        <asp:TextBox class="mdl-textfield__input" ID="tb_newSvvMailId" OnTextChanged="tb_newSvvMailId_TextChanged" AutoPostBack="true" runat="server" TextMode="Email" placeholder="Enter Your Svv Mail ID..." />
                                        <label class="mdl-textfield__label" for="sample"><b></b></label>
                                    </div>
                                    <div>
                                        <asp:Label ID="lbl_isValid_isInvalid" runat="server" Text=""></asp:Label>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="tb_newSvvMailId" ForeColor="Red" Font-Size="Large" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="tb_newSvvMailId" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                            <ProgressTemplate>
                                <span class="mdl-spinner mdl-js-spinner is-active" id="loader"></span>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                    <div>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Inavlid Svv Mail ID" ValidationExpression="^[A-Za-z0-9](\.?[A-Za-z0-9_-]){0,}@somaiya\.edu" ControlToValidate="tb_newSvvMailId" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div>
                    <div>
                        <label for="tb_newPassword">Password:</label>
                        <div class="mdl-textfield mdl-js-textfield">
                            <asp:TextBox class="mdl-textfield__input" ID="tb_newPassword" runat="server" TextMode="Email" placeholder="Enter New Password or Same..." />
                            <label class="mdl-textfield__label" for="sample"><b></b></label>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="tb_newPassword" ForeColor="Red" Font-Size="Large" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <label for="tb_RenewPassword">Confirm Password:</label>
                        <div class="mdl-textfield mdl-js-textfield">
                            <asp:TextBox class="mdl-textfield__input" ID="tb_RenewPassword" runat="server" TextMode="Email" placeholder="Re-Enter New Password or Same..." />
                            <label class="mdl-textfield__label" for="sample"><b></b></label>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="tb_RenewPassword" ForeColor="Red" Font-Size="Large" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Not Matched" ControlToCompare="tb_newPassword" ControlToValidate="tb_RenewPassword" Display="Dynamic"></asp:CompareValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage='&lt;br/&gt;Password Must be 6-12 Characters Long &lt;br/&gt; With at Least One Numeric, &lt;br/&gt; One Alphabet and One Special Character.' ValidationExpression="(?=^.{6,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+}{&quot;:;'?/>.<,])(?!.*\s).*$" ControlToValidate="tb_newPassword" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <br />
                <div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div>
                                <asp:LinkButton ID="btn_ChangeSvvMailId" CssClass="mdl-button mdl-button--raised mdl-color--accent mdl-color-text--white mdl-shadow--8dp" OnClick="btn_ChangeSvvMailId_Click" runat="server"><span class="material-icons mdl-color-text--white">edit</span>Change Mail</asp:LinkButton>
                            </div>
                            <br />
                            <div>
                                <asp:Label ID="lbl_changeSvvEmailId_Status" runat="server" Text=""></asp:Label>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <br />
                <div>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate>
                            <span class="mdl-spinner mdl-js-spinner is-active" id="loader"></span>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
                <br />
            </div>
        </div>
    </form>
</asp:Content>
