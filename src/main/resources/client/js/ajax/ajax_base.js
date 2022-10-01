//api
var URLHTTP = window.location.href.split("/")
URLHTTP = URLHTTP[0] + "/" + "/" + URLHTTP[2] + "/"
// console.log(window.location.href.split("/"))
const URL_API = URLHTTP + "api/v1/public/";
// const URL_API = "http://125.212.238.231:8080/spec/api/v1/public/";
console.log(URL_API)


$(function () {
    addMenuDropDown();
    showCourseTuVan();
    checkAdvisory();
    $("#btn-advisory").click(function () {
        postAdvisoryInfor()
    })
});


function showCourseTuVan() {
    let url = window.location.href.split("/")
    console.log(url[4])
    let idCourseCurrent = url[4]
    let html = ``
    ajaxCallGet("course/find-by-name-image-subcontent-createdate/0").then(rs => {
        console.log(rs)
        rs.data.map(item => {
            console.log(item)
            item.id == idCourseCurrent ? html += `<option value="${item.id}" selected>${item.name}</option>` : html += `<option value="${item.id}">${item.name}</option>`;
        });
        $("#courseAdvisory >select").html(html)
    })
}

// thêm mới yêu cầu tư vấn
function postAdvisoryInfor() {

    if ($("#emailAdvisory >input").val() == "" ||
        $("#phoneAdvisory >input").val() == "" ||
        $("#nameStudentAdvisory >input").val() == "" ||
        $("#dateOfBirth >input").val() == ""
    ) {
        alertWarning("Vui lòng nhập đầy đủ thông tin")
    } else {
        let codeGT;
        $("#codeGt>input").val() === null ? codeGT = "" : codeGT = $("#codeGt>input").val();
        let advisory = {
            "phoneNumber": $("#phoneAdvisory>input").val(),
            "fullName": $("#nameStudentAdvisory>input").val(),
            "email": $("#emailAdvisory>input").val(),
            "address": " ",
            "dateOfBirth": $("#dateOfBirth>input").val(),
            "addrOfBirth": " ",
            "jobCurrent": " ",
            "nameSchool": " ",
            "facultySchool": " ",
            "codeGt": codeGT,
            "codePrivate": "",
            "takeCertification": true,
            "deleted": true,
            "statusCall": true,
            "sex": false,
            "userIdNum": 8,
            "groupStudentIdNum": 1
        }
        console.log(advisory)
        // let idCourse = $("#courseAdvisory>select option:selected").val();
        // console.log($("#courseAdvisory>select option:selected").val())
        // let idAdd = $("#addAdvisory>select option:selected").val()
        // ajaxCallPost("advisory-infor/save/" + idAdd + "/" + idCourse, advisory)


        // param1: id của địa chỉ học
        // param2: id của khóa học mà hs đăng ký
        // param3: id group student mặc định là chưa gọi điện
        // param4: id admin mặc định là 8
        ajaxCallPost("students/save/" + 1 + "/" + $("#courseAdvisory >select > option:selected").val() + "/" + 1 + "/" + 8, advisory).then(rs => {
            console.log(rs);
            if (rs.data != null) {
                alertSuccess("Chúc mừng bạn đã đăng ký thành công.")
                // setTimeout(location.reload.bind(location), 1500)
            }
        }).catch(e => {
            alertDanger("Đăng ký thất bại.")
            // setTimeout(location.reload.bind(location), 2000)
        })

    }
}

function checkNullAdvisory() {
    if ($("#emailAdvisory >input").val() == "" ||
        $("#phoneAdvisory >input").val() == "" ||
        $("#nameStudentAdvisory >input").val() == "" ||
        $("#dateOfBirth >input").val() == ""
    ) {
        $("#btn-advisory").prop("disabled", true);
    } else $("#btn-advisory").prop("disabled", false);
}

function checkAdvisory() {

    // $("#nameParentAdvisory >input").change(function () {
    //     if ($("#nameParentAdvisory >input").val() == "")
    //         $("#nameParentAdvisory >span").css({"display": "inline", "font-size": "12px", "color": "white"})
    //     else {
    //         $("#nameParentAdvisory >span").css({"display": "none"})
    //         checkNullAdvisory();
    //     }
    // })
    $("#emailAdvisory >input").change(function () {
        if ($("#emailAdvisory >input").val() == "")
            $("#emailAdvisory >span").css({"display": "inline", "font-size": "12px", "color": "white"})
        else {
            if ($("#emailAdvisory >input").val().toLowerCase().match("^[a-z][a-z0-9_\\.]{5,32}@[a-z0-9]{2,}(\\.[a-z0-9]{2,4}){1,2}$")) {
                $("#emailAdvisory >span").css({"display": "none"})
                checkNullAdvisory();
            } else {
                $("#emailAdvisory >span").css({"display": "inline", "font-size": "12px", "color": "white"})
                alertWarning("Vui lòng nhập đúng địa chỉ email.")
            }

        }
    })

    $("#phoneAdvisory >input").change(function () {
        if ($("#phoneAdvisory >input").val() == "")
            $("#phoneAdvisory >span").css({"display": "inline", "font-size": "12px", "color": "white"})
        else {
            if ($("#phoneAdvisory >input").val().match("^\\+?(?:0|84)(?:\\d){9}$")) {
                $("#phoneAdvisory >span").css({"display": "none"})
                checkNullAdvisory();
            } else {
                $("#phoneAdvisory >span").css({"display": "inline", "font-size": "12px", "color": "white"})
                alertWarning("Vui lòng nhập đúng sđt của bạn.")
            }

        }
    })

    $("#nameStudentAdvisory >input").change(function () {
        if ($("#nameStudentAdvisory >input").val() == "")
            $("#nameStudentAdvisory >span").css({"display": "inline", "font-size": "12px", "color": "white"})
        else {
            $("#nameStudentAdvisory >span").css({"display": "none"})
            checkNullAdvisory();
        }
    })

    $("#dateOfBirth >input").change(function () {
        if ($("#dateOfBirth >input").val() == "")
            $("#dateOfBirth >span").css({"display": "inline", "font-size": "12px", "color": "white"})
        else {
            $("#dateOfBirth >span").css({"display": "none"})
            checkNullAdvisory();
        }
    })
}

// add khóa học trong thanh header
function addMenuDropDown() {
    let html = ``
    ajaxCallGet("course/find-by-name-image-subcontent-createdate/0").then(rs => {
        rs.data.map(item => {
            html += `<li><a class="dropdown-item" href="${URLHTTP + item.urlView + "?" + item.urlView + "=" + item.id}">${item.name}</a></li>`
        });

        $("#menuKhoaHoc").html(html)
        $("#menuKhoaHoc").append("<li><a class=\"dropdown-item\" href=\"xemthem\">Xem tất cả</a></li>")
    })
}

//*
// kiểm tra xem trong local storage có key user k
// k có sẽ bắt login*/
function checkLogin() {
    let user = getItemSessionStorage("user");
    // let user = getItemLocalStorage("user");
    if (user != null) {
        let html = `
        <a href="#" class="d-block" id="text-name-user" style="text-transform: capitalize">${user.data.name}</a>
        `;
        $("#idBlockSidebar").html(html)
    } else {
        window.location.href = "login"
    }
}

/*Đăng xuất ra khỏi tk*/
function logOut() {
    sessionStorage.removeItem("user");
    // localStorage.removeItem("user");
    window.location.href = "login";
}

function formatNumber(nStr, decSeperate, groupSeperate) {
    nStr += '';
    x = nStr.split(decSeperate);
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + groupSeperate + '$2');
    }
    return x1 + x2;
}

/*notify để custom alert */
//alert notify
//***************alter
function alertSuccess(text, time = 2000) {
    $.notify({
        icon: 'far fa-check-circle',
        message: text
    }, {
        delay: time,
        offset: {x: 15, y: 15},
        type: 'success',
        animate: {
            enter: 'animated fadeInDown',
            exit: 'animated fadeOutUp'
        },
        z_index: 1031000000000,
    });
}

function alertInfo(text, time = 2000) {
    $.notify({
        icon: 'fas fa-info-circle',
        message: text
    }, {
        delay: time,
        offset: {x: 15, y: 15},
        type: 'info',
        animate: {
            enter: 'animated fadeInDown',
            exit: 'animated fadeOutUp'
        },
        z_index: 1031000000000,
    });
}

function alertWarning(text, time = 2000) {
    $.notify({
        icon: 'fas fa-exclamation',
        message: text
    }, {
        delay: time,
        offset: {x: 15, y: 15},
        type: 'warning',
        animate: {
            enter: 'animated fadeInDown',
            exit: 'animated fadeOutUp'
        },
        z_index: 1031000000000,
    });
}

function alertDanger(text, time = 2000) {
    $.notify({
        icon: 'fas fa-exclamation-triangle',
        message: text
    }, {
        timer: 1000,
        delay: time,
        offset: {x: 15, y: 15},
        type: 'danger',
        animate: {
            enter: 'animated fadeInDown',
            exit: 'animated fadeOutUp'
        },
        z_index: 1031000000000,
    });
}

/*get data*/
async function ajaxCallGet(url) {
    let rs = null;
    await $.ajax({
        type: 'GET',
        dataType: "json",
        url: URL_API + url,
        timeout: 30000,
        success: function (result) {
            rs = result;

        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    })

    return rs;
}

/*get data*/
async function ajaxCallGetHasAsyn(url) {
    let rs = null;
    await $.ajax({
        type: 'GET',
        dataType: "json",
        url: URL_API + url,
        async: false,
        timeout: 30000,
        success: function (result) {
            rs = result;
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    })
    return rs;
}

/*upload file, image....*/
async function callUploadFile(file) {
    let data;
    await $.ajax({
        type: "POST",
        url: "api/v1/public/upload-file",
        data: file,
        cache: false,
        contentType: false,
        enctype: 'multipart/form-data',
        processData: false,
        success: function (result) {
            data = result.data;
        },
        error: function (err) {
            console.log(err);
        }
    });
    return data;
}

/*post data*/
async function ajaxCallPost(url, dataUser) {
    let rs = null;
    await $.ajax({
        type: 'POST',
        data: JSON.stringify(dataUser),
        url: URL_API + url,
        timeout: 30000,
        contentType: "application/json",
        success: function (result) {
            rs = result
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    })
    return rs;
}

/*set key-val để lưu vào local storage*/
function setItemLocalStorage(key, val) {
    localStorage.setItem(key, JSON.stringify(val));
}/*get key-val để lưu vào local storage*/
function getItemLocalStorage(key) {
    return JSON.parse(localStorage.getItem(key));
}

async function sweetAlert2(title) {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-success',
            cancelButton: 'btn btn-danger'
        },
        buttonsStyling: false
    })
    let rs = await swalWithBootstrapButtons.fire({
        title: title,
        text: "Bạn sẽ không thể khôi phục lại điều này!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Xóa nó!',
        cancelButtonText: 'Hủy bỏ!',
        reverseButtons: true
    }).then((result) => {
        if (result.isConfirmed) {
            return true;
        } else if (result.dismiss === Swal.DismissReason.cancel) {
            return false;
        }
    })
    return rs
}

function priceFormatVnd(price) {
    let priceString = price.toString();
    const format = priceString.replace(/\B(?=(\d{3})+(?!\d))/g, '.')
    return format;
}

// function priceFormatVnd(price) {
//     const str = price.toString();
//     return str.split('').reverse().reduce((prev, next, index) => {
//         return ((index % 3) ? next : (next + ',')) + prev
//     })
// }
