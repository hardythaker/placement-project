<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="StudentData.aspx.cs" Inherits="PlacementCell.StudentData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.1.2/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.1.2/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    <script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.1.2/js/dataTables.buttons.min.js"></script>
    <script src="//cdn.datatables.net/buttons/1.1.2/js/buttons.colVis.min.js"></script>
    <script src="//cdn.datatables.net/buttons/1.1.2/js/buttons.flash.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script src="//cdn.datatables.net/buttons/1.1.2/js/buttons.html5.min.js"></script>
    <script src="//cdn.datatables.net/buttons/1.1.2/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/select/1.1.2/js/dataTables.select.min.js"></script>
    <%--<script src=""></script>
    <script src=""></script>
    <link rel="" type="" href="" />--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#loader").show();
            $.ajax({
                url: '/getStudentDataService.asmx/getStudentData',
                method: 'post',
                dataType: 'json',
                success: function (data) {
                    $("#tableDiv").show();
                    var t = $('#studentDataTable').DataTable({
                        data: data,
                        select: true,
                        dom: 'Bfrtip',
                        buttons: [
                            'pageLength',
                            {
                                extend: 'colvis',
                                colvis: 'show/hide',
                                collectionLayout: 'fixed two-column',
                                postfixButtons: ['colvisRestore']
                            },
                            {
                                extend: 'copy',
                                text: '<i class="fa fa-clone"></i>&nbsp;CPY',
                                titleAttr: 'Copy',
                                exportOptions: {
                                    columns: [':not(:first-child)', ':visible']
                                }
                            },
                            {
                                extend: 'csv',
                                text: '<i class="fa fa-file-text-o"></i>&nbsp;CSV',
                                titleAttr: 'CSV',
                                exportOptions: {
                                    columns: [':not(:first-child)', ':visible']
                                }
                            },
                            {
                                extend: 'excel',
                                text: '<i class="fa fa-file-excel-o"></i>&nbsp;XLS',
                                titleAttr: 'XLS',
                                exportOptions: {
                                    columns: [':not(:first-child)', ':visible']
                                }
                            },
                            {
                                extend: 'pdf',
                                text: '<i class="fa fa-file-pdf-o"></i>&nbsp;PDF',
                                titleAttr: 'PDF',
                                exportOptions: {
                                    columns: [':not(:first-child)', ':visible']
                                }
                            },
                            {
                                extend: 'print',
                                text: '<i class="fa fa-print"></i>&nbsp;Print',
                                titleAttr: 'Print',
                                exportOptions: {
                                    columns: [':not(:first-child)', ':visible']
                                }

                            },
                            {
                                extend: 'print',
                                text: '<i class="fa fa-hand-o-up"></i>&nbsp;<i class="fa fa-print"></i>&nbsp;Print',
                                titleAttr: 'Print Selected',
                                exportOptions: {
                                    columns: [':not(:first-child)',':visible'],
                                    modifier: {
                                        selected: true
                                    }
                                }
                            },
                        ],
                        language: {
                            buttons: {
                                colvis: 'Show/Hide'
                            }
                        },
                        "scrollX": true,
                        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                        "columnDefs": [
                            {
                                "searchable": false,
                                "orderable": false,
                                "targets": 0
                            }
                        ],
                        "order": [[1, 'asc']],
                        'columns': [
                               { data: null },
                               { 'data': 'fname' },
                               { 'data': 'mname' },
                               { 'data': 'lname' },
                               { 'data': 'email' },
                               { 'data': 'gender' },
                               { 'data': 'maritial' },
                               { 'data': 'mobile' },
                               { 'data': 'dob' },
                               { 'data': 'branch' },
                               { 'data': 'division' },
                               { 'data': 'rollno' },
                               { 'data': 'backlogs' },
                               { 'data': 'break_years' },
                               { 'data': 'hsc_board_name' },
                               { 'data': 'hsc_specialization' },
                               { 'data': 'hsc_courseType' },
                               { 'data': 'ssc_board_name' },
                               { 'data': 'ssc_courseType' },
                               { 'data': 'ssc_percentage' },
                               { 'data': 'hsc_percentage' },
                               { 'data': 'totalAvg' },

                        ],
                    });
                    t.on('order.dt search.dt', function () {
                        t.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
                            cell.innerHTML = i + 1;
                        });
                    }).draw();
                    $("#loader").hide();
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form runat="server">
        <div class="mdl-card mdl-shadow--6dp" style="width: 100%">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                <h2 class="mdl-card__title-text">Student Data</h2>
            </div>
            <br />
            <div>
                <span id="loader" class="mdl-spinner mdl-js-spinner is-active" style="display: none"></span>
                <div style="display: none; padding: 5px" id="tableDiv">
                    <table id="studentDataTable" class="display nowrap hover" width="100%">
                        <thead>
                            <tr>
                                <th>Sr No.</th>
                                <th>fName</th>
                                <th>mName</th>
                                <th>lName</th>
                                <th>Email</th>
                                <th>Gender</th>
                                <th>Maritial</th>
                                <th>Mobile</th>
                                <th>D.O.B</th>
                                <th>Branch</th>
                                <th>Division</th>
                                <th>Roll NO</th>
                                <th>Backlogs</th>
                                <th>Break</th>
                                <th>Hsc Board</th>
                                <th>Hsc Specialization</th>
                                <th>Hsc CourseType</th>
                                <th>Ssc Board</th>
                                <th>Ssc CourseType</th>
                                <th>Ssc %</th>
                                <th>Hsc %</th>
                                <th>Grad. %(Avg.)</th>
                            </tr>
                        </thead>
                        <tfoot>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
