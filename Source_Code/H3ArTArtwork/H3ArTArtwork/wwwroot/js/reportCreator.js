var dataTable;

$(document).ready(function () {
    loadDataTable();
});

function loadDataTable() {
    dataTable = $('#tblData').DataTable({
        "ajax": { url: '/moderator/report/GetAllReportArtist' },
        "columns": [
            { "data": "reportArtistId", "width": "10%" }, // Adjusted width to 10%
            { "data": "artist.fullName", "width": "20%" }, // Adjusted width to 20%
            { "data": "reporter.fullName", "width": "20%" }, // Adjusted width to 20%
            { "data": "reason", "width": "20%" }, // Adjusted width to 20%
            {
                "data": "artist.id",
                "render": function (data, type, row) {
                    var today = new Date().getTime();
                    var lockoutEnd = new Date(row.artist.lockoutEnd).getTime();

                    if (lockoutEnd > today) {
                        return `
                        <div class="text-center">
                            <a onclick="LockUnlock('${data}')" class="btn btn-danger text-white" style="cursor:pointer; width:100px;">
                                <i class="bi bi-lock-fill"></i> Lock
                            </a> 
                        </div>
                        `;
                    } else {
                        return `
                        <div class="text-center">
                            <a onclick="LockUnlock('${data}')" class="btn btn-success text-white" style="cursor:pointer; width:100px;">
                                <i class="bi bi-unlock-fill"></i> Unlock
                            </a>
                        </div>
                        `;
                    }
                },
                "width": "30%" // Adjusted width to 30%
            }
        ]
    });
}


function LockUnlock(id) {
    $.ajax({
        type: "POST",
        url: '/Admin/User/LockUnlock',
        data: JSON.stringify(id),
        contentType: "application/json",
        success: function (data) {
            if (data.success) {
                toastr.success(data.message);
                dataTable.ajax.reload();
            }
            if (!data.success) {
                toastr.success(data.message);
                dataTable.ajax.reload();
            }
        }
    });
}