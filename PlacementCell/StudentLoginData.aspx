﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="StudentLoginData.aspx.cs" Inherits="PlacementCell.StudentLoginData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
    </style>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.1.2/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.1.2/css/select.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="AdminEditorTools/css/editor.dataTables.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="https://cdn.rawgit.com/vedmack/yadcf/7b37b3142059efc8e2d81c5f6d93d38d81a022bd/jquery.dataTables.yadcf.css" rel="stylesheet" />
   


    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/select/1.1.2/js/dataTables.select.min.js"></script>
    <script type="text/javascript" src="AdminEditorTools/js/dataTables.editor.min.js"></script>
    <script src="//cdn.datatables.net/buttons/1.1.2/js/dataTables.buttons.min.js"></script>
    <script src="//cdn.datatables.net/buttons/1.1.2/js/buttons.colVis.min.js"></script>
    <script src="//cdn.datatables.net/buttons/1.1.2/js/buttons.flash.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script src="//cdn.datatables.net/buttons/1.1.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.rawgit.com/vedmack/yadcf/77b1c8cae2b18c3451ea6811a6f03453ad24d83d/jquery.dataTables.yadcf.js"></script>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script src="//cdn.datatables.net/buttons/1.1.2/js/buttons.print.min.js"></script>
    <%--<script src="//cdn.datatables.net/fixedheader/3.1.1/js/dataTables.fixedHeader.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/fixedheader/3.1.1/css/fixedHeader.dataTables.min.css" />--%>
    
    <script type="text/javascript">
        (function ($) {
            $(document).ready(function () {
                //'use strict';
                //$("#loader").show();
                //$.ajax({
                //    //url: '/StudentLoginDataService.asmx/getStudentLoginData',
                //        url: '/api/StudentLoginDataModel',
                //        method: 'post',
                //        dataType: 'json',
                //        success: function (data) {


                var editor = new $.fn.dataTable.Editor({
                    ajax: '/api/StudentLoginDataModel',
                    table: '#studentDataTable',
                    fields: [
                        {
                            "label": "Verified :",
                            "name": "student_login.verified",
                            type: "select",
                            options: [
                                { label: "0 (Not Verified)", value: "0" },
                                { label: "1 (Verified)", value: "1" }
                            ]
                        }
                    ]
                });


                var t = $("#studentDataTable").DataTable({
                    ajax:{ 
                        url:  '/api/StudentLoginDataModel',
                        type: 'POST'
                    },
                     processing: true,
                    'columns': [
                       { data: null },
                       {
                           data: null,
                           render: function (data, type, row) {
                               return '<b>' + data.student_login.fname + ' ' + data.student_login.lname + '</b>';
                           }
                       },
                       { 'data': 'branch.branch_name' },
                       { 'data': 'student_login.gender' },
                       { 'data': 'student_login.username' },
                       { 'data': 'student_login.verified' }
                    ],
                    select: {
                        style: 'multi',
                        blurable: true,
                    },
                    dom: 'Bfrtip',
                    buttons: [
                        'pageLength',
			            { extend: 'edit', editor: editor },
			            { extend: 'remove', editor: editor },
                        {
                            extend: 'colvis',
                            colvis: 'show/hide',
                            collectionLayout: 'fixed two-column',
                            postfixButtons: ['colvisRestore']
                        },
                        {
                            extend: 'collection',
                            text: 'Export',
                            buttons: [

                                {
                                    extend: 'copy',
                                    text: '<i class="fa fa-clone"></i>&nbsp;CPY',
                                    titleAttr: 'Copy',
                                    exportOptions: {
                                        columns: [':visible']
                                    }
                                },
                                {
                                    extend: 'excel',
                                    text: '<i class="fa fa-file-excel-o"></i>&nbsp;XLS',
                                    titleAttr: 'XLS',
                                    exportOptions: {
                                        columns: [':visible']
                                    }
                                },
                                {
                                    extend: 'csv',
                                    text: '<i class="fa fa-file-text-o"></i>&nbsp;CSV',
                                    titleAttr: 'CSV',
                                    exportOptions: {
                                        columns: [':visible']
                                    }
                                },
                                {
                                    extend: 'pdf',
                                    text: '<i class="fa fa-file-pdf-o"></i>&nbsp;PDF',
                                    titleAttr: 'PDF',
                                    exportOptions: {
                                        columns: [':visible']
                                    }
                                },
                                {
                                    extend: 'print',
                                    text: '<i class="fa fa-print"></i>&nbsp;Print',
                                    titleAttr: 'Print',
                                    exportOptions: {
                                        columns: [':visible']
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
                                }, ]
                        }
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
                        },
                        "loadingRecords": "Please wait - loading...",
                        "processing": "<span id='loader' class='mdl-spinner mdl-js-spinner is-active'></span>"
                    },
                        //"scrollX": '85vw',
                        "lengthmenu": [[10, 25, 50, -1], [10, 25, 50, "all"]],
                        "columndefs": [
                         {
                             "searchable": false,
                             "orderable": false,
                             "targets": 0
                         },
                         { className: "dt-body-left", "targets": [1] }
                        ],
                        "order": [[1, 'asc']],
                });
                //$("#tableDiv").show();
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
                        filter_type: "auto_complete",
                        filter_default_label: "Type to Filter " + header[1],
                    },
                    {
                        column_number: 2,
                        filter_default_label: "Select " + header[2],
                    },
                    {
                        column_number: 3,
                        filter_match_mode: "exact",
                        filter_default_label: "Select " + header[3],
                    },
                    {
                        column_number: 4,
                        filter_type: "auto_complete",
                        filter_default_label: "Type to Filter " + header[4],
                    },
                    {
                        column_number: 5,
                        filter_default_label: "Select Verified",
                    }
                ]);
                t.draw();
              //  }
            });
            // });
        }(jQuery));
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form runat="server">
        <div class="mdl-card mdl-shadow--6dp" style="width: 100%; align-items:center; align-content: center">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white" style="width: 100%">
                <h2 class="mdl-card__title-text">Members Info</h2>
            </div>
            <br />
            <div>
                <br />
                <div id="spinner">
                    <%--<span id="loader" class="mdl-spinner mdl-js-spinner is-active"></span>--%>
                </div>
                <div style="padding-left: 10px; /*display: none;*/ padding-right: 10px;padding-bottom:20px; width: 80vw" id="tableDiv">
                    <table id="studentDataTable" class="display hover" width="100%">
                        <thead>
                            <tr>
                                <th>Sr NO.</th>
                                <th>First Name</th>
                                <th>Branch</th>
                                <th>Gender</th>
                                <th>Svv Mail</th>
                                <th>SvvID Verified</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
