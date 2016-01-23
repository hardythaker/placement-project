<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="studentReg.aspx.cs" Inherits="PlacementCell.studentReg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
            height:100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <div class="mdl-card mdl-shadow--6dp" style="margin-top: 15%; width: auto;">
        <form id="adminloginform" method="post" runat="server">
            <div class="mdl-card mdl-shadow--6dp" style="width: 100%">
                <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                    <h2 class="mdl-card__title-text" style="text-align: center">Student SignUp</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                        <asp:TextBox class="mdl-textfield__input" type="text" ID="signup_fname" runat="server" TextMode="Email"/>
                        <label class="mdl-textfield__label" for="signup_username"><b>Enter Your Name...</b></label>
                    </div>                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="signup_fname" Display="Dynamic"></asp:RequiredFieldValidator>
                    &nbsp;
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                        <asp:TextBox class="mdl-textfield__input" type="text" ID="signup_lname" runat="server" TextMode="Email"/>
                        <label class="mdl-textfield__label" for="signup_username"><b>Enter Your Last Name...</b></label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="signup_lname" Display="Dynamic"></asp:RequiredFieldValidator>
                    <br />

                 
                    
                    
                    
                    
                    <br />
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                        <asp:TextBox class="mdl-textfield__input" type="text" ID="signup_emailid" runat="server" TextMode="Email"/>
                        <label class="mdl-textfield__label" for="signup_emailid"><b>Enter SVV mail ID...</b></label>
                    </div>
                    <asp:RequiredFieldValidator ID="adminusername_tb_validator" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="signup_emailid" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="adminusername_tb_regex_validator" ForeColor="Red" runat="server" ErrorMessage='&lt;br/&gt;Invalid Email Id' ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="signup_emailid" Display="Dynamic"></asp:RegularExpressionValidator>
                    <br />
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield-demo">
                        <asp:TextBox class="mdl-textfield__input" type="text" ID="signup_Password" runat="server" TextMode="Password" />
                        <label class="mdl-textfield__label" for="signup_Password"><b>Enter Your Password...</b></label>
                    </div>
                    <%--<!-- Large Tooltip -->
                    <div id="tt2" class="icon material-icons">info</div>
                    <div class="mdl-tooltip" for="tt2">
                        Remember Your Username.

                    </div>--%>
                    <asp:RequiredFieldValidator ID="adminpassword_tb_validator" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="signup_Password" Display="Dynamic" ValidateRequestMode="Inherit"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ErrorMessage='&lt;br/&gt;Password Must be 6-12 Characters Long &lt;br/&gt; With at Least One Numeric, &lt;br/&gt; One Alphabet and One Special Character.' ValidationExpression="(?=^.{6,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+}{&quot;:;'?/>.<,])(?!.*\s).*$" ControlToValidate="signup_Password" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <asp:Button CssClass="mdl-button mdl-button--raised mdl-color--primary mdl-shadow--8dp" ID="btnStudentReg" runat="server" Text="Sign Up" OnClick="btnStudentReg_Click" />
                </div>
                <span>&nbsp;&nbsp;&nbsp;<a href="#" class="mdl-color-text--cyan" style="font-size: 14px">Forgot your password?</a></span>
            </div>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </form>
    </div>
</asp:Content>
