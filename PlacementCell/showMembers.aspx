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
    <script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/dataTables.material.min.css" />
    <script src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.11/js/dataTables.material.min.js"></script>
    <script type="text/javascript">
        function getStudentData() {
            $.ajax({
                url: 'StudentLoginDataService.asmx/getStudentLoginData',
                method: 'post',
                dataType: 'json',
                success: function (data) {
                    var table = $("#studentDataTable").DataTable({
                        data: data,
                        'paging': true,
                        'sort': true,
                        'searching': true,
                        'scrollY': '50vh',
                        "scrollX": true,
                        'scrollCollapse': true,
                        "language": {
                            "lengthMenu": "Display _MENU_ records per page",
                            "zeroRecords": "Nothing found Sorry",
                            //"info": "Showing page _PAGE_ of _PAGES_",
                            "infoEmpty": "No records available",
                            "infoFiltered": "(filtered from _MAX_ total records)"
                        },
                        initComplete: function () {
                            this.api().columns().every( function () {
                                var column = this;
                                var select = $('<select><option value=""></option></select>')
                                    .appendTo( $(column.footer()).empty() )
                                    .on( 'change', function () {
                                        var val = $.fn.dataTable.util.escapeRegex(
                                            $(this).val()
                                        );
 
                                        column
                                            .search( val ? '^'+val+'$' : '', true, false )
                                            .draw();
                                    } );
 
                                column.data().unique().sort().each( function ( d, j ) {
                                    select.append( '<option value="'+d+'">'+d+'</option>' )
                                } );
                            } );
                        },
                        columnsDefs: [{
                            targets: [0, 1, 2, 3, 5, 5, 6],
                            className: 'mdl-data-table__cell--non-numeric'
                        }],
                        columns: [
                            { 'data': 'student_id' },
                            { 'data': 'fname' },
                            { 'data': 'lname' },
                            { 'data': 'branch' },
                            { 'data': 'gender' },
                            { 'data': 'username' },
                            { 'data': 'verified' },
                        ]
                    })
                }
            })
        }
    </script>
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
                $("#<%=btnGetData.ClientID%>").hide();
                pbControl = args.get_postBackElement();  //the control causing the postback 
                pbControl.disabled = true;
            }
            function EndRequestHandler(sender, args) {
                $("#loader").hide();
                $("#<%=btnGetData.ClientID%>").hide();
                $("#tableDiv").show();
                pbControl.disabled = false;
                pbControl = null;
            }
        </script>
        <div class="mdl-card mdl-shadow--6dp" style="width: 100%; align-items: center; align-content: center">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white" style="width: 100%">
                <h2 class="mdl-card__title-text">Members Info</h2>
            </div>
            <br />
            <div style="border: 0px solid black; width: 95%;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <%--<asp:Button ClientIDMode="Inherit" ID="Button1" runat="server" Text="Get Student Data" OnClientClick="getStudentData()" />--%>
                        <asp:LinkButton ID="btnGetData" CssClass="mdl-button mdl-button--raised mdl-color--accent mdl-color-text--white mdl-shadow--8dp" runat="server" OnClientClick="getStudentData()"><span class="material-icons mdl-color-text--white">get_app</span>Student Login Data</asp:LinkButton>
                        <br />
                        <span id="loader" class="mdl-spinner mdl-js-spinner is-active" style="display: none"></span>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <center>
                <div style="width: 80%; border: 2px solid #2db1d2; display: none;" id="tableDiv">
                    <table id="studentDataTable" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
                        <thead>
                            <tr>
                                <th>Student ID</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Branch</th>
                                <th>Gender</th>
                                <th>Svv Mail</th>
                                <th>Is Verified</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Student ID</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Branch</th>
                                <th>Gender</th>
                                <th>Svv Mail</th>
                                <th>Is Verified</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                    </center>
            </div>
            <br />
            <br />
            <br />
        </div>
    </form>
</asp:Content>
