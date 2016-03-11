<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="StudentData.aspx.cs" Inherits="PlacementCell.StudentData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
    </style>
    
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" /> <%--jquery ui css--%>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.1.2/css/buttons.dataTables.min.css" /> <%--datatable button css--%>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" /> <%--datatable css--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"> <%--icons on the buttons css--%>
   
    
     <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script> <%--js jquery 1.12.0--%>
    
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script> <%--js jquery UI 1.11.4--%>

    <script src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script> <%--js Datatable 1.10.11--%>
    <script src="https://cdn.datatables.net/buttons/1.1.2/js/dataTables.buttons.min.js"></script> <%--js Datatable Buttons 1.1.2--%>
    <script src="//cdn.datatables.net/buttons/1.1.2/js/buttons.colVis.min.js"></script> <%--js Datatable Column visibility 1.1.2--%>
    <script src="//cdn.datatables.net/buttons/1.1.2/js/buttons.flash.min.js"></script> <%--js Datatable flash for the old browsers--%>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script> <%--js Datatable jszip for extracting xls file in old browsers 2.5.0--%>
    <script src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script> <%--js Datatable pdf maker 0.1.18--%>
    <script src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script> <%--js Datatable pdf fonts 0.1.18--%>
    <script src="//cdn.datatables.net/buttons/1.1.2/js/buttons.html5.min.js"></script> <%--js Datatable hml 5 for modern browsers 1.1.2--%>
    <script src="//cdn.datatables.net/buttons/1.1.2/js/buttons.print.min.js"></script> <%--js Datatable print btn 1.1.2--%>
    <script src="https://cdn.datatables.net/select/1.1.2/js/dataTables.select.min.js"></script> <%--js Datatable Selection Functionality 1.1.2--%>
    <script src="https://cdn.rawgit.com/vedmack/yadcf/77b1c8cae2b18c3451ea6811a6f03453ad24d83d/jquery.dataTables.yadcf.js"></script> <%--js yadcf--%>
    <link href="https://cdn.rawgit.com/vedmack/yadcf/7b37b3142059efc8e2d81c5f6d93d38d81a022bd/jquery.dataTables.yadcf.css" rel="stylesheet" /> <%--yadcf css--%>
    <%--<script src=""></script>
    <script src=""></script>
    <link rel="" type="" href="" />--%>
    <script type="text/javascript">
        $(document).ready(function () {
            'use strict';
            $("#loader").show();
            jQuery.extend(jQuery.fn.dataTableExt.oSort, {
                "anti-the-pre": function (a) {
                    return a.replace(/^(Ms\.|Mrs\.|Mr\.) /i, "");
                },

                "anti-the-asc": function (a, b) {
                    return ((a < b) ? -1 : ((a > b) ? 1 : 0));
                },

                "anti-the-desc": function (a, b) {
                    return ((a < b) ? 1 : ((a > b) ? -1 : 0));
                }
            });
            $.ajax({
                url: '/getStudentDataService.asmx/getStudentData',
                method: 'post',
                dataType: 'json',
                success: function (data) {
                    $("#tableDiv").show();
                    var t = $('#studentDataTable').DataTable({
                        data: data,
                        select: {
                            style: 'multi',
                            blurable: true,
                        },
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
                                    columns: [!0, ':visible']
                                }

                            },
                            {
                                extend: 'print',
                                text: '<i class="fa fa-hand-o-up"></i>&nbsp;<i class="fa fa-print"></i>&nbsp;Print',
                                titleAttr: 'Print Selected',
                                exportOptions: {
                                    columns: [':not(:first-child)', ':visible'],
                                    modifier: {
                                        selected: true
                                    }
                                }
                            },
                        ],
                        language: {
                            buttons: {
                                colvis: 'Show/Hide'
                            },
                            select: {
                                rows: {
                                    _: "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b> %d Rows Selected </b>",
                                    0: "",
                                    //1: "Only 1 row selected"
                                }
                            }
                        },
                        //"scrollX": true,
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
                               {
                                   'data': null,
                                   render: function (data, type, row)
                                   {
                                       return '<b>'+ data['fname'] + ' ' + data['mname'] + ' ' + data['lname'] +'</b>';
                                   }
                               },
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
                    var header = [];
                    $('#studentDataTable thead th').each(function () {
                        header.push($(this).text());
                    });
                    yadcf.init(t,
                    [
                        {
                            column_number: 1,
                            column_data_type: "rendered_html",
                            filter_type: "auto_complete"
                        },
                        {
                            column_number: 3,
                            filter_default_label: "Select " + header[3],
                        },
                        {
                            column_number: 4,
                            filter_default_label: "Select " + header[4],
                        },
                        //{
                        //    column_number: 5,
                        //    filter_default_label: "Select " + header[5],
                        //},
                        //{
                        //    column_number: 6,
                        //    filter_default_label: "Select " + header[6],
                        //},
                        {
                            column_number: 7,
                            filter_default_label: "Select " + header[7],
                        },
                        {
                            column_number: 8,
                            filter_default_label: "Select " + header[8],
                        },
                        {
                            column_number: 9,
                            filter_default_label: "Select " + header[9],
                        },
                        {
                            column_number: 10,
                            filter_type: "range_number_slider",
                            filter_plugin_options: { step: 1 }
                            //filter_default_label: "Select " + header[10],
                        },
                        {
                            column_number: 11,
                            //column_number: 19,
                            filter_type: "range_number_slider",
                            filter_plugin_options: { step: 1 }
                            //filter_default_label: "Select " + header[11],
                        },
                        {
                            column_number: 12,
                            filter_default_label: "Select " + header[12],
                        },
                        {
                            column_number: 13,
                            filter_default_label: "Select " + header[13],
                        },
                        {
                            column_number: 14,
                            filter_default_label: "Select " + header[14],
                        },
                        {
                            column_number: 15,
                            filter_default_label: "Select " + header[15],
                        },
                        {
                            column_number: 16,
                            filter_default_label: "Select " + header[16],
                        },
                        {
                            column_number: 17,
                            filter_type: "range_number_slider",
                            ignore_char: '%',
                            filter_plugin_options: { step: 0.01 }
                            //column_data_type: "rendered_html",
                            //html_data_type: "text"
                            //filter_default_label: [0,100],
                        },
                        {
                            column_number: 18,
                            filter_type: "range_number_slider",
                            ignore_char: '%',
                            filter_plugin_options: { step: 0.01 }
                            //filter_default_label: "Select " + header[20],
                        },
                        {
                            column_number: 19,
                            filter_type: "range_number_slider",
                            ignore_char: '%',
                            filter_plugin_options: { step: 0.01 }
                        },
                    ],
                    'footer',
                    {
                        cumulative_filtering: true,
                    }
                );
                    t.draw();
                    $("#loader").hide();
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form runat="server">
        <div class="mdl-card mdl-shadow--6dp" style="width: 100%;">
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
                                <th>Name</th>
                                <%--<th>mName</th>
                                <th>lName</th>--%>
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
                            <tr>
                                <th>Sr No.</th>
                                <th></th>
                                <%--<th></th>
                                <th></th>--%>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
