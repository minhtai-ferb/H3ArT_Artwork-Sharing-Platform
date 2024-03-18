var dataTable;

$(document).ready(function () {
    loadDataTable();
});

function loadDataTable() {
    dataTable = $('#tblData').DataTable({
        "ajax": { url: '/Moderator/report/GetAllReportBlog' },
        "columns": [
            { data: 'reportBlogId', "width": "5%" },
            { data: 'blogId', "width": "5%" },
            { data: 'blog.title', "width": "15%" }, // Adjusted width to 15%
            {
                data: 'blog.imageUrl',
                "render": function (data) {
                    return `<img src="${data}" width="100px" height="auto">`;
                },
                width: "15%" // Adjusted width to 15%
            },
            { data: 'applicationUser.fullName', "width": "15%" }, // Adjusted width to 15%
            { data: 'reason', "width": "20%" }, // Adjusted width to 20%
            {
                data: 'blogId',
                "render": function (data) {
                    return `<div class="w-100 btn-group" role="group">
                      <a onClick=Delete('/moderator/report/delete/${data}') class="btn btn-danger mx-2"> <i class="bi bi-trash-fill"></i> Delete</a>
                    </div>`
                },
                "width": "25%" // Adjusted width to 25%
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