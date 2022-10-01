var edit2 = TinyInit("#subContent", 100);
var edit1 = TinyInit('#mainContent', 500);
let mainContent = 'mainContent'
let subContent = 'subContent'

$(document).ready(function () {
    checkLogin()

    // handlePostCourse();
    hideContainerAddCourse();
    getCourses(renderCourses);
    handleSearchCourse(renderCourses);
    $('#priceCourse').keyup(function (event) {
        $('#priceCourse').val(formatNumber(event.target.value.replaceAll(',', '').replaceAll('.', ''), ",", ","));
    })
    $('#discountCourse').keyup(function (event) {
        $('#discountCourse').val(formatNumber(event.target.value.replaceAll(',', '').replaceAll('.', ''), ",", ","));
    })
    let rs = validateForm('form-id');
    if(rs) {
        handlePostCourse()
    }
    // $('#form-id').submit(function () {
    //     console.log("submid")
    // })
    // notification();

    // setTimeout(function() {
    //     let textBlock = document.querySelector('#subContent_ifr p');
    //     if(textBlock.innerText.length > 0) {
    //         if(textBlock.innerText.length >= 300) {
    //             alertDanger('Chỉ được phép nhập tối thiểu 300 ký tự')
    //         }
    //     }
    // }, 3000)
})

function hideContainerAddCourse() {
    $('.btn-hide-add-course').click(function () {
        $('#block-edit-course').hide('slow');
        clearDataTopic();
    });
    $('.btn-show-add-course').click(function () {
        $('#block-edit-course').show('slow');
    })
}

function getCourses(callback) {
    fetch('/api/v1/public/phan-mem/find-all')
        .then(function (response) {
            return response.json();
        })
        .then(callback)
}

function renderCourses(rs) {
    console.log('renderTest: ', rs.data);
    let htmls = rs.data.map(function (course, index) {
        return `<tr>
                        <td>${index + 1}</td>
                        <td><a href="" target=“_blank”>${course.ten}</a> </td>
                     
                        <td><span class="tag tag-success">${course.ngayTao}</span></td>
                       
                        <td>
                            <div class="mailbox-controls">
                                <!-- Check all button -->
                                <div class="btn-group">
                                    <button id="editCourse${index}" onclick="changeBtnSave(${course.id})" data-id="${course.id}" data-toggle="" title="Sửa" type="button"
                                            class="btn btn-default btn-sm btn-show-add-course">
                                        <i class="fas fa-wrench"></i>
                                    </button>

                                    <button title="Xóa" id="infor-icon" onclick="handleDeleteCourse(${course.id})" id="btnRemoveCourse${index}" data-id="${course.id}" type="button" class="btn btn-default btn-sm">
                                        <i class="far fa-trash-alt"></i>
                                    </button>

                                </div>
                                <!-- /.btn-group -->

                            </div>
                        </td>
               </tr>`;

    })
    $('#tableShowAllCourse').html(htmls);
    hideContainerAddCourse();
}


function handlePostCourse() {
    let postBtn = document.getElementById('postCourse');
    let idUser = getItemLocalStorage("user").data.id;
    let courseData = null;
    if (postBtn) {
        postBtn.onclick = function () {
            console.log($('#nameCourse').val())
            let ten = $('#nameCourse').val();
            let giaBan = $('#priceCourse').val().replaceAll(',','')
            let anh = $('#urlImage').val();
            let giaGiam = $('#discountCourse').val().replaceAll(',','');
            let slug = $('#slug').val();
            let metaTitle = $('#metaSeoTitle').val();
            let metaDescription = $('#metaSeoDescription').val();
            let metaKeyword = $('#metaKeyWord').val();
            let metaRobot = $('#metaSeoRobotSua').val();
            let moTaNgan = tinymce.get(subContent).getContent();
            let moTaChiTiet = tinymce.get(mainContent).getContent();
            courseData = {
                ten: ten,
                anh: anh,
                moTaNgan: moTaNgan,
                moTaChiTiet: moTaChiTiet,
                giaBan: giaBan == "" ? 0 : giaBan,
                giaGiam: giaGiam == "" ? 0 : giaGiam,
                metaTitle: metaTitle,
                metaDescription: metaDescription,
                metaKeyword: metaKeyword,
                metaRobot: metaRobot,
                slug: slug
            }
            console.log(typeof giaBan == 'number')
            console.log(typeof giaGiam == 'string')
            let options = {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                    // 'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: JSON.stringify(courseData)
            }

            console.log(courseData)

            fetch('/api/v1/public/phan-mem/save-new/' + idUser, options)
                .then(function (response) {
                    return response.json();
                })
                .then(function (rs) {
                    alertSuccess('Thêm phần mềm thành công');
                    clearDataTopic();
                    getCourses(renderCourses);
                    document.getElementById("btn-hide-add-course").click();

                }).catch(err => {
                console.log(err)
                alertDanger('Thêm phần mềm thất bại');
            })
        }
    }


}

function handleEditCourse(idCourse) {
    let idUser = getItemLocalStorage("user").data.id;
    // $('#btnEditCourse').click(function () {
    let id = idCourse;
    let ten = $('#nameCourse').val();
    let giaBan = $('#priceCourse').val()
    let anh = $('#urlImage').val();
    let giaGiam = $('#discountCourse').val();
    let slug = $('#slug').val();
    let metaTitle = $('#metaSeoTitle').val();
    let metaDescription = $('#metaSeoDescription').val();
    let metaKeyword = $('#metaKeyWord').val();
    let metaRobot = $('#metaSeoRobotSua').val();
    let moTaNgan = tinymce.get(subContent).getContent();
    let moTaChiTiet = tinymce.get(mainContent).getContent();
    let courseData = {
        id: id,
        ten: ten,
        anh: anh,
        moTaNgan: moTaNgan,
        moTaChiTiet: moTaChiTiet,
        giaBan: giaBan == "" ? 0 : giaBan,
        giaGiam: giaGiam == "" ? 0 : giaGiam,
        metaTitle: metaTitle,
        metaDescription: metaDescription,
        metaKeyword: metaKeyword,
        metaRobot: metaRobot,
        slug: slug,
    }
    console.log(courseData)
    let options = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
            // 'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: JSON.stringify(courseData)
    }
    fetch('/api/v1/public/phan-mem/update/' + idUser, options)
        .then(function (response) {
            return response.json();
        })
        .then(function (success) {
            console.log(success);
            alertSuccess('Sửa phần mềm thành công');
            document.getElementById("btn-hide-add-course").click();
            clearDataTopic();
            getCourses(renderCourses);
        })
        .catch(function (er) {
            console.log(er)
            alertDanger('ERRR')
        })
    // })
}

async function handleDeleteCourse(idCourse) {
    let text = 'Bạn có thực sự muốn xóa phần mềm';
    let confirm = await sweetAlert2(text)
    if(confirm) {
        let options = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
                // 'Content-Type': 'application/x-www-form-urlencoded',
            },
        }
        fetch('/api/v1/public/phan-mem/deleted/' + idCourse, options)
            .then(function (response) {
                return response.json();
            })
            .then(function (rs) {
                console.log(rs);
                alertSuccess('Xóa phần mềm thành công!');
                getCourses(renderCourses);
            })
            .catch(function (er) {
                console.log(er);
            })

    } else {
        alertInfo('Thankkk u')
    }

}

function SearchCourseFunction() {
    fetch('/api/v1/public/phan-mem/find-by-like-ten/' + $('#inputSearchCourse').val())
        .then(function (response) {
            return response.json();
        })
        .then(function (rs) {
            console.log('Search: ', rs.data)
            if (rs.data.length > 0) {
                renderCourses(rs);
            }
        })

}

function handleSearchCourse() {
    $('#inputSearchCourse').attr('onkeyup', 'SearchCourseFunction()')

}

function clearDataTopic() {
    $("#postCourse").css({"display": "inline"})
    $("#postCourse").prop("disabled", false)

    $("#btnEditCourse").css({"display": "none"})
    $("#btnEditCourse").prop("disabled", true)
    $('#nameCourse').val("")
    $('#priceCourse').val("")
    $('#urlImage').val("")
    $('#discountCourse').val("")
    $('#slug').val("")
    $('#metaSeoTitle').val("")
    $('#metaSeoDescription').val("")
    $('#metaKeyWord').val("")
    $('#metaSeoRobotSua').val("index,follow")
    tinymce.get(subContent).setContent("")
    tinymce.get(mainContent).setContent("")
}

function changeBtnSave(id) {
    $('#postCourse').prop("disabled", true);
    $('#postCourse').css('display', 'none');

    $('#btnEditCourse').prop("disabled", false);
    $('#btnEditCourse').css('display', 'inline-block');
    $('#btnEditCourse').attr('onclick', `handleEditCourse(${id})`);
    fetch('/api/v1/public/phan-mem/find-by-id/' + id)
        .then(function (response) {
            return response.json();
        })
        .then(rs => {
            console.log(rs)
            $('#nameCourse').val(rs.data.ten)
            $('#priceCourse').val(rs.data.giaBan)
            $('#urlImage').val(rs.data.anh)
            $('#discountCourse').val(rs.data.giaGiam)
            $('#slug').val(rs.data.slug)
            $('#metaSeoTitle').val(rs.data.metaTitle)
            $('#metaSeoDescription').val(rs.data.metaDescription)
            $('#metaKeyWord').val(rs.data.metaKeyword)
            $('#metaSeoRobotSua').val(rs.data.metaRobot)
            tinymce.get(subContent).setContent(rs.data.moTaNgan)
            tinymce.get(mainContent).setContent(rs.data.moTaChiTiet)

        }).catch(err => {
        console.log(err)
    })
}


