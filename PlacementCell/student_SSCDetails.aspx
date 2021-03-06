﻿<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="student_SSCDetails.aspx.cs" Inherits="PlacementCell.student_SSCDetails" %>

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
    <script>
        function showSpinner() {
            var a = Page_ClientValidate();
            if (a)
                document.getElementById("spinner").style.display = "block";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form runat="server" method="post">
        <div class="mdl-card mdl-shadow--6dp" style="width: 100%">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                <h2 class="mdl-card__title-text" style="text-align: center">SSC Details</h2>
            </div>
            <br />
            <div>
                <div id="div_edit" runat="server" style="display: none">
                    <div style="padding: 8px 5px 20px 5px">
                        <asp:LinkButton ID="btn_back" OnClick="btn_back_Click" CssClass="mdl-button mdl-color--accent mdl-js-button mdl-js-ripple-effect mdl-color-text--white mdl-shadow--8dp" runat="server">
                                <span class="material-icons">arrow_back</span>
                                    Back
                        </asp:LinkButton>
                        &nbsp;&nbsp;
                    <asp:LinkButton ID="btn_Edit" OnClick="btn_Edit_Click" CssClass="mdl-button mdl-color--accent mdl-js-button mdl-js-ripple-effect mdl-color-text--white mdl-shadow--8dp" runat="server">
                                <span class="material-icons">mode_edit</span>
                                    Edit&nbsp;
                    </asp:LinkButton>&nbsp;&nbsp;
                            <asp:LinkButton ID="btn_next" OnClick="btn_next_Click" CssClass="mdl-button mdl-color--accent mdl-js-button mdl-js-ripple-effect mdl-color-text--white mdl-shadow--8dp" runat="server">
                                <span class="material-icons">arrow_forward</span>
                                    Next&nbsp;
                            </asp:LinkButton>
                        <br />
                    </div>
                </div>
                <asp:Label ID="lbl_fetchingDataError" runat="server" Text=""></asp:Label>
                <div>
                    <asp:DropDownList ID="boardList" CssClass="ddstyle mdl-typography--font-light" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="boardList" InitialValue="0" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <br />
                <div>
                    <asp:DropDownList ID="courseTypeList" CssClass="ddstyle mdl-typography--font-light" runat="server">
                        <asp:ListItem Value="0">--Course Type--</asp:ListItem>
                        <asp:ListItem Value="Part Time">Part Time</asp:ListItem>
                        <asp:ListItem Value="Full Time">Full Time</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="courseTypeList" InitialValue="0" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <br />
                <div style="display: block; padding-left: 5px; padding-right: 5px">
                    <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                        <asp:TextBox MaxLength="3" ID="tb_SscMarks" runat="server" class="mdl-textfield__input"></asp:TextBox>
                        <label class="mdl-textfield__label" for="tb_SscMarks"><strong>Marks Obtained in SSC</strong></label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="tb_SscMarks" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                        <asp:TextBox MaxLength="3" ID="tb_SscTotalMarks" runat="server" class="mdl-textfield__input"></asp:TextBox>
                        <label class="mdl-textfield__label" for="tb_HscTotalMarks"><strong>Out Of Marks of SSC</strong></label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="tb_SscTotalMarks" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ErrorMessage="Only Numbers Are Allowed" ControlToValidate="tb_SscMarks" ValidationExpression="\d+" Display="Dynamic" EnableTheming="True"></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ForeColor="Red" runat="server" ErrorMessage="<br>Only Numbers Are Allowed" ControlToValidate="tb_SscTotalMarks" ValidationExpression="\d+" Display="Dynamic" EnableTheming="True"></asp:RegularExpressionValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red" ErrorMessage="<br>Marks Obtained Cannot Be Grater Than Out OF Marks..." ControlToValidate="tb_SscTotalMarks" ControlToCompare="tb_SscMarks" Display="Dynamic" Operator="GreaterThanEqual"></asp:CompareValidator>
                <div style="padding: 5px 5px 8px 5px; display: none; align-items: center" id="spinner">
                    <span class="mdl-spinner mdl-js-spinner is-active"></span>
                </div>
                <div runat="server" id="div_save_btns" style="display: none">
                    <div>
                        <div style="display: inline-flex">
                            <p class="mdl-typography--body-2-force-preferred-font-color-contrast">SSC % : &nbsp;</p>
                            <asp:Label ID="lbl_SscPer" runat="server" Text="" CssClass="mdl-typography--body-2-force-preferred-font-color-contrast"></asp:Label>
                        </div>
                    </div>
                    <div style="padding: 8px 5px 5px 5px; display: inline">
                        <div style="padding: 5px 5px 8px 5px;">
                            <asp:LinkButton OnClientClick="showSpinner()" OnClick="btn_saveAndContinue_Click" ID="btn_saveAndContinue" CssClass="mdl-button mdl-color--accent mdl-js-button mdl-js-ripple-effect mdl-color-text--white mdl-shadow--8dp" runat="server">
                                    <span class="material-icons">check</span>
                                        Save & Next
                                    <span class="material-icons">arrow_forward</span>
                            </asp:LinkButton>
                        </div>
                        <div style="padding: 8px 5px 5px 5px;">
                            <asp:LinkButton OnClientClick="showSpinner()" ID="btn_save" OnClick="btn_save_Click" CssClass="mdl-button mdl-color--accent mdl-js-button mdl-js-ripple-effect mdl-color-text--white mdl-shadow--8dp" runat="server">
                                    <span class="material-icons">check</span>
                                        Save&nbsp;
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div runat="server" id="div_calculate">
                    <div style="padding: 5px 5px 8px 5px;">
                        <asp:LinkButton OnClientClick="showSpinner()" OnClick="calculateMarks_Click" ID="calculateMarks" CssClass="mdl-button mdl-color--accent mdl-js-button mdl-js-ripple-effect mdl-color-text--white mdl-shadow--8dp" runat="server">
                                    <span class="material-icons">check</span>
                                        Calculate
                        </asp:LinkButton>
                    </div>
                </div>
                <br />
                <asp:Label ID="lbl_saving_status" runat="server" Text=""></asp:Label>
                <br />
                <br />
            </div>
        </div>
    </form>
</asp:Content>
