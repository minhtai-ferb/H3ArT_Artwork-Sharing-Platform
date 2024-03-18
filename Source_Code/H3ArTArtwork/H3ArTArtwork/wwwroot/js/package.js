var dataTable;

$(document).ready(function () {
    loadDataTable();
});

function loadDataTable() {
    var artistId = "your_artist_id";
    dataTable = $('#tblData').DataTable({
        "ajax": { url: '/admin/package/getall' },
        "columns": [
            { data: 'packageName', "width": "15%" }, // Adjusted width to 15%
            { data: 'price', "width": "10%" }, // Adjusted width to 10%
            { data: 'amountPost', "width": "10%" }, // Adjusted width to 10%
            { data: 'description', "width": "25%" }, // Adjusted width to 25%
            {
                data: 'packageId',
                "render": function (data) {
                    return `<div class="w-100 btn-group" role="group">
                     <a href="/admin/package/upsert?packageID=${data}" class="btn btn-primary mx-2"> <i class="bi bi-pencil-square"></i> Edit</a>
                     <a onClick=Delete('/admin/package/delete/${data}') class="btn btn-danger mx-2"> <i class="bi bi-trash-fill"></i> Delete</a>
                    </div>`
                },
                "width": "40%" // Adjusted width to 40%
            }
        ]
    });
}

function Delete(url) {
    Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: url,
                type: 'DELETE',
                success: function (data) {
                    dataTable.ajax.reload();
                    toastr.success(data.message);
                }
            })
        }
    })
}
