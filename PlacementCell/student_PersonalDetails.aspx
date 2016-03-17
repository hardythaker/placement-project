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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script>
        function showSpinner() {
            var a = Page_ClientValidate();
            if (a)
                document.getElementById("spinner").style.display = "block";
        }
        $("#<%=btn_saveAndContinue.ClientID%>").click(function () {
            $("spinner").show();
        });
        $(function () {
            var dateToday = new Date();
            var yrRange = (dateToday.getFullYear() - 50) + ":" + (dateToday.getFullYear());
            $("#<%=tb_dob.ClientID%>").datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: yrRange.toString(),
                minDate: '-40Y',
                maxDate: '-15Y',
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form method="post" runat="server">
        <div class="mdl-card mdl-shadow--6dp" style="width: 100%">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                <h2 class="mdl-card__title-text" style="text-align: center">Personal Detail Form (1/4)</h2>
            </div>
            <br />
            <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <script type="text/javascript">
                var pbControl = null;
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_beginRequest(BeginRequestHandler);
                prm.add_endRequest(EndRequestHandler);
                function BeginRequestHandler(sender, args) {
                    componentHandler.upgradeDom();
                    $("#spinner").show();
                    pbControl = args.get_postBackElement();  //the control causing the postback 
                    pbControl.disabled = true;
                }
                function EndRequestHandler(sender, args) {

                    pbControl.disabled = false;
                    pbControl = null;
                }
            </script>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>--%>
            <p class="mdl-typography--subhead-color-contrast">(Note : Student Should Provide Correct Details, as it will be Consider for the Selcetion Process for the Interviews by the TPC & by the Compaines.)</p>
            <div id="div_edit" runat="server" style="display: none">
                <div style="padding: 8px 5px 20px 5px">
                    <asp:LinkButton ID="btn_Edit" OnClick="btn_Edit_Click" CssClass="mdl-button mdl-color--accent mdl-js-button mdl-js-ripple-effect mdl-color-text--white mdl-shadow--8dp" runat="server">
                                <span class="material-icons">mode_edit</span>
                                    Edit&nbsp;
                    </asp:LinkButton>
                    &nbsp;&nbsp;
                            <asp:LinkButton ID="btn_next" OnClick="btn_next_Click" CssClass="mdl-button mdl-color--accent mdl-js-button mdl-js-ripple-effect mdl-color-text--white mdl-shadow--8dp" runat="server">
                                <span class="material-icons">arrow_forward</span>
                                    Graduation&nbsp;
                            </asp:LinkButton>
                </div>
            </div>
            <div style="display: block; padding-left: 5px; padding-right: 5px">
                <asp:DropDownList ID="ddHonorificsList" CssClass="ddstyle mdl-typography--font-light" runat="server">
                    <asp:ListItem Value="Mr.">Mr.</asp:ListItem>
                    <asp:ListItem Value="Ms.">Ms.</asp:ListItem>
                    <asp:ListItem Value="Mrs.">Mrs.</asp:ListItem>
                </asp:DropDownList>
                <%--<label for="tb_firstName" class="mdl-typography--body-2-force-preferred-font-color-contrast">First Name :</label>--%>
                <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                    <asp:TextBox MaxLength="50" ID="tb_firstName" runat="server" class="mdl-textfield__input"></asp:TextBox>
                    <label class="mdl-textfield__label" for="tb_firstName"><strong>Enter Your First Name</strong></label>
                </div>
                <asp:RequiredFieldValidator ID="tb_firstName_RequiredFieldValidator1" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Large" ControlToValidate="tb_firstName"></asp:RequiredFieldValidator>

                <%--<label for="tb_lastName" class="mdl-typography--body-2-force-preferred-font-color-contrast">Last Name :</label>--%>
                <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                    <asp:TextBox MaxLength="50" ID="tb_middleName" runat="server" class="mdl-textfield__input"></asp:TextBox>
                    <label class="mdl-textfield__label" for="tb_middleName"><strong>Enter Your Middle Name</strong></label>
                </div>
                <asp:RequiredFieldValidator ID="tb_middleName_RequiredFieldValidator1" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Large" ControlToValidate="tb_middleName"></asp:RequiredFieldValidator>

                <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                    <asp:TextBox MaxLength="50" ID="tb_lastName" runat="server" class="mdl-textfield__input"></asp:TextBox>
                    <label class="mdl-textfield__label" for="tb_lastName"><strong>Enter Your Last Name</strong></label>
                </div>
                <asp:RequiredFieldValidator ID="tb_lastName_RequiredFieldValidator2" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Large" ControlToValidate="tb_lastName"></asp:RequiredFieldValidator>
            </div>
            <div>
                <div style="display: block; padding-left: 5px; padding-right: 5px">
                    <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                        <asp:TextBox MaxLength="100" ID="tb_emailID" runat="server" class="mdl-textfield__input"></asp:TextBox>
                        <label class="mdl-textfield__label" for="tb_emailID"><strong>Enter Your Email ID</strong></label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Large" ControlToValidate="tb_emailID"></asp:RequiredFieldValidator>
                    <span <%--style="display:inline-flex"--%>>
                        <span id="tt2" class="icon material-icons mdl-color-text--accent">info</span>
                        <%--info icon will fetch from google server--%>
                        <span class="mdl-tooltip" style="font-size: 12px" for="tt2">Enter Your Correct Email ID.
                       <br>
                            Where you want to Companies should contact you.
                        </span>
                    </span>
                </div>
                <div style="display: block;">
                    <label class="mdl-radio  mdl-js-radio mdl-js-ripple-effect" for="rb_gen_option-1">
                        <input type="radio" id="rb_gen_option-1" class="mdl-radio__button" name="gender_options" value="Male" <%=this.genRB =="Male" ? "checked='checked'" : ""%> <%=this.genRBReadOnly == true ? "disabled='disabled'" : ""%> />
                        <span class="mdl-radio__label mdl-typography--body-2-force-preferred-font-color-contrast">Male</span>
                    </label>
                    &nbsp;
                    <label class="mdl-radio  mdl-js-radio mdl-js-ripple-effect" for="rb_gen_option-2">
                        <input type="radio" id="rb_gen_option-2" class="mdl-radio__button" name="gender_options" value="Female" <%=this.genRB =="Female" ? "checked='checked'" : ""%> <%=this.genRBReadOnly == true ? "disabled='disabled'" : ""%> />
                        <span class="mdl-radio__label mdl-typography--body-2-force-preferred-font-color-contrast">Female</span>
                    </label>
                </div>
                <br />
                <div style="display: block;">
                    <label class="mdl-radio  mdl-js-radio mdl-js-ripple-effect" for="rb_status_option-1">
                        <input type="radio" id="rb_status_option-1" class="mdl-radio__button" name="maritial_status_options" value="married" <%=this.mStatusRB =="married" ? "checked='checked'" : ""%> <%=this.mStatusRBReadOnly == true ? "disabled='disabled'" : ""%> />
                        <span class="mdl-radio__label mdl-typography--body-2-force-preferred-font-color-contrast">Married</span>
                    </label>
                    &nbsp;
                    <label class="mdl-radio  mdl-js-radio mdl-js-ripple-effect" for="rb_status_option-2">
                        <input type="radio" id="rb_status_option-2" class="mdl-radio__button" name="maritial_status_options" value="unmarried" <%=this.mStatusRB =="unmarried" ? "checked='checked'" : ""%> <%=this.mStatusRBReadOnly == true ? "disabled='disabled'" : ""%> />
                        <span class="mdl-radio__label mdl-typography--body-2-force-preferred-font-color-contrast">Unmarried</span>
                    </label>
                </div>
                <div style="display: block; padding-left: 5px; padding-right: 5px">
                    <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                        <asp:TextBox ID="tb_mobileNumber" runat="server" class="mdl-textfield__input" TextMode="Phone" MaxLength="10"></asp:TextBox>
                        <label class="mdl-textfield__label" for="tb_mobileNumber"><strong>10 Digit Mobile No.</strong></label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" Font-Bold="True" Font-Size="Large" ControlToValidate="tb_mobileNumber"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid No" ForeColor="Red" Display="Dynamic" ControlToValidate="tb_mobileNumber" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                </div>
                <div style="display: block; padding-left: 5px; padding-right: 5px">
                    <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                        <asp:TextBox ID="tb_dob" runat="server" class="mdl-textfield__input" placeholder="Date Of Birth"></asp:TextBox>
                        <label class="mdl-textfield__label" for="tb_dob"><strong></strong></label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" Font-Bold="True" Font-Size="Large" ControlToValidate="tb_dob"></asp:RequiredFieldValidator>
                </div>
                <br />

                <div runat="server" id="div_save">
                    <div style="padding: 5px 5px 8px 5px; display: none; align-items: center" id="spinner">
                        <span class="mdl-spinner mdl-js-spinner is-active"></span>
                    </div>
                    <div style="padding: 5px 5px 8px 5px;">
                        <asp:LinkButton OnClientClick="showSpinner()" OnClick="btn_saveAndContinue_Click" ID="btn_saveAndContinue" CssClass="mdl-button mdl-color--accent mdl-js-button mdl-js-ripple-effect mdl-color-text--white mdl-shadow--8dp" runat="server">
                                    <span class="material-icons">check</span>
                                        Save & Graduation
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
                <asp:Label ID="lbl_student_PesrsonalDetailsStatus" runat="server" Text=""></asp:Label>
                <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
                <br />
            </div>
        </div>
    </form>
</asp:Content>
