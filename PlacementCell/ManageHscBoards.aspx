<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="ManageHscBoards.aspx.cs" Inherits="PlacementCell.ManageHscBoards" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" /> <%--datatable css--%>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.1.2/css/buttons.dataTables.min.css" /> <%--datatable button css--%>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.1.2/css/select.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="AdminEditorTools/css/editor.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="AdminEditorTools/js/dataTables.editor.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/select/1.1.2/js/dataTables.select.min.js"></script>
    <script type="text/javascript" src="//cdn.datatables.net/buttons/1.1.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="AdminEditorTools/js/hscBoardManager.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form runat="server">
        <div class="mdl-card mdl-shadow--6dp" style="width:100%;align-items:center">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white" style="width:100%">
                <h2 class="mdl-card__title-text">Manage Hsc Boards</h2>
            </div>
            <br />
                <div style="width:40%">
                    <table id="HscBoardTable" class="display" width="100%">
                        <thead>
                            <tr>
                                <th>Sr no.</th>
                                <th>Board Name</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            <br />
            <br />
            </div>
    </form>
</asp:Content>
