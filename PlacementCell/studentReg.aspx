<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="studentReg.aspx.cs" Inherits="PlacementCell.studentReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }

        .ddstyle {
            font-size: medium;
            width: auto;
            color: grey;
            border-top: 0;
            border-left: 0;
            border-right: 0;
            border-bottom: 0.5px thin lightgray;
            border-bottom-color: lightgray;
            border-color: ActiveBorder none;
        }

            .ddstyle:focus {
                border-color: none;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <div class="mdl-card mdl-shadow--6dp" style="width: auto;">
        <form id="adminloginform" method="post" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <script type="text/javascript">
                var pbControl = null;
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_beginRequest(BeginRequestHandler);
                prm.add_endRequest(EndRequestHandler);
                function BeginRequestHandler(sender, args) {
                    $("#spinner2").show();
                    pbControl = args.get_postBackElement();  //the control causing the postback 
                    pbControl.disabled = true;
                }
                function EndRequestHandler(sender, args) {
                    
                    pbControl.disabled = false;
                    pbControl = null;
                }
                    //function showMessage() {
                    //    alert('You Succesfully Registered...!\n Click Ok to Login');
                    //    window.location.replace('studentLogin.aspx');
                    //}
            </script>
            <div class="mdl-card mdl-shadow--6dp" style="width: 100%">
                <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                    <h2 class="mdl-card__title-text" style="text-align: center">Student SignUp</h2>
                </div>
                <%--<div class="mdl-card__supporting-text">--%>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        SVV Mail ID : 
                            <div class="mdl-textfield mdl-js-textfield">
                                <asp:TextBox OnTextChanged="signup_emailid_TextChanged" AutoPostBack="true" placeholder="Enter Your SVV Mail ID..." class="mdl-textfield__input" type="text" ID="signup_emailid" runat="server" TextMode="Email" MaxLength="100" />
                                <label class="mdl-textfield__label" for="sample"></label>
                            </div>
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                        <asp:RequiredFieldValidator ID="adminusername_tb_validator" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="signup_emailid" Display="Dynamic" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <span class="mdl-spinner mdl-js-spinner is-active" id="spinner1"></span>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <asp:RegularExpressionValidator ID="stdusername_tb_regex_validator" ForeColor="Red" runat="server" ErrorMessage='&lt;br/&gt;Invalid Email Id' ValidationExpression="^[A-Za-z0-9](\.?[A-Za-z0-9_-]){0,}@somaiya\.edu" ControlToValidate="signup_emailid" Display="Dynamic"></asp:RegularExpressionValidator>
                <br />

                <div style="display: inline;">
                    First Name :
                    <div class="mdl-textfield mdl-js-textfield">
                        <asp:TextBox class="mdl-textfield__input" type="text" ID="signup_fname" runat="server" MaxLength="25" placeholder="Enter Your Name..." />
                        <label class="mdl-textfield__label" for="sample"><b></b></label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="signup_fname" Display="Dynamic" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator>
                </div>

                <div style="display: inline;">
                    Last Name :
                    <div class="mdl-textfield mdl-js-textfield">
                        <asp:TextBox class="mdl-textfield__input" type="text" ID="signup_lname" runat="server" MaxLength="25" placeholder="Enter Your Last Name..." />
                        <label class="mdl-textfield__label" for="sample"><b></b></label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="signup_lname" Display="Dynamic" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator>
                </div>
                <br />


                <div style="display: inline;">
                    <div style="width: auto">
                        <asp:DropDownList ID="DropDownList1" CssClass="ddstyle mdl-typography--font-light" runat="server">
                            <asp:ListItem Value="0" Selected="True">--Stream--</asp:ListItem>
                            <asp:ListItem Value="1">B.Com</asp:ListItem>
                            <asp:ListItem Value="2">BMM</asp:ListItem>
                            <asp:ListItem Value="3">BAF</asp:ListItem>
                            <asp:ListItem Value="4">BSc.IT</asp:ListItem>
                            <asp:ListItem Value="5">BSc.CS</asp:ListItem>
                            <asp:ListItem Value="6">B.A</asp:ListItem>
                            <asp:ListItem Value="7">BMS</asp:ListItem>
                            <asp:ListItem Value="8">BBI</asp:ListItem>
                            <asp:ListItem Value="9">BFM</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                   
                            <label class="mdl-radio  mdl-js-radio mdl-js-ripple-effect" for="option-1">
                                <input type="radio" id="option-1" class="mdl-radio__button" name="options" value="Male" checked>
                                <span class="mdl-radio__label">Male</span>
                            </label>
                        <label class="mdl-radio  mdl-js-radio mdl-js-ripple-effect" for="option-2">
                            <input type="radio" id="option-2" class="mdl-radio__button" name="options" value="Female">
                            <span class="mdl-radio__label">Female</span>
                        </label>
                    </div>
                </div>
                <br />
                <div style="padding-right:100px">
                    <div id="tt2" class="icon material-icons mdl-color-text--accent">help_outline</div><%--info icon will fetch from google server--%>
                    <div class="mdl-tooltip" style="font-size: 9px" for="tt2">
                        It Must be 6-12 Characters Long. 
                                    With at Least One Numeric.
                                    One Alphabet.
                                    And One Special Character.
                    </div>
                </div>
                <div style="display: inline;">
                    Password :
                        <div class="mdl-textfield mdl-js-textfield">
                            <asp:TextBox class="mdl-textfield__input" type="text" ID="signup_password" runat="server" TextMode="Password" placeholder="Enter Your Password..." />
                            <label class="mdl-textfield__label" for="sample"><b></b></label>
                        </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="signup_password" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator>
                </div>
                <div style="display: inline;">
                    Conform Password :
                    <div class="mdl-textfield mdl-js-textfield">
                        <asp:TextBox class="mdl-textfield__input" type="text" ID="re_signup_password" runat="server" TextMode="Password" placeholder="Re-Enter Your Password..." />
                        <label class="mdl-textfield__label" for="sample"><b></b></label>
                    </div>
                    <asp:RequiredFieldValidator ID="adminpassword_tb_validator" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="re_signup_Password" Display="Dynamic" ValidateRequestMode="Inherit" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ErrorMessage='&lt;br/&gt;Password Must be 6-12 Characters Long &lt;br/&gt; With at Least One Numeric, &lt;br/&gt; One Alphabet and One Special Character.' ValidationExpression="(?=^.{6,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+}{&quot;:;'?/>.<,])(?!.*\s).*$" ControlToValidate="signup_Password" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red" ErrorMessage='&lt;br/&gt;Passwords did not Matched...' ControlToCompare="signup_password" ControlToValidate="re_signup_password" Display="Dynamic"></asp:CompareValidator>
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <input id="hd" type="hidden" runat="server" value=""/>
                            <asp:Button CssClass="mdl-button mdl-button--raised mdl-color--primary mdl-shadow--8dp" ID="btnStudentReg" runat="server" Text="Sign Up" OnClick="btnStudentReg_Click" />
                            <br />
                            <br />
                            <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
                            <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                        <ProgressTemplate>
                            <span class="mdl-spinner mdl-js-spinner is-active" id="spinner2"></span>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </div>
        </form>
    </div>
</asp:Content>
