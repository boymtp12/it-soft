$(async function () {
    var typeEducation = null;
    checkLogin()
    showListCourse()
    hideShowBlockAddCourse()
    showAllTeacherOfCourse(0)
    showThemeOfCourse(0)
    await ajaxCallGet("type-education/find-all").then(rs => {
        typeEducation = rs
    })
    showTypeEducationOfCourse(typeEducation)
    var edit1 = TinyInit('#mainContentCourse', 500)

    // check keyup để format học phí
    $("#studentFees").keyup(function () {
        $("#studentFees").val(formatFees($("#studentFees").val(), ',', ','))
    })

    //event enter trong tìm kiếm topic
    $("#inputSearchCourse").keypress(function (event) {
        var keycode = (event.keyCode ? event.keyCode : event.which);
        if (keycode == '13') {
            if ($("#inputSearchCourse").val() == "") {
                alertDanger("Bạn cần nhập tên khóa học muốn tìm kiếm.")
            } else {
                searchCourse();
            }
        }
    });

})

// show ra bảng khóa học
function showListCourse() {
    let html = "";
    // true là khóa học cho trẻ em
    ajaxCallGet("course/find-by-classify/true").then(rs => {
        console.log(rs)
        dataCourse(rs, "tableShowAllcourse")
        setItemLocalStorage("lengthCourse", rs.data.length)
    })
}

// chứa các nút ẩn hiện lên form add khóa học
function hideShowBlockAddCourse() {
    $(".btn-show-add-course").click(function () {
        $("#block-edit-course").show("slow");
    });
    $(".btn-hide-add-course").click(function () {
        $("#block-edit-course").hide("slow");
    });
}

// show giảng viên dưới dạng select option của khóa học
function showAllTeacherOfCourse(idTeacher) {
    let html = ``;
    ajaxCallGet("teacher/find-all").then(rs => {
        rs.data.map((item) => {
            item.id == idTeacher ? html += `<option value="${item.id}" selected>${item.name}</option>` : html += `<option value="${item.id}">${item.name}</option>`;
        })
        $("#teacherCourse").html(html)
    })
}

// show theme dưới dạng select option của khóa học
function showThemeOfCourse(idTheme) {
    let html = ``;
    ajaxCallGet("theme/find-all").then(rs => {
        rs.data.map((item) => {
            item.id == idTheme ? html += `<option value="${item.id}" selected>${item.name}</option>` : html += `<option value="${item.id}">${item.name}</option>`;
        })
        $("#themeCourse").html(html)
    })
}

// show type education của khóa học
function showTypeEducationOfCourse(typeEducation) {
    let html = "";


    typeEducation.data.map(item => {
        html += `
          <li class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                <input type="checkbox" id="typeEducation${item.id}" name="TypeEducation${item.id}" value="${item.id}">
                <label for="dewey">${item.name}</label>
           </li>
        `;
    })
    $("#typeEducationCourse").html(html)

    // lưu độ dài của type edu vào local storage
    setItemLocalStorage("lengtTypeEducation", typeEducation.data.length);


}

// kiểm tra xem mỗi khóa học có những kiểu đào tạo nào add checked vào
async function addCheckedInInputTypeEducation(idCourse) {
    let lengthTypeEducation = getItemLocalStorage("lengtTypeEducation")
    for (let i = 0; i < lengthTypeEducation; i++) {
        $("#typeEducation" + (i + 1)).prop("checked", false)
    }
    await ajaxCallGet("course-has-type-education/find-by-idcourse/" + idCourse).then(rs => {
        console.log(rs)
        if (rs.data.length > 0) {
            rs.data.map(item => {
                for (let i = 0; i < lengthTypeEducation; i++) {
                    if (item.typeEducation.id == $("#typeEducation" + (i + 1)).val()) {
                        $("#typeEducation" + (i + 1)).prop("checked", true)
                    }
                }
            })
        }
    })
}

// kiểm tra xem có những kiểu đào tạo nào đc chọn
// lưu vào db
function checkSelectTypeEducationAndPost(lengthTypeEducation, idCourse) {
    console.log(lengthTypeEducation)
    for (let i = 0; i < lengthTypeEducation; i++) {
        if ($("#typeEducation" + (i + 1)).prop("checked") == true) {
            // nếu nó đang đc check thì lưu
            console.log($("#typeEducation" + (i + 1)).val())
            ajaxCallPost("course-has-type-education/save/" + $("#typeEducation" + (i + 1)).val() + "/" + idCourse).then(rs => {
                console.log(rs)
            })
        } else {
            // nếu nó k còn check nữa thì xóa luôn
            console.log($("#typeEducation" + (i + 1)).val() + "else")
            ajaxCallPost("course-has-type-education/deleted/" + idCourse + "/" + $("#typeEducation" + (i + 1)).val()).then(rs => {
                console.log(rs)
            })
        }

    }

}

// clear hết dữ liệu cũ để thêm mới khóa học
function clearDataCourse() {
    $("#btnPostCourse").css({"display": "inline"})
    $("#btnPostCourse").prop("disabled", false)

    $("#btnEditCourse").css({"display": "none"})
    $("#btnEditCourse").prop("disabled", true)

    $("#nameCourse").val("")
    $("#studentFees").val("")
    $("#imageCourse").val("")
    $("#urlViewCourse").val("")
    $("#objectCourse").val("")
    $("#ageCourse").val("")
    $("#numberOfStudent").val("")
    $("#durationOfStudy").val("")
    $("#documentCourse").val("")
    $("#sectionCourse").val("")
    $("#subContentCourse").val("")
    tinymce.get("mainContentCourse").setContent("")
    $("#metaSeoTitle").val("")
    $("#metaSeoDescription").val("")
    $("#metaKeyWord").val("")
    $("#metaSeoRobot option:selected").val("")
    $("#openingDay").val("")
    $("#studyTime").val("")
}


// chỉnh sửa thông tin khóa học
function editCourse(idCourse) {
    clearDataCourse()
    $("#btnEditCourse").css({"display": "inline"})
    $("#btnEditCourse").prop("disabled", false)

    $("#btnPostCourse").css({"display": "none"})
    $("#btnPostCourse").prop("disabled", true)
    ajaxCallGet("course/find-by-id/" + idCourse).then(rs => {
        showAllTeacherOfCourse(rs.data.idTeacher.id)
        showThemeOfCourse(rs.data.idTheme.id)
        console.log(rs)
        $("#nameCourse").val(rs.data.name)
        $("#studentFees").val(formatNumber(rs.data.studentFees, ",", ","))
        $("#imageCourse").val(rs.data.image)
        $("#urlViewCourse").val(rs.data.urlView)
        $("#objectCourse").val(rs.data.objStudents)
        $("#ageCourse").val(rs.data.age)
        $("#numberOfStudent").val(rs.data.numberOfStudent)
        $("#durationOfStudy").val(rs.data.durationOfStudy)
        $("#documentCourse").val(rs.data.document)
        $("#sectionCourse").val(rs.data.section)
        $("#openingDay").val(rs.data.openingDay)
        $("#studyTime").val(rs.data.studyTime)
        $("#subContentCourse").val(rs.data.subContent)
        setTimeout(() => {
            tinymce.get("mainContentCourse").setContent(rs.data.mainContent)
        }, 1000)
        $("#metaSeoTitle").val(rs.data.metaTitle)
        $("#metaSeoDescription").val(rs.data.metaDescription)
        $("#metaKeyWord").val(rs.data.metaKeyword)
        $("#metaSeoRobot option:selected").val(rs.data.metaRobot)
        $("#promotionCourse option[value=" + `${rs.data.percentOfPromotion}` + "]").prop("selected", true)

    })
    addCheckedInInputTypeEducation(idCourse)
}

// post thông tin khóa học lưu lên database
async function postCourse(idCourse) {
    let course = null;
    if (idCourse > 0) {
        course = {
            "id": idCourse,
            "name": $("#nameCourse").val(),
            "studentFees": $("#studentFees").val().replaceAll(",", ""),
            "image": $("#imageCourse").val(),
            "deleted": true,
            "urlView": $("#urlViewCourse").val(),
            "objStudents": $("#objectCourse").val(),
            "promotion": true,
            "subContent": $("#subContentCourse").val(),
            "age": $("#ageCourse").val(),
            "numberOfStudent": $("#numberOfStudent").val(),
            "mainContent": tinymce.get("mainContentCourse").getContent(),
            "durationOfStudy": $("#durationOfStudy").val(),
            "section": $("#sectionCourse").val(),
            "metaTitle": $("#metaSeoTitle").val(),
            "metaDescription": $("#metaSeoDescription").val(),
            "metaKeyword": $("#metaKeyWord").val(),
            "metaRobot": $("#metaSeoRobot option:selected").val(),
            "document": $("#documentCourse").val(),
            "percentOfPromotion": $("#promotionCourse option:selected").val(),
            "classify": true,
            "openingDay": $("#openingDay").val(),
            "studyTime": $("#studyTime").val()
        }
        /*
   * param1: id small category
   * param2: id user mặc định của admin là 8
   * param3: id theme
   * param4: id teacher*/
        console.log(course)
        await ajaxCallPost("course/save/" + 1 + "/" + 8 + "/" + $("#themeCourse option:selected").val() + "/" + $("#teacherCourse option:selected").val(), course).then(rs => {
            console.log(rs)
            console.log(course)
            checkSelectTypeEducationAndPost(getItemLocalStorage("lengtTypeEducation"), rs.data.id)
            // addCheckedInInputTypeEducation(idCourse).then(rs => {
            //     alertSuccess("Lưu thành công")
            //     showListCourse()
            //     $("#block-edit-course").hide("slow");
            // }).catch(err => {
            //     alertDanger("Lưu thất bại")
            // })
            alertSuccess("Lưu thành công")
            showListCourse()
            $("#block-edit-course").hide("slow");
        }).catch(err => {
            alertDanger("Lưu thất bại")
        })
    } else {
        course = {
            "name": $("#nameCourse").val(),
            "studentFees": $("#studentFees").val().replaceAll(",", ""),
            "image": $("#imageCourse").val(),
            "deleted": true,
            "urlView": $("#urlViewCourse").val(),
            "objStudents": $("#objectCourse").val(),
            "promotion": true,
            "subContent": $("#subContentCourse").val(),
            "age": $("#ageCourse").val(),
            "numberOfStudent": $("#numberOfStudent").val(),
            "mainContent": tinymce.get("mainContentCourse").getContent(),
            "durationOfStudy": $("#durationOfStudy").val(),
            "section": $("#sectionCourse").val(),
            "metaTitle": $("#metaSeoTitle").val(),
            "metaDescription": $("#metaSeoDescription").val(),
            "metaKeyword": $("#metaKeyWord").val(),
            "metaRobot": $("#metaSeoRobot option:selected").val(),
            "document": $("#documentCourse").val(),
            "percentOfPromotion": $("#promotionCourse option:selected").val(),
            "classify": true,
            "openingDay": $("#openingDay").val(),
            "studyTime": $("#studyTime").val()
        }
        /*
   * param1: id small category
   * param2: id user mặc định của admin là 8
   * param3: id theme
   * param4: id teacher*/
        console.log(course)
        await ajaxCallPost("course/save/" + 1 + "/" + 8 + "/" + $("#themeCourse option:selected").val() + "/" + $("#teacherCourse option:selected").val(), course).then(rs => {
            console.log(rs)
            console.log(course)
            checkSelectTypeEducationAndPost(getItemLocalStorage("lengtTypeEducation"), rs.data.id)
            // addCheckedInInputTypeEducation(idCourse).then(rs => {
            //     alertSuccess("Lưu thành công")
            //     showListCourse()
            //     $("#block-edit-course").hide("slow");
            // }).catch(err => {
            //     alertDanger("Lưu thất bại")
            // })
            alertSuccess("Lưu thành công")
            showListCourse()
            $("#block-edit-course").hide("slow");

        }).catch(err => {
            alertDanger("Lưu thất bại")
        })
    }

}

function removeCourse(idCourse) {
    ajaxCallPost("course/deleted/" + idCourse).then(rs => {
        for (let i = 0; i < localStorage.getItem("lengtTypeEducation"); i++) {
            ajaxCallPost("course-has-type-education/deleted/" + idCourse + "/" + $("#typeEducation" + (i + 1)).val()).then(rs => {
                // cái này k cần thông báo
            })
        }
        alertSuccess("Xóa thành công")
        showListCourse()
    }).catch(err => {
        alertDanger("Xóa thất bại")
    })
}

// nút search khóa học theo tên
function searchCourse() {
    ajaxCallGet("course/find-like-name/" + $("#inputSearchCourse").val()).then(rs => {
        dataCourse(rs, "tableShowAllcourse");
    }).catch(err => {
            alertDanger("Không có khóa học.")
        }
    )
}

// func này chứa dữ liệu từng khóa học 1 để add lên
/*
* param1: list danh sách khóa học
* param2: id nơi cần add html*/
function dataCourse(rs, id) {
    let html = "";
    rs.data.map((item, index) => {
        html += `
             <tr>
                        <td>${index + 1}</td>
                        <td><a href="${"khoa-hoc-spec/" + item.id + "/" + item.urlView}" target=“_blank”>${item.name}</a> </td>
                     
                        <td><span class="tag tag-success">${item.createDate}</span></td>
                       
                        <td>
                            <div class="mailbox-controls">
                                <!-- Check all button -->
                                <div class="btn-group">
                                    <button data-id="${item.id}"  id="editCourse${index}" data-toggle="" title="Sửa" type="button"
                                            class="btn btn-default btn-sm btn-show-add-course">
                                        <i class="fas fa-wrench"></i>
                                    </button>

                                    <button title="Xóa" onclick="removeCourse(${item.id})" type="button" class="btn btn-default btn-sm">
                                        <i class="far fa-trash-alt"></i>
                                    </button>

                                </div>
                                <!-- /.btn-group -->

                            </div>
                        </td>
                    </tr>`;
    })
    $("#" + id).html(html)
    hideShowBlockAddCourse()
    removeAndEditCourseCheckClick(getItemLocalStorage("lengthCourse"))
}

// func này để kiểm tra sự kiện click vào nut xóa hoặc sửa
function removeAndEditCourseCheckClick(lengtCourse) {
    for (let i = 0; i < lengtCourse; i++) {
        $("#editCourse" + i).click(() => {
            editCourse($("#editCourse" + i).attr("data-id"))
            // gán id course cho nút lưu lại
            $("#btnEditCourse").attr("data-id", $("#editCourse" + i).attr("data-id"))

            // khi click vào nut lưu lại
            $("#btnEditCourse").unbind("click").click(() => {
                // kiểu tra id trong nút lưu lại phải bằng id của course đang đc view mới cho post
                if ($("#btnEditCourse").attr("data-id") === $("#editCourse" + i).attr("data-id")) {
                    // lưu đối tượng đào tạo trc
                    checkSelectTypeEducationAndPost(getItemLocalStorage("lengtTypeEducation"), $("#editCourse" + i).attr("data-id"))
                    // lưu khóa học
                    postCourse($("#editCourse" + i).attr("data-id")).then(rs => {
                        alertSuccess($("#editCourse" + i).attr("data-id"))
                        console.log(rs)
                        alertSuccess("Thay đổi đã đc lưu.")
                        // load lại dữ liệu mới
                    }).catch(err => {
                        alertSuccess("Lưu thất bại.")
                    })
                }

            })
        })

    }
}