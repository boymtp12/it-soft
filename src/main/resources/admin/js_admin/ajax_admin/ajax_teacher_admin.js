$(function () {
    var edit1 = createCkeditor('profile-teacher', 100)
    checkLogin();
    showAllTeacher();
    uploadImageTeacher()
    showSubWindowTeacher();
    //event enter trong tìm kiếm giảng viên
    $("#searchTeacher").keypress(function (event) {
        var keycode = (event.keyCode ? event.keyCode : event.which);
        if (keycode == '13') {
            if ($("#searchTeacher").val() == "") {
                alertDanger("Bạn cần nhập tên bài viết muốn tìm kiếm.")
            } else {
                searchTeacher();
            }
        }
    });
});

// upload image teacher
function uploadImageTeacher() {
    $("#inputFileImage").change(function () {
        let formData = new FormData($("form")[0]);
        ajaxCallUploadFile("upload/upload-image/giangvien", formData).then(rs => {
            $("#blockUpLoadImageTeacher").html(`<img width="50px" height="50px" src="${rs}" alt="ảnh giảng viên">`)
            $("#imgSrcTeacher").val(rs)
            // back end đã tự lưu rồi k cần phải gọi ajax để lưu
            alertSuccess("Đã tải ảnh lên.")
        })
    })
}

// show all teacher
function showAllTeacher() {
    ajaxCallGet("teacher/find-all").then(rs => {
        dataHtmlTeacher(rs);
    }).catch(err => {
        $("#tableShowAllTeacher").html("<span>Không có thông tin giảng viên.</span>")
    })
}

//chứa html đổ ra dữ liệu teacher
//param rs: là list teacher
function dataHtmlTeacher(rs) {
    console.log(rs)
    let html = ``;
    if (rs.data.length != 0) {
        rs.data.map((item, index) => {
            html += `
            <tr>
                        <td>${item.id}</td>
                        <td>${item.name}</td>
                        <td>${item.dateOfBirth}</td>
                        <td><span class="tag tag-success">${item.regency}</span></td>
                        <td>${item.address}</td>
                        <td>
                            <div class="mailbox-controls">
                                <!-- Check all button -->
                                <div class="btn-group">
                                    <button id="editTeacher${index}" data-id="${item.id}" title="Sửa" type="button"
                                            class="btn btn-default btn-sm btn-show-teacher">
                                        <i class="fas fa-wrench"></i>
                                    </button>

                                    <button title="Xóa" onclick="deletedTeacher(${item.id})" type="button" class="btn btn-default btn-sm">
                                        <i class="far fa-trash-alt"></i>
                                    </button>

                                </div>
                                <!-- /.btn-group -->

                            </div>
                        </td>
                    </tr>
            `;
        })
        $("#tableShowAllTeacher").html(html)
        setItemLocalStorage("lengthTeacher", rs.data.length)
        saveEditTeacher(getItemLocalStorage("lengthTeacher"))
        showSubWindowTeacher()

    } else {
        $("#tableShowAllTeacher").html("<span>Không có thông tin giảng viên.</span>")
    }
}

// hiêu ứng show cua so nho hien chi tiet thong tin cua giang vien de sua
function showSubWindowTeacher() {
    $(".btn-show-teacher").click(function () {
        $("#edit-teacher").show("slow");
    });
    $("#btn-hide-teacher").click(function () {
        $("#edit-teacher").hide("slow");
    });
}

function saveEditTeacher(lengthTeacher) {
    for (let i = 0; i < lengthTeacher; i++) {
        $("#editTeacher" + i).click(() => {
            $("#btnSaveTeacher").css("display", "none")
            $("#btnSaveEditTeacher").css("display", "inline")

            // clear data cũ, add teacher tương ứng
            editInforTeacher($("#editTeacher" + i).attr("data-id"))
            // gán nút save id = id teacher
            $("#btnSaveEditTeacher").attr("data-id", $("#editTeacher" + i).attr("data-id"))
            $("#btnSaveEditTeacher").unbind("click").click(() => {
                // kiểm tra bằng thì cho posht
                if ($("#btnSaveEditTeacher").attr("data-id") == $("#editTeacher" + i).attr("data-id")) {
                    let teacherInfo = {
                        "id": $("#btnSaveEditTeacher").attr("data-id"),
                        "name": $("#nameTeacher").val(),
                        "dateOfBirth": $("#dateOfBirthTeacher").val(),
                        "regency": $("#regencyTeacher").val(),
                        "addOfBirth": $("#countrySide").val(),
                        "deteted": true,
                        "profile": CKEDITOR.instances["profile-teacher"].getData(),
                        "address": $("#addressTeacher").val(),
                        "imageSrc": $("#imgSrcTeacher").val(),
                        "imageSlide": $("#imageSlide").val()
                    }

                    ajaxCallPost("teacher/save", teacherInfo).then(rs => {
                        alertSuccess("Cập nhật thôn tin thành công.")
                        $("#edit-teacher").hide("slow");

                        showAllTeacher()
                    }).catch(err => {
                        alertDanger("Cập nhật thông tin thất bại.")
                    })
                }

            })
        })
    }
}

// func sửa thông tin giảng viên
function editInforTeacher(id) {
    ajaxCallGet("teacher/find-by-id/" + id).then(rs => {
        $("#nameTeacher").val(rs.data.name)
        $("#dateOfBirthTeacher").val(rs.data.dateOfBirth)
        $("#regencyTeacher").val(rs.data.regency)
        $("#addressTeacher").val(rs.data.address)
        CKEDITOR.instances["profile-teacher"].setData(rs.data.profile)
        $("#countrySide").val(rs.data.addOfBirth)
        $("#imgSrcTeacher").val(rs.data.imageSrc)
        $("#blockUpLoadImageTeacher").html(`<img width="40px" height="40px" src="${rs.data.imageSrc}" alt="ảnh giảng viên">`)
        $("#imageSlide").val(rs.data.imageSlide)
    })
}

// xóa giảng viên
function deletedTeacher(id) {
    ajaxCallPost("teacher/deleted/" + id).then(rs => {
        console.log(rs)
        alertSuccess("Xóa thành công.")
        showAllTeacher()
    }).catch(err => {
        alertDanger("Xóa thất bại.")
    })
}

// thêm mới giảng viên
function addNewTeacher() {
    $("#btnSaveTeacher").css("display", "inline")
    $("#btnSaveEditTeacher").css("display", "none")

    // clear data cũ
    $("#nameTeacher").val("")
    $("#dateOfBirthTeacher").val("")
    $("#regencyTeacher").val("")
    $("#addressTeacher").val("")
    CKEDITOR.instances["profile-teacher"].setData("")
    $("#countrySide").val("")
    $("#imgSrcTeacher").val("")
    $("#blockUpLoadImageTeacher").html(`<img width="40px" height="40px" src="https://spec.edu.vn/client/image/imageuser.jpg" alt="Ảnh giảng viên">`)
    $("#imageSlide").val("")

    $("#btnSaveTeacher").unbind("click").click(() => {
        let teacherInfo = {
            "name": $("#nameTeacher").val(),
            "dateOfBirth": $("#dateOfBirthTeacher").val(),
            "regency": $("#regencyTeacher").val(),
            "addOfBirth": $("#countrySide").val(),
            "deteted": true,
            "profile":   CKEDITOR.instances["profile-teacher"].getData(),
            "address": $("#addressTeacher").val(),
            "imageSrc": $("#imgSrcTeacher").val(),
            "imageSlide": $("#imageSlide").val()
        }
        ajaxCallPost("teacher/save", teacherInfo).then(rs => {
            alertSuccess("Cập nhật thôn tin thành công.")
            $("#edit-teacher").hide("slow");

            showAllTeacher()
        }).catch(err => {
            alertDanger("Cập nhật thông tin thất bại.")
        })
    })
}

function searchTeacher() {
    ajaxCallGet("teacher/find-by-like-name/" + $("#searchTeacher").val()).then(rs => {
        dataHtmlTeacher(rs);
    })
}

// //
// function uploadImageServer() {
//     $("#inputFileImageTeacher").change(function () {
//         let formData = new FormData($("form")[0]);
//         ajaxCallUploadFile(formData).then(rs => {
//             // back end đã tự lưu rồi k cần phải gọi ajax để lưu
//             alertSuccess("Đã tải ảnh lên.")
//             console.log(rs)
//
//         }).catch(err => {
//             alertDanger("Tải ảnh lên thất bại")
//         })
//     })
// }
