<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="CreateInterviewEvent.aspx.cs" Inherits="PlacementCell.CreateInterviewEvent" %>

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
    <%--<script src="//code.jquery.com/jquery-1.10.2.js"></script>--%>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script>
        $(function () {
            var dateToday = new Date();
            var yrRange = (dateToday.getFullYear() - 50) + ":" + (dateToday.getFullYear());
            $("#<%=tb_interviewDate.ClientID%>").datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                //changeYear: true,
                //yearRange: yrRange.toString(),
                minDate: '0',
                maxDate: '1Y',
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form runat="server" method="post">
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
        <div class="mdl-card mdl-shadow--6dp" style="width: 100%;">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                <h2 class="mdl-card__title-text" style="text-align: center">Create Interview Event</h2>
            </div>
            <p style="color:red" class="mdl-typography--body-2-force-preferred-font-color-contrast">Note : Carefully make changes to this section.</p>
            <br />
            <div>
                <div>
                    <label for="ddl_company_names" class="mdl-typography--body-2-force-preferred-font-color-contrast">Select Company :</label>
                    <asp:DropDownList ID="ddl_company_names" runat="server" CssClass="ddstyle"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddl_company_names" ForeColor="Red" Font-Size="Large" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <br>
                <div style="display: block; padding-left: 5px; padding-right: 5px">
                    <label for="ddl_company_names" class="mdl-typography--body-2-force-preferred-font-color-contrast">Interview Date :</label>
                    <div class="mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                        <asp:TextBox ID="tb_interviewDate" runat="server" class="mdl-textfield__input" placeholder="Select Interview Date"></asp:TextBox>
                        <label class="mdl-textfield__label" for="tb_interviewDate"><strong></strong></label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" Font-Bold="True" Font-Size="Large" ControlToValidate="tb_interviewDate"></asp:RequiredFieldValidator>
                </div>
                <br>
                <div>
                    <label for="tb_Description" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="padding-top: 0px">Description(Optional) :</label>
                    <asp:TextBox ID="tb_Description" runat="server" TextMode="MultiLine" Columns="40"></asp:TextBox>
                </div>
                <br>
                <div>
                    <label for="tb_tyMinPercentage" class="mdl-typography--body-2-force-preferred-font-color-contrast">Minimum Third-Year Percentage:</label>
                    <div class="mdl-textfield mdl-js-textfield" style="width: 6%">
                        <asp:TextBox placeholder="eg: 60" class="mdl-textfield__input" ID="tb_tyMinPercentage" runat="server" MaxLength="2" />
                        <label class="mdl-textfield__label" for="sample"></label>
                    </div>
                    <label for="tb_tyMinPercentage" class="mdl-typography--body-2-force-preferred-font-color-contrast">%</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="tb_tyMinPercentage" ForeColor="Red" Font-Size="Large" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ForeColor="Red" runat="server" ErrorMessage="Only Numbers Are Allowed" ControlToValidate="tb_tyMinPercentage" ValidationExpression="\d+" Display="Dynamic"></asp:RegularExpressionValidator><br>
                <div>
                    <label for="tb_hscMinPercentage" class="mdl-typography--body-2-force-preferred-font-color-contrast">Minimum 12th Percentage:</label>
                    <div class="mdl-textfield mdl-js-textfield" style="width: 6%">
                        <asp:TextBox placeholder="eg: 60" class="mdl-textfield__input" ID="tb_hscMinPercentage" runat="server" MaxLength="2" />
                        <label class="mdl-textfield__label" for="sample"></label>
                    </div>
                    <label for="tb_hscMinPercentage" class="mdl-typography--body-2-force-preferred-font-color-contrast">%</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ErrorMessage="*" ControlToValidate="tb_hscMinPercentage" ForeColor="Red" Font-Size="Large"></asp:RequiredFieldValidator>
                </div>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ErrorMessage="Only Numbers Are Allowed" ControlToValidate="tb_hscMinPercentage" ValidationExpression="\d+" Display="Dynamic"></asp:RegularExpressionValidator><br>

                <div>
                    <label for="tb_sscMinPercentage" class="mdl-typography--body-2-force-preferred-font-color-contrast">Minimum 10th Percentage:</label>
                    <div class="mdl-textfield mdl-js-textfield" style="width: 6%">
                        <asp:TextBox placeholder="eg: 60" class="mdl-textfield__input" ID="tb_sscMinPercentage" runat="server" MaxLength="2" />
                        <label class="mdl-textfield__label" for="sample"></label>
                    </div>
                    <label for="tb_sscMinPercentage" class="mdl-typography--body-2-force-preferred-font-color-contrast">%</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="tb_sscMinPercentage" ForeColor="Red" Font-Size="Large" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ForeColor="Red" runat="server" Display="Dynamic" ErrorMessage="Only Numbers Are Allowed" ControlToValidate="tb_sscMinPercentage" ValidationExpression="\d+"></asp:RegularExpressionValidator><br>
                <div>
                    <label for="tb_minNumbersOfBacklogs" class="mdl-typography--body-2-force-preferred-font-color-contrast">Minimum Backlogs Allowed(Numbers):</label>
                    <div class="mdl-textfield mdl-js-textfield" style="width: 6%">
                        <asp:TextBox placeholder="eg: 1" class="mdl-textfield__input" ID="tb_minNumbersOfBacklogs" runat="server" MaxLength="2" />
                        <label class="mdl-textfield__label" for="sample"></label>
                    </div>
                    <label for="tb_sscMinPercentage" class="mdl-typography--body-2-force-preferred-font-color-contrast"><br>Enter 0 if No Backlogs are Allowed..</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="tb_minNumbersOfBacklogs" ForeColor="Red" Font-Size="Large" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ForeColor="Red" runat="server" Display="Dynamic" ErrorMessage="Only Numbers Are Allowed" ControlToValidate="tb_minNumbersOfBacklogs" ValidationExpression="\d+"></asp:RegularExpressionValidator><br>
                <div>
                    <asp:Repeater ID="Repeater_branch" runat="server">
                        <HeaderTemplate>
                            <center>
                                <table cellpadding="10px" style="align-self:center" border="0">
                                <thead>
                                    <tr>
                                        <label class="mdl-typography--body-2-force-preferred-font-color-contrast">Select the Streams for the Interview :</label>
                                    </tr>
                                </thead>
                                    <tbody>
                                    <tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <td>
                                <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="<%# Eval("branch_id") %>">
                                    <input type="checkbox" id="<%# Eval("branch_id") %>" value="<%# Eval("branch_id") %>" name="chkbx_selectedStreams" class="mdl-checkbox__input">
                                    <span class="mdl-checkbox__label"><%# Eval("branch_name") %></span>
                                </label>
                            </td>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tr>
                            </tbody>
                                </table>
                            </center>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <br />
                <div class="mdl-card__actions mdl-card--border">
                    <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                        <ProgressTemplate>
                            <span class="mdl-spinner mdl-js-spinner is-active" id="spinner2"></span>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:Button CssClass="mdl-button mdl-button--raised mdl-color--accent mdl-color-text--white mdl-shadow--8dp" ID="btn_CreateInterViewEvent" runat="server" Text="Create Interview Event" OnClick="btn_CreateInterViewEvent_Click" />
                            <br>
                            <br>
                            <asp:Label ID="Label1" CssClass="mdl-typography--body-2-force-preferred-font-color-contrast" runat="server" Text=""></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>
            <br />
            <br />
        </div>
    </form>
</asp:Content>
