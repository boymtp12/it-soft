var imageData= null;
$(document).ready(function () {
    checkLogin()
    showImageDefault("giangvien")
    uploadImageServer()
    $("#folderSelect").change(() => {
        showImageDefault($("#folderSelect option:selected").val())
        // uploadImageServer()
    })

});

// mặc định show ảnh folder giảng viên đầu tiên
function showImageDefault(value) {
    ajaxCallGet("image/find-by-value-folder/" + value).then(rs => {
        imageData = rs;
        let content = '';
        if (rs.data.length > 0) {
            let datas = rs.data.sort((o1, o2) => {
                return o2.idimage - o1.idimage;
            });
            datas.map((item, index) => {
                content += `<tr>
                        <td>${index + 1}</td>
                        <td>
                            <img style="max-width: 180px;max-height: 100px"
                                 src="${item.src}" alt="">
                        </td>
                        <td>
                            <button onclick="clickCopyClipboardUrlImage(${index})" class="btn url-image" title="Copy to clipboard"><img
                                    src="https://img.icons8.com/material-outlined/24/000000/copy.png"/></button>
                            <input style="display: none" type="text"
                                   value="${item.src}"
                                   id="myInput${index}">
                        </td>
                        <td style="padding: 5px 10px 5px 10px">
                            <button type="button" id="deletedImage${index}" data-id="${item.idimage}" data-image="${item.name}" class="btn btn-outline-secondary" style="padding: 3px 6px">
                                <img title="Xóa" src="https://img.icons8.com/carbon-copy/20/000000/delete--v1.png"/>
                            </button>
                        </td>
                    </tr>`;

            });
            $('#listImageAdmin').html(content);
            deletedImage(rs.data.length)
        } else {
            $('#listImageAdmin').html("<span>Không có hình ảnh.</span>");
        }

    })
}

function clickCopyClipboardUrlImage(id) {
    copyToClipboard("myInput" + id)
}

// upload image
function uploadImageServer() {

    $("#inputFileImage").change(function () {
        let formData = new FormData($("form")[0]);
        ajaxCallUploadFile("upload/upload-image/" + $("#folderSelect option:selected").val(), formData).then(rs => {
            let name = rs.split("/");
            name = name[name.length - 1];
            let image = {
                "name": name,
                "src": rs,
                "status": true
            }
            // back end đã tự lưu rồi k cần phải gọi ajax để lưu
            alertSuccess("Đã tải ảnh lên.")
            showImageDefault($("#folderSelect option:selected").val())
            // setTimeout(location.reload.bind(location), 1500)

        })
    })
}
function deletedImage(lengthImage) {
    for (let i=0;i<lengthImage;i++){
        $("#deletedImage"+i).click(function (){
            console.log(lengthImage)
            console.log("aaaaaaaaaaaaaaaaaaa")
            ajaxCallGet("upload/deleted/" + $("#folderSelect option:selected").val() + "/" + $("#deletedImage"+i).attr("data-image") + "/" + $("#deletedImage"+i).attr("data-id")).then(rs => {
                alertSuccess("Xóa thành công")
                showImageDefault($("#folderSelect option:selected").val())
            }).catch(err => {
                alertDanger("Xóa thất bại")
            })
        })
    }
}
