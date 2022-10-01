
// đây nhé sửa cho anh theo trang anh dùng TinyInit
// chỗ nào
var edit1 = TinyInit('#mainContent', 100)
var edit2 = TinyInit('#subContent', 400)
let mainContent = 'mainContent'
let subContent = 'subContent'

$(document).ready(function () {

    setTimeout(() => {
        console.log(tinymce.get(subContent).getContent())
        console.log(tinymce.get(mainContent).getContent())
    }, 1000)

    checkLogin()
    showNameCourseInAddTopic(1);
    hideShowBtnAddTopic();
    showFullTopic();
    //event enter trong tìm kiếm topic
    $("#inputSearchTopic").keypress(function (event) {
        var keycode = (event.keyCode ? event.keyCode : event.which);
        if (keycode == '13') {
            if ($("#inputSearchTopic").val() == "") {
                alertDanger("Bạn cần nhập tên bài viết muốn tìm kiếm.")
            } else {
                searchTopic();
            }
        }
    });
});

// show select option các khóa học trong cửa sổ thêm mới
function showNameCourseInAddTopic(idCourse) {
    let html = ``;
    ajaxCallGet("course/find-by-name-image-subcontent-createdate/0").then(rs => {
        console.log(rs)
        rs.data.map((items) => {
            items.id == idCourse ? html += `<option value="${items.id}" selected>${items.name}</option> ` : html += `<option value="${items.id}">${items.name}</option> `;
        })
        console.log(html)
        $("#courseOfTopic").html(html)
    }).catch(err => {
        $("#courseOfTopic").html("<option selected> Không có khóa học.</option>")
    })

}

/*
* 1 bài viết có nhiều tag or 1 tag có nhiều bài viết
* ta sẽ xử lý các tag trước rồi lưu vào db
* sau đó sẽ lưu topic
* và cuối cùng là lưu quan hệ giữa topic và tag ở bảng db trung gian*/

// function này dùng để thêm mới bài viết và cả cập nhật thông tin sau khi sửa bài viết
function postTopic(idTopicT) {
    $("#postTopic").prop("disabled", true)
    let meta = getSeoTopic();
    console.log(meta)
    let topic = null;
    // cắt chuỗi các tag dưới dạng #tag1#tag2
    let listTag = $("#tagTopic").val().replaceAll("#", " ").split(" ");
    let idTopic = null;
    let idUser = getItemLocalStorage("user").data.id;
    if (idTopicT == 0) {
        // nếu == 0 là add
        topic = {
            "title": $("#titleTopic").val(),
            "introduct": tinymce.get(subContent).getContent(),
            "content": tinymce.get(mainContent).getContent(),
            "view": 0,
            "deleted": true,
            "metaHtml": meta,
            "viewUrl": $("#urlTopic").val(),
            "imageSrc": $("#urlImage").val(),
            "metaTitle": $("#metaSeoTitle").val(),
            "metaDescription": $("#metaSeoDescription").val(),
            "metaKeyword": $("#metaKeyWord").val(),
            "metaRobot": $("#metaSeoRobot option:selected").val(),
        }
    } else {
        // nếu != 0 là update
        topic = {
            "id": idTopicT,
            "title": $("#titleTopic").val(),
            "introduct": tinymce.get(subContent).getContent(),
            "content": tinymce.get(mainContent).getContent(),
            "view": 0,
            "deleted": true,
            "metaHtml": meta,
            "viewUrl": $("#urlTopic").val(),
            "imageSrc": $("#urlImage").val(),
            "metaTitle": $("#metaSeoTitle").val(),
            "metaDescription": $("#metaSeoDescription").val(),
            "metaKeyword": $("#metaKeyWord").val(),
            "metaRobot": $("#metaSeoRobot option:selected").val(),
        }
    }

    console.log(topic)
    // save topic trước: id user, id course
    ajaxCallPost("topic/save/" + idUser + "/" + $("#courseOfTopic option:selected").val(), topic).then(rs1 => {
        alertSuccess("Lưu bài viết thành công");
        console.log(rs1);
        idTopic = rs1.data.id;
        if (listTag != null && $("#tagTopic").val() != "") {
            $("#tagTopic").css({"border": "1px solid #ccc"})
            // duyệt vòng lặp theo mảng tag cắt được ở trên
            for (let i = 1; i < listTag.length; i++) {
                console.log(listTag[i])
                //find name tag, nếu k có name  thì sẽ thêm tag mới
                // nếu có sẽ lưu từng tag tương ứng với idtopic
                ajaxCallGet("tag/find-by-name?name=" + listTag[i]).then(rs => {
                    console.log(rs)
                    ajaxCallPost("topic-has-tag/save/" + idTopic + "/" + rs.data.id).then(rs1 => {
                        console.log(rs1);
                        $("#postTopic").prop("disabled", false)
                    }).catch(err => {
                        $("#btnEditTopic").prop("disabled", true)
                    })
                }).catch(err => {
                    // k có tag sẽ thêm mới tag
                    if (err.responseJSON.data == null) {
                        let tag = {
                            "name": listTag[i],
                            "deleted": true
                        }
                        ajaxCallPost("tag/save", tag).then(rs => {
                            console.log(rs);
                            ajaxCallPost("topic-has-tag/save/" + idTopic + "/" + rs.data.id).then(rs1 => {
                                console.log(rs1);
                                $("#postTopic").prop("disabled", false)
                            }).catch(err => {
                                $("#btnEditTopic").prop("disabled", true)
                            })
                        })
                        // console.log(err.responseJSON)
                    } else {
                        console.log("có data")
                    }
                });
            }

        } else {
            // $("#tagTopic").css({"border": "1px solid red"})
        }
        // sau khi lưu xong sẽ load lại
        showFullTopic()
        $("#block-edit-topic").hide("slow");
    }).catch(err => {
        alertDanger("Lưu bài viết thất bại")
    })
    console.log(idTopic);
//     tạo đối tượng topic
}

// lấy các thẻ meta seo
function getSeoTopic() {
    let html = `<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="content-style-type" content="text/css">
    <meta http-equiv="content-language" content="en-vi">
    <meta name="copyright" content="spec.edu.vn">
    <meta name="keywords" content="${$("#metaKeyWord").val()}">
    <meta name="description" content="${$("#metaSeoDescription").val()}">
    <meta property="og:site_name" content="spec.edu.vn">
    <meta property="og:type" content="website">
    <meta property="og:title" content="${$("#metaSeoTitle").val()}">
    <meta property="og:description" content="${$("#metaSeoDescription").val()}">
    <meta property="og:url" content="${window.location}">
    <meta name=”robots” content=”${$("#metaSeoRobot option:selected").val()}” >
    <meta name="author" content="SpecEdu">
    <meta name="googlebot" content="index,follow,archive">
    <meta property="og:type" content="article">`;
    return html;
}

// chứa các nút ẩn hiện lên form add topic
function hideShowBtnAddTopic() {
    $(".btn-show-add-topic").click(function () {
        $("#block-edit-topic").show("slow");
    });
    $(".btn-hide-add-topic").click(function () {
        $("#block-edit-topic").hide("slow");
    });
}

function topicData(result) {
    let html = ``;
    result.data.map((item, index) => {
        html += `
             <tr>
                        <td>${index + 1}</td>
                        <td><a href="${URL_HTTP + "detail-topic/" + item.id + "/" + item.viewUrl}" target=“_blank”>${item.title}</a> </td>
                     
                        <td><span class="tag tag-success">${item.createDate}</span></td>
                       
                        <td>
                            <div class="mailbox-controls">
                                <!-- Check all button -->
                                <div class="btn-group">
                                    <button id="editTopic${index}" data-id="${item.id}" data-toggle="" title="Sửa" type="button"
                                            class="btn btn-default btn-sm btn-show-add-topic">
                                        <i class="fas fa-wrench"></i>
                                    </button>

                                    <button onclick="removeTopic(${item.id})" title="Xóa" id="btnRemoveTopic${index}" data-id="${item.id}" type="button" class="btn btn-default btn-sm">
                                        <i class="far fa-trash-alt"></i>
                                    </button>

                                </div>
                                <!-- /.btn-group -->

                            </div>
                        </td>
                    </tr>
            `;
    })
    $("#tableShowAllTopic").html(html)
    hideShowBtnAddTopic();
    saveEditTopic(getItemLocalStorage("lengthTopic"))
    // removeTopic(getItemLocalStorage("lengthTopic"))
}

// show full bản topic
function showFullTopic() {
    ajaxCallGet("topic/find-all").then(rs => {
        if (rs.data.length > 0) {
            topicData(rs);
            setItemLocalStorage("lengthTopic", rs.data.length)
        } else {
            alertDanger('Không có kết quả tìm kiếm')
        }
    }).catch(err => {
        console.log(err)
        alertDanger("eeeee")
        alertDanger('Không có kết quả tìm kiếm.')
    })

}

//
function searchTopic() {
    ajaxCallGet("topic/find-by-title/" + $("#inputSearchTopic").val()).then(rs => {
        console.log(rs)
        if (rs.data.length > 0) {
            topicData(rs);
        } else {
            alertDanger('Không có kết quả tìm kiếm')
        }
    }).catch(err => {
        alertDanger('Không có kết quả tìm kiếm')
    })
}

// chỉnh sửa topic
// param: id topic
function editTopic(id) {
    $("#postTopic").css({"display": "none"})
    $("#postTopic").prop("disabled", true)

    $("#btnEditTopic").css({"display": "inline"})
    $("#btnEditTopic").prop("disabled", false)

    $("#postTopic").prop("disabled", false)


    ajaxCallGet("topic/find-by-idtopic/" + id).then(rs => {
        console.log(rs)
        // khởi tạo editor,lúc nào dùng thì khởi tạo
        // làm giống như này nhé
        setTimeout(()=>{
            tinymce.get(subContent).setContent(rs.data.introduct)
            tinymce.get(mainContent).setContent(rs.data.content)
        },1000)

        $("#titleTopic").val(rs.data.title)
        $("#urlTopic").val(rs.data.viewUrl)
        $("#urlImage").val(rs.data.imageSrc)
        $("#metaSeoTitle").val(rs.data.metaTitle)
        $("#metaSeoDescription").val(rs.data.metaDescription)
        $("#metaKeyWord").val(rs.data.metaKeyword)
        $("#courseOfTopic option[value=" + `${rs.data.idCourse.id}` + "]").prop("selected", true)

    })
}

// func này để xử lý nút lưu topic khi thay đổi nội dung xong
function saveEditTopic(lengthTopic) {
    for (let i = 0; i < lengthTopic; i++) {
        $("#editTopic" + i).click(() => {
            editTopic($("#editTopic" + i).attr("data-id"))
            $("#btnEditTopic").attr("data-id", $("#editTopic" + i).attr("data-id"))
            $("#btnEditTopic").click(() => {
                if ($("#btnEditTopic").attr("data-id") === $("#editTopic" + i).attr("data-id")) {
                    postTopic($("#btnEditTopic").attr("data-id"))
                }
            })
        })
    }
}

// xóa topic
async function removeTopic(id) {
    let text = 'Bạn có thực sự muốn xóa bài viết này';
    let confirm = await sweetAlert2(text);
    if(confirm) {
        let options = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
                // 'Content-Type': 'application/x-www-form-urlencoded',
            }
        }
        fetch('/api/v1/public/topic/delete' + '/' + id, options)
            .then(function(response) {
                return response.json();
            })
            .then(function (datas) {
                console.log(datas);
                showFullTopic()
                alertSuccess('Xoa phieu mua thanh cong');
            })
    } else {
        alertInfo('Thank u!!!');
    }

}

// clear hết dữ liệu cũ của sub window add topic
function clearDataTopic() {
    $("#postTopic").css({"display": "inline"})
    $("#postTopic").prop("disabled", false)

    $("#btnEditTopic").css({"display": "none"})
    $("#btnEditTopic").prop("disabled", true)
    tinymce.get(subContent).setContent("")
    tinymce.get(mainContent).setContent("")
    $("#titleTopic").val("")
    $("#urlTopic").val("")
    $("#urlImage").val("")
    $('#viewSeo').summernote('editor.insertText', "");
    $("#metaSeoTitle").val("")
    $("#metaSeoDescription").val("")
    $("#metaKeyWord").val("")

}



