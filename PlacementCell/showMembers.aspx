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
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/dataTables.material.min.css" />
    <script src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.11/js/dataTables.material.min.js"></script>
    <script type="text/javascript">
       $(document).ready(function () {
        //$("#loadData").click(function () {
            $("#loader").show();
            $.ajax({
                    url: '/StudentLoginDataService.asmx/getStudentLoginData',
                    method: 'post',
                    dataType: 'json',
                    success: function (data) {
                        $("#tableDiv").show();
                        $("#studentDataTable").DataTable({
                             data: data,
                            'paging': true,
                            'sort': true,
                            'searching': true,
                            'scrollX': '70vw',
                            'columns': [
                               { 'data': 'student_id' },
                               { 'data': 'fname' },
                               { 'data': 'lname' },
                               { 'data': 'branch' },
                               { 'data': 'gender' },
                               { 'data': 'username' },
                               { 'data': 'verified' },
                            ]
                        });
                        $("#loader").hide();
                    }
                });
        //});
       });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form method="post" id="showmembers_form">
        <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
        </script>--%>
        <div class="mdl-card mdl-shadow--6dp" style="width: 100%; align-items: center; align-content: center">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white" style="width: 100%">
                <h2 class="mdl-card__title-text">Members Info</h2>
            </div>
            <br />
            <div style="border: 0px solid black; width: 95%;">
                <br />
                <span id="loader" class="mdl-spinner mdl-js-spinner is-active" style="display: none"></span>
                <center>               
                <div style="width:70vw; border:2px solid #2db1d2; text-align:center; align-items:center;display:none" id="tableDiv"> 
                    <center>
                    <table id="studentDataTable" class="mdl-data-table mdl-shadow--4dp">
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
                    </center>
                </div>
              </center>
            </div>
            <br />
            <br />
            <br />
        </div>
    </form>
</asp:Content>
