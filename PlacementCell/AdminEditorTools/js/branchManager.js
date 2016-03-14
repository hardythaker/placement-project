(function ($) {
    $(document).ready(function () {
        var editor = new $.fn.dataTable.Editor({
            ajax: '/api/BranchManager',
            table: '#BranchTable',
            fields: [
                {
                    'label': "Branch Name :",
                    'name': 'branch_name'
                }
            ]
        });

        var table = $('#BranchTable').DataTable({
            ajax: {
                url: '/api/BranchManager',
                type: 'POST'
            },
            processing: true,
            'columns': [
                { data: null },
                { 'data': 'branch_name' }
            ],
            select: {
                style: 'multi',
                blurable: true,
            },
            dom: 'Bfrtip',
            buttons: [
                { extend: 'create', editor: editor },
                { extend: 'edit', editor: editor },
                { extend: 'remove', editor: editor },
            ],
            language: {
                select: {
                    rows: {
                        _: "<b> %d Rows Selected</b>",
                        0: "",
                    }
                },
                "loadingRecords": "Please Wait  - Loading...",
                "processing": "<span id='loader' class='mdl-spinner mdl-js-spinner is-active'></span>"
            },
            "columndefs": [
                {
                    "searchable": false,
                    "orderable": false,
                    "targets": 0
                }
            ],
            "order": [[1, 'asc']],
        });
        table.on('order.dt search.dt', function () {
            table.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
                cell.innerHTML = i + 1;
            });
        }).draw();
    });
}(jQuery));