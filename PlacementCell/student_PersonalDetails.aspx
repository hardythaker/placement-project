<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="student_PersonalDetails.aspx.cs" Inherits="PlacementCell.student_PersonalDetails" %>

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
            padding-bottom: 3px;
            padding-top: 3px;
            opacity: 0.80;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form method="post" runat="server">
        <div class="mdl-card mdl-shadow--6dp" style="width: 100%">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                <h2 class="mdl-card__title-text" style="text-align: center">Personal Detail Form</h2>
            </div>
            <br />
            <div style="display: block; padding-left: 5px; padding-right: 5px">
                <asp:DropDownList ID="DropDownList1" CssClass="ddstyle mdl-typography--font-light" runat="server">
                    <asp:ListItem Value="0" Selected="True">Mr.</asp:ListItem>
                    <asp:ListItem Value="1">Mrs.</asp:ListItem>
                </asp:DropDownList>
                <%--<label for="tb_firstName" class="mdl-typography--body-2-force-preferred-font-color-contrast">First Name :</label>--%>
                <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                    <asp:TextBox ID="tb_firstName" runat="server" class="mdl-textfield__input"></asp:TextBox>
                    <label class="mdl-textfield__label" for="tb_firstName"><strong>Enter Your First Name</strong></label>
                </div>
                <asp:RequiredFieldValidator ID="tb_firstName_RequiredFieldValidator1" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Large" ControlToValidate="tb_firstName"></asp:RequiredFieldValidator>

                <%--<label for="tb_lastName" class="mdl-typography--body-2-force-preferred-font-color-contrast">Last Name :</label>--%>
                <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                    <asp:TextBox ID="tb_middleName" runat="server" class="mdl-textfield__input"></asp:TextBox>
                    <label class="mdl-textfield__label" for="tb_middleName"><strong>Enter Your Middle Name</strong></label>
                </div>
                <asp:RequiredFieldValidator ID="tb_middleName_RequiredFieldValidator1" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Large" ControlToValidate="tb_middleName"></asp:RequiredFieldValidator>

                <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                    <asp:TextBox ID="tb_lastName" runat="server" class="mdl-textfield__input"></asp:TextBox>
                    <label class="mdl-textfield__label" for="tb_lastName"><strong>Enter Your Last Name</strong></label>
                </div>
                <asp:RequiredFieldValidator ID="tb_lastName_RequiredFieldValidator2" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Large" ControlToValidate="tb_lastName"></asp:RequiredFieldValidator>
            </div>
            <div style="display: block;">
                <label class="mdl-radio  mdl-js-radio mdl-js-ripple-effect" for="rb_option-1">
                    <input type="radio" id="rb_option-1" class="mdl-radio__button" name="options" value="Male" checked>
                    <span class="mdl-radio__label mdl-typography--body-2-force-preferred-font-color-contrast">Male</span>
                </label>
                <label class="mdl-radio  mdl-js-radio mdl-js-ripple-effect" for="rb_option-2">
                    <input type="radio" id="rb_option-2" class="mdl-radio__button" name="options" value="Female">
                    <span class="mdl-radio__label mdl-typography--body-2-force-preferred-font-color-contrast">Female</span>
                </label>
            </div>
            <div style="display: block; padding-left: 5px; padding-right: 5px">
                <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                    <asp:TextBox ID="tb_mobileNumber" runat="server" class="mdl-textfield__input"></asp:TextBox>
                    <label class="mdl-textfield__label" for="tb_mobileNumber"><strong>10 Digit Mobile No.</strong></label>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" Display="Dynamic" Font-Bold="True" Font-Size="Large" ControlToValidate="tb_mobileNumber"></asp:RequiredFieldValidator>
            </div>
            <div>
            </div>
            <br />
            <div>
                <div style="padding: 5px 5px 8px 5px">
                    <asp:LinkButton ID="LinkButton2" CssClass="mdl-button mdl-color--accent mdl-js-button mdl-js-ripple-effect mdl-color-text--white mdl-shadow--8dp" runat="server">
                    <span class="material-icons">check</span>
                        Save & Continue
                    <span class="material-icons">arrow_forward</span>
                    </asp:LinkButton>
                </div>
                <div style="padding: 8px 5px 5px 5px">
                    <asp:LinkButton ID="LinkButton1" CssClass="mdl-button mdl-color--accent mdl-js-button mdl-js-ripple-effect mdl-color-text--white mdl-shadow--8dp" runat="server">
                    <span class="material-icons">check</span>
                        Save&nbsp;
                    </asp:LinkButton>
                </div>
            </div>
            <br />
            <br />
        </div>
    </form>
</asp:Content>
