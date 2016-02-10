<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="forgotpass.aspx.cs" Inherits="PlacementCell.forgotpass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
    </style>
    <%--<script type = "text/javascript">
        function DisableButton() {
            document.getElementById("<%=btn_forgotPass.ClientID %>").disabled = true;
        }
        window.onbeforeunload = DisableButton;
    </script>--%>
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
                    pbControl.disabled = false;
                    pbControl = null;
                }
            </script>
        
                <div class="mdl-card mdl-shadow--6dp" style="width:75vw">
                <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                     <h2 class="mdl-card__title-text" style="text-align: center">Request for Reset Password</h2>
                </div>
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div style="display: inline; padding-left:5vw; padding-right:5vw;">
                            <label for="tb_forgotEmailID" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size: 15px">Svv Mail ID :  </label>
                            <div class="mdl-textfield mdl-js-textfield">
                                <asp:TextBox CssClass="mdl-textfield__input" OnTextChanged="tb_forgotEmailID_TextChanged" ID="tb_forgotEmailID" placeholder="Enter Your Svv Mail ID" runat="server" TextMode="Email" EnableViewState="False" ViewStateMode="Disabled"></asp:TextBox>
                                <label class="mdl-textfield__label" for="sample1"></label>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" Font-Bold="True" Font-Size="Large" ControlToValidate="tb_forgotEmailID"></asp:RequiredFieldValidator>
                            <br />
                        </div>
                        <asp:RegularExpressionValidator ID="forgotPassEmail_tb_regex_validator" ForeColor="Red" runat="server" ErrorMessage='&lt;br/&gt;Invalid Email Id&lt;br/&gt;' ValidationExpression="^[a-z0-9](\.?[a-z0-9_-]){0,}@somaiya\.edu" ControlToValidate="tb_forgotEmailID" Display="Dynamic"></asp:RegularExpressionValidator>
                        <div class='mdl-card__actions mdl-card--border'>
                            <asp:Button ID="btn_forgotPass" runat="server" Text="Request" CssClass="mdl-button mdl-button--accent mdl-button--raised mdl-shadow--6dp" OnClick="btn_forgotPass_Click"/>
                            <br />
                            <asp:Label ID="lbl_forgotPassStatus" CssClass="mdl-typography--body-2-force-preferred-font-color-contrast" runat="server" Text="" Font-Bold="True" ForeColor="Red" EnableViewState="False" ViewStateMode="Disabled"></asp:Label>            
                        </div>
                   </ContentTemplate>
                   <Triggers>
                       <asp:AsyncPostBackTrigger ControlID="tb_forgotEmailID" EventName="TextChanged"/>
                   </Triggers>
                </asp:UpdatePanel>  
                <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <div class="mdl-spinner mdl-js-spinner is-active" Id="spinner" runat="server"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <br />
             </div>
          </center>
     </form>
</asp:Content>
