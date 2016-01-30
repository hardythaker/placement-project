<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="addNewPage.aspx.cs" Inherits="PlacementCell.addNewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
        .ddl_whereToUpload {
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
            .ddl_whereToUpload:focus {
                 border-color: none;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form runat="server" method="post">
        <center>
            <div class="mdl-card mdl-shadow--6dp" style="width:75vw">
            <br />
                <div style="display:inline">
                    <label for="fileTitle" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size:15px">Title :  </label>
                    <div class="mdl-textfield mdl-js-textfield">   
                        <asp:TextBox Class="mdl-textfield__input" ID="fileTitle" placeholder="Enter Notice Card Title" runat="server"></asp:TextBox>
                        <label class="mdl-textfield__label" for="sample1"></label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" Font-Bold="True" Font-Size="Large" ControlToValidate="fileTitle"></asp:RequiredFieldValidator>
                </div>

                <div style="display:inline">
                    <label for="fileTitle" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size:15px">Description :  </label>
                    <div class="mdl-textfield mdl-js-textfield">   
                        <asp:TextBox Class="mdl-textfield__input" ID="fileDesc" placeholder="Enter Notice Card Description" runat="server"></asp:TextBox>
                        <label class="mdl-textfield__label" for="sample1"></label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" Font-Bold="True" Font-Size="Large" ControlToValidate="fileDesc"></asp:RequiredFieldValidator>
                </div>

                <%--<div style="display:inline">
                    <label class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size:15px">Where To Upload :  </label>
                    <asp:DropDownList CssClass="ddl_whereToUpload mdl-typography--body-2-force-preferred-font-color-contrast" ID="ddl_whereToUpload" runat="server">
                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Home Page</asp:ListItem>
                        <asp:ListItem Value="2">Notice</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <br />--%>


                <div style="display:inline-block">
                    <asp:Button ID="saveUploadedFile" runat="server" Text="Upload" OnClick="saveUploadedFile_Click" />&nbsp;               
                    <asp:FileUpload ID="FileUpload1" CssClass="mdl-typography--body-2-force-preferred-font-color-contrast" runat="server" AllowMultiple="True" ViewStateMode="Enabled" EnableViewState="True" />
                </div>
                <asp:Label ID="Label2" runat="server" Text="" ViewStateMode="Disabled"></asp:Label>
                <br />
                <div>
                    <asp:Button CssClass="mdl-button mdl-button--raised mdl-color--primary mdl-shadow--8dp" ID="btnCreateNewPage" runat="server" Text="Create Page" OnClick="btnCreateNewPage_Click" />
                </div>
                <br />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                <br />
            </div>
            </center>
        <br />
    </form>
</asp:Content>
