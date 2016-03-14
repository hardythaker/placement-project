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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form runat="server" method="post">
        <div class="mdl-card mdl-shadow--6dp" style="width: 100%;">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                <h2 class="mdl-card__title-text" style="text-align: center">Create Interview Event</h2>
            </div>
            <br />
            <div>
                <div>
                    <label for="ddl_company_names" class="mdl-typography--body-2-force-preferred-font-color-contrast">Select Company :</label>
                    <asp:DropDownList ID="ddl_company_names" runat="server" CssClass="ddstyle"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddl_company_names" ForeColor="Red" Font-Size="Large" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <br>
                <div>
                    <label for="" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="padding-top: 0px">Description(Optional) :</label>
                    <asp:TextBox ID="tb_Description" runat="server" TextMode="MultiLine" Columns="40"></asp:TextBox>
                </div>
                <br>
                    <div>
                        <label for="tb_tyMinPercentage" class="mdl-typography--body-2-force-preferred-font-color-contrast">Minimum Third-Year Percentage:</label>
                        <div class="mdl-textfield mdl-js-textfield" style="width: 6%">
                            <asp:TextBox placeholder="eg: 60" class="mdl-textfield__input" ID="tb_tyMinPercentage" runat="server" MaxLength="3" />
                            <label class="mdl-textfield__label" for="sample"></label>
                        </div>
                        <label for="tb_tyMinPercentage" class="mdl-typography--body-2-force-preferred-font-color-contrast">%</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="tb_tyMinPercentage" ForeColor="Red" Font-Size="Large" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ForeColor="Red" runat="server" ErrorMessage="Only Numbers Are Allowed" ControlToValidate="tb_tyMinPercentage" ValidationExpression="\d+" Display="Dynamic"></asp:RegularExpressionValidator><br>
                    <div>
                        <label for="tb_hscMinPercentage" class="mdl-typography--body-2-force-preferred-font-color-contrast">Minimum 12th Percentage:</label>
                        <div class="mdl-textfield mdl-js-textfield" style="width: 6%">
                            <asp:TextBox placeholder="eg: 60" class="mdl-textfield__input" ID="tb_hscMinPercentage" runat="server" MaxLength="3" />
                            <label class="mdl-textfield__label" for="sample"></label>
                        </div>
                        <label for="tb_hscMinPercentage" class="mdl-typography--body-2-force-preferred-font-color-contrast">%</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ErrorMessage="*" ControlToValidate="tb_hscMinPercentage" ForeColor="Red" Font-Size="Large" ></asp:RequiredFieldValidator>
                    </div>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ErrorMessage="Only Numbers Are Allowed" ControlToValidate="tb_hscMinPercentage" ValidationExpression="\d+" Display="Dynamic"></asp:RegularExpressionValidator><br>

                    <div>
                        <label for="tb_sscMinPercentage" class="mdl-typography--body-2-force-preferred-font-color-contrast">Minimum 10th Percentage:</label>
                        <div class="mdl-textfield mdl-js-textfield" style="width: 6%">
                            <asp:TextBox placeholder="eg: 60" class="mdl-textfield__input" ID="tb_sscMinPercentage" runat="server" MaxLength="3" />
                            <label class="mdl-textfield__label" for="sample"></label>
                        </div>
                        <label for="tb_sscMinPercentage" class="mdl-typography--body-2-force-preferred-font-color-contrast">%</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="tb_sscMinPercentage" ForeColor="Red" Font-Size="Large" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ForeColor="Red" runat="server" Display="Dynamic" ErrorMessage="Only Numbers Are Allowed" ControlToValidate="tb_sscMinPercentage" ValidationExpression="\d+" ></asp:RegularExpressionValidator><br>
                    <div>

                    </div>
            
            </div>
        </div>
    </form>
</asp:Content>
