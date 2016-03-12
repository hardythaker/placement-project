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
            <div runat="server" id="form_content">
                <div>
                    <label for="tb_newSvvMailId">Enter Your SvvMail ID:</label>
                    <div class="mdl-textfield mdl-js-textfield">
                        <asp:TextBox class="mdl-textfield__input" ID="tb_newSvvMailId" runat="server" TextMode="Email" placeholder="Enter Your Svv Mail ID..." />
                        <label class="mdl-textfield__label" for="sample"><b></b></label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="tb_newSvvMailId" ForeColor="Red" Font-Size="Large" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Inavlid Svv Mail ID" ValidationExpression="^[A-Za-z0-9](\.?[A-Za-z0-9_-]){0,}@somaiya\.edu" ControlToValidate="tb_newSvvMailId" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>

                <br />
                <div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div>
                                <asp:Label ID="lbl_isValid_isInvalid" runat="server" Text=""></asp:Label>
                            </div>
                            <div>
                                <asp:LinkButton ID="btn_ChangeSvvMailId" CssClass="mdl-button mdl-button--raised mdl-color--accent mdl-color-text--white mdl-shadow--8dp" OnClick="btn_ChangeSvvMailId_Click" runat="server"><span class="material-icons mdl-color-text--white">edit</span>Change Mail</asp:LinkButton>
                            </div>
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
