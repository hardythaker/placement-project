<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="verifyInfo.aspx.cs" Inherits="PlacementCell.verifyInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form method="post" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <script type="text/javascript">
                var pbControl = null;
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_beginRequest(BeginRequestHandler);
                prm.add_endRequest(EndRequestHandler);
                function BeginRequestHandler(sender, args) {
                    pbControl = args.get_postBackElement();  //the control causing the postback
                    $("#<%=LinkButton2.ClientID%>").hide();
                    pbControl.disabled = true;
                }
                function EndRequestHandler(sender, args) {
                    pbControl.disabled = false;
                    $("#<%=LinkButton2.ClientID%>").hide();
                    pbControl = null;
                }
                function hide() {
                    alert("hi");
                }
            </script>
        <%--<center>--%>
        <div class="mdl-card mdl-shadow--6dp" style="width: 100%; align-items:center">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white" style="width:100%">
                <h2 class="mdl-card__title-text">Registration Successfull</h2>
            </div>
            <br />
            <div style="width: 60%">
                <div style='display: inline-flex; vertical-align: central;'>
                    <div class='icon material-icons mdl-color-text--primary' style="font-size: 30px; padding-left:50px">done_all</div>
                    <div style="padding-top:4px"><label style='padding-top: 90px; padding-left: 0px; font-size: 20px' for='tt2' class='mdl-radio__label'>
                        <asp:Label ID="great" runat="server" Text=""></asp:Label>. You Have Successfully Registered With Us <asp:Label ID="but" runat="server" Text=""></asp:Label> Please Check Your Svv Mail Inbox and Click on Activate Your Account link.</label></div>
                </div>
                <br />
                <br />
                <br />
                <div>
                    <label style="font-size: 20px">If You Want to Change the Email ID Click
                        <asp:LinkButton ID="LinkButton1" runat="server">Here</asp:LinkButton>.</label>
                </div>
                <div>

                </div>
                <br />
                <br />
                <div>
                    <asp:Label ID="resend" runat="server" style="font-size: 20px" Text=""></asp:Label>
                    <br />
                    <br />
                    <label style="font-size: 20px">If You have Any Questions or Queries Please <a href="contact.aspx">Contact US.</a> </label>
                </div>
            </div>
            <br />
            <div runat="server" id="hideResendMailBtn">
            <div class="mdl-card__actions mdl-card--border">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                         <%--<button runat="server" onserverclick="btnResendMail_Click" class="mdl-button mdl-button--raised mdl-color--accent mdl-color-text--white mdl-shadow--8dp"><span class="material-icons mdl-color-text--white">email</span> Resend Email</button>--%>
                        <%--<asp:Button ID="Button1" runat="server" CssClass="mdl-button mdl-button--raised mdl-color--accent mdl-color-text--white mdl-shadow--8dp" Text="Resend Mail" OnClick="btnResendMail_Click"/>--%>
                        
                            <asp:LinkButton ID="LinkButton2" CssClass="mdl-button mdl-button--raised mdl-color--accent mdl-color-text--white mdl-shadow--8dp" OnClick="btnResendMail_Click" OnClientClick="hide" runat="server"><span class="material-icons mdl-color-text--white">email</span>Resend Mail</asp:LinkButton>

                            <br />
                         <asp:Label Font-Size="20px" ID="Label1" runat="server" Text=""></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <br />
                        <span class="mdl-spinner mdl-js-spinner is-active" id="spinner2"></span>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <%--<asp:Button CssClass="mdl-button mdl-button--raised mdl-color--accent mdl-shadow--8dp material-icons" ID="btnResendMail" runat="server" Text="emailResend Mail"  OnClick="btnResendMail_Click" />--%>
            </div>
                </div>
        </div>
        <%--</center>--%>
    </form>
</asp:Content>
