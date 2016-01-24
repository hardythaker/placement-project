<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="studentReg.aspx.cs" Inherits="PlacementCell.studentReg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
            height:100%;
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
            <div class="mdl-card mdl-shadow--6dp" style="width: 100%">
                <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                    <h2 class="mdl-card__title-text" style="text-align: center">Student SignUp</h2>
                </div>
                <div class="mdl-card__supporting-text">

                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                        <asp:TextBox class="mdl-textfield__input" type="text" ID="signup_fname" runat="server" MaxLength="25" />
                        <label class="mdl-textfield__label" for="signup_username"><b>Enter Your Name...</b></label>
                    </div>                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="signup_fname" Display="Dynamic"></asp:RequiredFieldValidator>
                    &nbsp;&nbsp;&nbsp;
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                        <asp:TextBox class="mdl-textfield__input" type="text" ID="signup_lname" runat="server" MaxLength="25" />
                        <label class="mdl-textfield__label" for="signup_username"><b>Enter Your Last Name...</b></label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="signup_lname" Display="Dynamic"></asp:RequiredFieldValidator>
                    <br />
                    <div style="width:auto">
                        <asp:DropDownList ID="DropDownList1" CssClass="ddstyle mdl-typography--font-light" runat="server">
                        <asp:ListItem Value="0">--Stream--</asp:ListItem>
                        <asp:ListItem Value="B.Com">B.Com</asp:ListItem>
                        <asp:ListItem Value="BMM">BMM</asp:ListItem>
                        <asp:ListItem Value="BAF">BAF</asp:ListItem>
                        <asp:ListItem Value="BSc.IT">BSc.IT</asp:ListItem>
                        <asp:ListItem Value="BSc.CS">BSc.CS</asp:ListItem>
                        <asp:ListItem Value="B.A">B.A</asp:ListItem>
                        <asp:ListItem Value="BMS">BMS</asp:ListItem>
                    </asp:DropDownList>  
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                   
                        <label class="mdl-radio  mdl-js-radio mdl-js-ripple-effect" for="option-1">
                            <input type="radio" id="option-1" class="mdl-radio__button" name="options" value="Male">
                            <span class="mdl-radio__label">Male</span>
                        </label>
                        <label class="mdl-radio  mdl-js-radio mdl-js-ripple-effect" for="option-2">
                            <input type="radio" id="option-2" class="mdl-radio__button" name="options" value="Female">
                            <span class="mdl-radio__label">Female</span>
                        </label>
                    </div>
                    

                    <br />
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                        <asp:TextBox class="mdl-textfield__input" type="text" ID="signup_emailid" runat="server" TextMode="Email" MaxLength="100" />
                        <label class="mdl-textfield__label" for="signup_emailid"><b>Enter SVV Mail ID...</b></label>
                    </div>
                    <asp:RequiredFieldValidator ID="adminusername_tb_validator" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="signup_emailid" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="adminusername_tb_regex_validator" ForeColor="Red" runat="server" ErrorMessage='&lt;br/&gt;Invalid Email Id' ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="signup_emailid" Display="Dynamic"></asp:RegularExpressionValidator>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                        <asp:TextBox class="mdl-textfield__input" type="text" ID="signup_Password" runat="server" TextMode="Password" />
                        <label class="mdl-textfield__label" for="signup_Password"><b>Enter Your Password...</b></label>
                    </div> 
                    <asp:RequiredFieldValidator ID="adminpassword_tb_validator" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="signup_Password" Display="Dynamic" ValidateRequestMode="Inherit"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ErrorMessage='&lt;br/&gt;Password Must be 6-12 Characters Long &lt;br/&gt; With at Least One Numeric, &lt;br/&gt; One Alphabet and One Special Character.' ValidationExpression="(?=^.{6,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+}{&quot;:;'?/>.<,])(?!.*\s).*$" ControlToValidate="signup_Password" Display="Dynamic"></asp:RegularExpressionValidator>
                    
                    
                    <!--Tooltip -->
                    <div id="tt2" class="icon material-icons mdl-color-text--accent">info</div> <%--info icon will fetch from google server--%>
                        <div class="mdl-tooltip" style="font-size:9px" for="tt2">
                                It Must be 6-12 Characters Long.<br /> 
                                With at Least One Numeric.<br />
                                One Alphabet.<br />
                                And One Special Character.
                        </div>
                    </div>
                
                <div class="mdl-card__actions mdl-card--border">
                    <asp:Button CssClass="mdl-button mdl-button--raised mdl-color--primary mdl-shadow--8dp" ID="btnStudentReg" runat="server" Text="Sign Up" OnClick="btnStudentReg_Click" />
                </div>
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </div>
            
        </form>
    </div>
</asp:Content>
