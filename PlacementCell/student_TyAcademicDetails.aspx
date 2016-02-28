<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="student_TyAcademicDetails.aspx.cs" Inherits="PlacementCell.student_AcademicDetails" %>

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
    <%--<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">--%>
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script>
        function showSpinner() {
            document.getElementById("spinner").style.display = "block";
        }
        function goBack()
        {
            window.history.back();
        }
        $(function () {
            var icons = {
                header: "ui-icon-circle-arrow-e",
                activeHeader: "ui-icon-circle-arrow-s"
            };
            $("#accordion").accordion({
                collapsible: true,
                active: false,
                icons: icons,
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form runat="server" method="post">
        <div class="mdl-card mdl-shadow--6dp" style="width: 100%">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                <h2 class="mdl-card__title-text" style="text-align: center">TY Academic Detail Form</h2>
            </div>
            <br>
            <div id="div_edit" runat="server" style="display: none">
                <div style="padding: 8px 5px 20px 5px">
                    <asp:LinkButton ID="btn_back" OnClientClick="goBack()" CssClass="mdl-button mdl-color--accent mdl-js-button mdl-js-ripple-effect mdl-color-text--white mdl-shadow--8dp" runat="server">
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
            <div style="padding: 5px 5px 8px 5px; display: none; align-items: center" id="spinner">
                <span class="mdl-spinner mdl-js-spinner is-active"></span>
            </div>
            <div style="border: 0px solid">
                <asp:DropDownList ID="listClass" CssClass="ddstyle mdl-typography--font-light" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="listClass" InitialValue="0" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </div>
            <br />
            <div style="border: 0px solid">
                <asp:DropDownList ID="listDivision" CssClass="ddstyle mdl-typography--font-light" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="listDivision" InitialValue="0" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            </div>
            <div style="display: block; padding-left: 5px; padding-right: 5px">
                <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                    <asp:TextBox MaxLength="3" ID="tb_RollNo" runat="server" class="mdl-textfield__input"></asp:TextBox>
                    <label class="mdl-textfield__label" for="tb_RollNo"><strong>Enter Your Roll No.</strong></label>
                </div>
            </div>
            <div style="display: block; padding-left: 5px; padding-right: 5px">
                <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                    <asp:TextBox MaxLength="2" ID="tb_backlogs" runat="server" class="mdl-textfield__input"></asp:TextBox>
                    <label class="mdl-textfield__label" for="tb_backlogs"><strong>Enter No. of live Backlogs(0 if None).</strong></label>
                </div>
            </div>
            <div id="accordion">
                <div class="mdl-color--primary" style="height: 40px; text-align: left">
                    <div style='display: inline-flex; vertical-align: central; padding-left: 20px; padding-top: 8px;'>
                        <div class='icon material-icons mdl-color-text--white'>keyboard_arrow_down</div>
                        <label style='padding-top: 2px; font-size: large' class='mdl-color-text--white mdl-typography--body-2-force-preferred-font-color-contrast'>&nbsp;Sem 1 Details:</label>
                    </div>
                </div>
                <div style="border: 1px solid; height: auto">
                    <br />
                    <div style="display: block; padding-left: 5px; padding-right: 5px">
                        <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                            <asp:TextBox MaxLength="3" ID="tb_sem1Marks" runat="server" class="mdl-textfield__input"></asp:TextBox>
                            <label class="mdl-textfield__label" for="tb_sem1Marks"><strong>Marks Obtained in Sem-1</strong></label>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="tb_sem1Marks" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                            <asp:TextBox MaxLength="3" ID="tb_sem1TotalMarks" runat="server" class="mdl-textfield__input"></asp:TextBox>
                            <label class="mdl-textfield__label" for="tb_sem1TotalMarks"><strong>Out of Marks of Sem-1</strong></label>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="tb_sem1TotalMarks" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="mdl-color--primary" style="height: 40px; text-align: left">
                    <div style='display: inline-flex; vertical-align: central; padding-left: 20px; padding-top: 8px; text-align: left'>
                        <div class='icon material-icons mdl-color-text--white'>keyboard_arrow_down</div>
                        <label style='padding-top: 2px; font-size: large' class='mdl-color-text--white mdl-typography--body-2-force-preferred-font-color-contrast'>&nbsp;Sem 2 Details:</label>
                    </div>
                </div>
                <div style="border: 1px solid; height: auto">
                    <br />
                    <div style="display: block; padding-left: 5px; padding-right: 5px">
                        <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                            <asp:TextBox MaxLength="3" ID="tb_sem2Marks" runat="server" class="mdl-textfield__input"></asp:TextBox>
                            <label class="mdl-textfield__label" for="tb_sem2Marks"><strong>Marks Obtained in Sem-2</strong></label>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="tb_sem2Marks" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                        <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                            <asp:TextBox MaxLength="3" ID="tb_sem2TotalMarks" runat="server" class="mdl-textfield__input"></asp:TextBox>
                            <label class="mdl-textfield__label" for="tb_sem2TotalMarks"><strong>Out of Marks of Sem-2</strong></label>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="tb_sem2TotalMarks" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                    </div>
                </div>
                <div class="mdl-color--primary" style="height: 40px; text-align: left">
                    <div style='display: inline-flex; vertical-align: central; padding-left: 20px; padding-top: 8px; text-align: left'>
                        <div class='icon material-icons mdl-color-text--white'>keyboard_arrow_down</div>
                        <label style='padding-top: 2px; font-size: large' class='mdl-color-text--white mdl-typography--body-2-force-preferred-font-color-contrast'>&nbsp;Sem 3 Details:</label>
                    </div>
                </div>
                <div style="border: 1px solid; height: auto">
                    <br />
                    <div style="display: block; padding-left: 5px; padding-right: 5px">
                        <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                            <asp:TextBox MaxLength="3" ID="tb_sem3Marks" runat="server" class="mdl-textfield__input"></asp:TextBox>
                            <label class="mdl-textfield__label" for="tb_sem3Marks"><strong>Marks Obtained in Sem-3</strong></label>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="tb_sem3Marks" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                        <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                            <asp:TextBox MaxLength="3" ID="tb_sem3TotalMarks" runat="server" class="mdl-textfield__input"></asp:TextBox>
                            <label class="mdl-textfield__label" for="tb_sem3TotalMarks"><strong>Out of Marks of Sem-3</strong></label>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="tb_sem3TotalMarks" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                    </div>
                </div>
                <div class="mdl-color--primary" style="height: 40px; text-align: left">
                    <div style='display: inline-flex; vertical-align: central; padding-left: 20px; padding-top: 8px; text-align: left'>
                        <div class='icon material-icons mdl-color-text--white'>keyboard_arrow_down</div>
                        <label style='padding-top: 2px; font-size: large' class='mdl-color-text--white mdl-typography--body-2-force-preferred-font-color-contrast'>&nbsp;Sem 4 Details:</label>
                    </div>
                </div>
                <div style="border: 1px solid; height: auto">
                    <br />
                    <div style="display: block; padding-left: 5px; padding-right: 5px">
                        <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                            <asp:TextBox MaxLength="3" ID="tb_sem4Marks" runat="server" class="mdl-textfield__input"></asp:TextBox>
                            <label class="mdl-textfield__label" for="tb_sem4Marks"><strong>Marks Obtained in Sem-4</strong></label>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="tb_sem4Marks" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                        <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                            <asp:TextBox MaxLength="3" ID="tb_sem4TotalMarks" runat="server" class="mdl-textfield__input"></asp:TextBox>
                            <label class="mdl-textfield__label" for="tb_sem4TotalMarks"><strong>Out of Marks of Sem-4</strong></label>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="tb_sem4TotalMarks" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                    </div>
                </div>
            </div>
            <br />
            <div runat="server" id="div_save">
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
            <asp:Label ID="lbl_student_TyDetailsStatus" runat="server" Text=""></asp:Label>
            <br />
        </div>
    </form>
</asp:Content>
