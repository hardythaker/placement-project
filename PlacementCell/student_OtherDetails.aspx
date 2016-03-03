<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="student_OtherDetails.aspx.cs" Inherits="PlacementCell.student_OtherDetails" %>

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
                        <a href="student_SSCDetails.aspx" class="mdl-button mdl-color--accent mdl-js-button mdl-js-ripple-effect mdl-color-text--white mdl-shadow--8dp" >
                                <span class="material-icons">arrow_back</span>
                                    Back
                        </a>
                        &nbsp;&nbsp;
                    <asp:LinkButton ID="btn_Edit" OnClick="btn_Edit_Click" CssClass="mdl-button mdl-color--accent mdl-js-button mdl-js-ripple-effect mdl-color-text--white mdl-shadow--8dp" runat="server">
                                <span class="material-icons">mode_edit</span>
                                    Edit&nbsp;
                    </asp:LinkButton>&nbsp;&nbsp;
                            <asp:LinkButton ID="btn_next" OnClick="btn_next_Click" CssClass="mdl-button mdl-color--accent mdl-js-button mdl-js-ripple-effect mdl-color-text--white mdl-shadow--8dp" runat="server">
                                <span class="material-icons">arrow_forward</span>
                                    Finish&nbsp;
                            </asp:LinkButton>
                        <br />
                    </div>
                </div>
                <br />
                <asp:Label ID="lbl_fetchingDataError" runat="server" Text=""></asp:Label>
                <label for="DropDownList_break">Do you Have Any Break in Your Studies :</label>
                <asp:DropDownList OnSelectedIndexChanged="DropDownList_break_SelectedIndexChanged" AutoPostBack="true" ID="DropDownList_break" CssClass="ddstyle mdl-typography--font-light" runat="server">
                    <asp:ListItem Value="empty">-Break--</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" InitialValue="empty" ControlToValidate="DropDownList_break" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <br />
                <div runat="server" id="div_break_info" style="display: none; padding-left: 5px; padding-right: 5px">
                    <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                        <asp:TextBox MaxLength="2" ID="tb_break" runat="server" class="mdl-textfield__input" ></asp:TextBox>
                        <label class="mdl-textfield__label" for="tb_break"><strong>Enter No. Of Years Break</strong></label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13"  Enabled="false" runat="server" ErrorMessage="*" ControlToValidate="tb_break" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Enabled="false" ForeColor="Red" runat="server" ToolTip="Cannot Be Blank" ErrorMessage="Only Numbers Are Allowed between 1 to 19" ControlToValidate="tb_break" ValidationExpression="^[1-9][0-9]*$" Display="Dynamic" EnableTheming="True"></asp:RegularExpressionValidator>
                <br />
                <div style="padding: 5px 5px 8px 5px; display: none; align-items: center" id="spinner">
                    <span class="mdl-spinner mdl-js-spinner is-active"></span>
                </div>
                
                <div runat="server" id="div_Save_Btns" style="padding: 8px 5px 5px 5px; display: inline">
                        <div style="padding: 5px 5px 8px 5px;">
                            <asp:LinkButton OnClientClick="showSpinner()" OnClick="btn_saveAndContinue_Click" ID="btn_saveAndContinue" CssClass="mdl-button mdl-color--accent mdl-js-button mdl-js-ripple-effect mdl-color-text--white mdl-shadow--8dp" runat="server">
                                    <span class="material-icons">check</span>
                                        Save & Finish
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
                <br />
                <asp:Label ID="lbl_saving_status" runat="server" Text=""></asp:Label>
                <br />
                <br />
            </div>
        </div>
    </form>
</asp:Content>
