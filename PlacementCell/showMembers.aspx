<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="showMembers.aspx.cs" Inherits="PlacementCell.showMembers" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form runat="server" method="post" id="showmembers_form">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <script type="text/javascript">
            var pbControl = null;
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(BeginRequestHandler);
            prm.add_endRequest(EndRequestHandler);
            function BeginRequestHandler(sender, args) {
                componentHandler.upgradeDom();
                $("#loader").show();
                //document.getElementById("#myDiv").innerHTML = "<span id='loader' class='mdl-spinner mdl-js-spinner is-active'></span>";
                //$get("myDiv").innerHTML = "<span id='loader' class='mdl-spinner mdl-js-spinner is-active'></span>";
                pbControl = args.get_postBackElement();  //the control causing the postback 
                pbControl.disabled = true;
                
            }
            function EndRequestHandler(sender, args) {
                $("#loader").hide();
                pbControl.disabled = false;
                pbControl = null;
            }
        </script>
        <div class="mdl-card mdl-shadow--6dp" style="width: 100%; align-items: center">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white" style="width: 100%">
                <h2 class="mdl-card__title-text">Members Info</h2>
            </div>
            <br />
            <div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div style="display: inline-flex; border: solid; padding: 6px 6px 6px 5px">
                            <div>
                                <lable for="ddl_selectMember" class="mdl-typography--body-2-force-preferred-font-color-contrast">Select Member :</lable>
                                <asp:DropDownList AutoPostBack="true" ClientIDMode="Inherit" ID="ddl_selectMember" runat="server" CssClass="mdl-dropdown-menu ddstyle" OnSelectedIndexChanged="ddl_selectMember_SelectedIndexChanged">
                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                    <asp:ListItem Value="1">Students</asp:ListItem>
                                    <asp:ListItem Value="2">Admin</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div>
                                <lable for="ddl_selectBranch" class="mdl-typography--body-2-force-preferred-font-color-contrast">Select Branch :</lable>
                                <asp:DropDownList AutoPostBack="true" ClientID="ddl_select" ID="ddl_selectBranch" runat="server" CssClass="mdl-dropdown-menu ddstyle" OnSelectedIndexChanged="ddl_selectBranch_SelectedIndexChanged">
                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                    <asp:ListItem Value="BSc.IT">Bsc.IT</asp:ListItem>
                                    <asp:ListItem Value="BAF">BAF</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div>
                                <lable for="ddl_selectVerified" class="mdl-typography--body-2-force-preferred-font-color-contrast">Select Member :</lable>
                                <asp:DropDownList AutoPostBack="true" ClientIDMode="Inherit" ID="ddl_selectVerified" runat="server" CssClass="mdl-dropdown-menu ddstyle" OnSelectedIndexChanged="ddl_selectVerified_SelectedIndexChanged">
                                    <asp:ListItem Value="null">--Select--</asp:ListItem>
                                    <asp:ListItem Value="1">Verified</asp:ListItem>
                                    <asp:ListItem Value="0">Not Verified</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <br />
                        <div id="myDiv" style="border: solid;">
                            <span id='loader' style='display:none' class='mdl-spinner mdl-js-spinner is-active'></span>
                        </div>


                        <asp:Label ID="lbl_ifNoStudent" runat="server" Text=""></asp:Label>
<asp:GridView ID="GridView1" runat="server" FooterStyle-BorderStyle="Inset" AllowSorting="True" AutoGenerateDeleteButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <FooterStyle BorderStyle="Inset" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="showAllStudent" TypeName="PlacementCell.DataAccessLayer">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="" Direction="Output" Name="error" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <%--<div style="width: auto" class="mdl-card mdl-shadow--2dp">
                            <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp" id="example">
                                <thead>
                                    <tr>
                                        <th class="mdl-data-table__cell--non-numeric">Sr No.</th>
                                        <%--<th class="mdl-data-table__cell--non-numeric">ID</th>--%>
                                        <%--<th class="mdl-data-table__cell--non-numeric">Name</th>
                                        <th class="mdl-data-table__cell--non-numeric">Branch</th>
                                        <th class="mdl-data-table__cell--non-numeric">Gender</th>
                                        <th class="mdl-data-table__cell--non-numeric">Username</th>
                                        <th class="mdl-data-table__cell--non-numeric">Is Verified</th>
                                        <th class="mdl-data-table__cell--non-numeric">Delete</th>
                                    </tr>
                                </thead>
                                <tbody>--%>
                                    <asp:Panel ID="Panel1" runat="server">
                                        <%--<tr>
                                            <td class='mdl-data-table__cell--non-numeric'> </td>
                                            <td class='mdl-data-table__cell--non-numeric'> </td>
                                            <td class='mdl-data-table__cell--non-numeric'> </td>
                                            <td class='mdl-data-table__cell--non-numeric'> </td>
                                            <td class='mdl-data-table__cell--non-numeric'> </td>
                                            <td class='mdl-data-table__cell--non-numeric'> </td>
                                            <td class='mdl-data-table__cell--non-numeric'> </td>
                                            <td class='mdl-data-table__cell--non-numeric'> </td>
                                        </tr>--%>
                                    </asp:Panel>
                                <%--</tbody>
                            </table>
                        </div>--%>
                        <%--<asp:GridView ID="GridView1" AutoGenerateDeleteButton="true" AutoGenerateColumns="true" runat="server"></asp:GridView>--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <%--<asp:UpdateProgress ID="UpdateProgress1" runat="server"  AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <%--<br>
                        <span class="mdl-spinner mdl-js-spinner is-active" id="spinner1"></span>--%>
                <%--<script type="text/javascript">--%>
                <%--//$(document.getElementById("#loader").)
                            //$('#loader').show();
                            //document.getElementById('#loader').style.display = "block";
                        </script>
                    </ProgressTemplate>
                </asp:UpdateProgress>--%>
            </div>
        </div>
    </form>
</asp:Content>
