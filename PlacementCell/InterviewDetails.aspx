<%@ Page Title="" EnableEventValidation="false" Language="C#" ClientIDMode="AutoID" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="InterviewDetails.aspx.cs" Inherits="PlacementCell.InterviewDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form method="post" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="mdl-card mdl-shadow--6dp" style="width: 100%;">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                <h2 class="mdl-card__title-text" style="text-align: center">Interviews</h2>
            </div>
            <br />
            <div>
                <center>
                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="mdl-card mdl-shadow--8dp" style="width: 80vw">
                            <div class='mdl-card__title mdl-color--primary mdl-color-text--white'>
                                <h2 class='mdl-card__title-text' style='text-transform: capitalize;'>
                                    <asp:Label ID="lbl_company_name" runat="server" Text='<%# Eval("company_name") %>'></asp:Label>
                                </h2>
                            </div>
                            <div class='mdl-card__supporting-text mdl-typography--body-1-force-preferred-font-color-contrast' style='text-align: left; font-size: 15px'>
                                <br />
                                <div style='text-align: left'>
                                    <b><asp:Label ID="lbl_description" runat="server" Text='<%# Eval("description") %>'></asp:Label></b>
                                </div>
                                <br />
                                <b><u>Details for the Interview :</u></b>
                                <div style="padding-left: 20px">
                                    <div>
                                        <b>
                                            <asp:Label ID="lbl_event_date" runat="server" Text='<%# "Date :"+Convert.ToDateTime(Eval("event_date")).ToString("dd/MMM/yyyy") %>'></asp:Label>
                                        </b>
                                    </div>
                                    <div>
                                        <b>
                                            <asp:Label ID="lbl_min_Ty" runat="server" Text=<%#"Minimum Aggregate of All Sems :"+ Eval("min_ty_per")+" %" %>></asp:Label>
                                        </b>
                                    </div>
                                    <div>
                                        <b>
                                            <asp:Label ID="lbl_min_hsc" runat="server" Text=<%#"Minimum Hsc Percentage : "+ Eval("min_hsc_per")+" %" %>></asp:Label>
                                       </b>
                                    </div>
                                    <div>
                                        <b>
                                            <asp:Label ID="lbl_min_ssc" runat="server" Text=<%#"Minumum SSC Percentage : "+ Eval("min_ssc_per")+" %" %>></asp:Label>
                                            </b>
                                    </div>
                                    <div>
                                        <b>
                                           <asp:Label ID="lbl_backlogs" runat="server" Text='<%#"Allowed Live Backlogs : "+ Eval("backlogs") %>'></asp:Label>
                                        </b>
                                    </div>
                                </div>
                            </div>
                            <div class='mdl-card__actions mdl-card--border'>
                                <div style='text-align: left'>
                                    <asp:HiddenField ID="hf_event_id" runat="server" Value=<%# Eval("id") %>></asp:HiddenField>
                                    <asp:HiddenField ID="hf_intreseted" runat="server" Value=<%# Eval("intrested") %>></asp:HiddenField>
                                    <%--<input type="hidden" value="<%# Eval("id") %>" name="event_id"/>--%>
                                    <asp:Label ID="lbl_already_intrested" runat="server" Text="You are Going To This Interview"></asp:Label>
                                    <asp:Button Text="Yes am Going" class='mdl-button mdl-color--accent mdl-color-text--white mdl-js-button mdl-js-ripple-effect mdl-button--raised' runat='server' ID="btn_intrested" OnClick="btn_Intrested_Click"></asp:Button>
                                    <asp:Label ID="lbl_status" runat="server" Text=""></asp:Label>
                                    <asp:Label ID="Label1" runat="server" Text=<%#Eval("intrested") %>></asp:Label>
                                </div>
                            </div>
                        </div>
                        <br />
                    </ItemTemplate>
                </asp:Repeater>
                </center>
            </div>
        </div>
    </form>
</asp:Content>
