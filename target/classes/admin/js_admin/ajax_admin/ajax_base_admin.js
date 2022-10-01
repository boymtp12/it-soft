var url = window.location.href.split("/")
const URL_HTTP = url[0] + "/" + "/" + url[2] + "/"
console.log(window.location.href.split("/"))
const URL_API = URL_HTTP + "api/v1/public/";
$(function () {

});

function TinyInit(id,height) {
    var useDarkMode = window.matchMedia('(prefers-color-scheme: dark)')
        .matches

    tinymce.init({
        selector: id,
        plugins:
            'print visualblocks image preview paste importcss searchreplace autolink autosave save directionality code visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap quickbars emoticons',
        imagetools_cors_hosts: ['picsum.photos'],
        menubar: 'file edit view insert format tools table help',
        toolbar:
            'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | ltr rtl',
        toolbar_sticky: true,
        autosave_ask_before_unload: true,
        autosave_interval: '30s',
        autosave_prefix: '{path}{query}-{id}-',
        autosave_restore_when_empty: false,
        autosave_retention: '2m',
        image_advtab: true,
        content_css :'https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css',
        formats: {
           
            bold: {inline: 'strong', classes: 'bold'},
            italic: {inline: 'i', classes: 'italic'},
            underline: {inline: 'u', classes: 'underline', exact: true},
            strikethrough: {inline: 'del'},
            forecolor: {
                inline: 'span',
                classes: 'forecolor',
                styles: {color: '%value'}
            },
            hilitecolor: {
                inline: 'span',
                classes: 'hilitecolor',
                styles: {backgroundColor: '%value'}
            },
            custom_format: {
                block: 'h1',
                attributes: {title: 'Header'},
                styles: {color: 'red'}
            }
        },
        link_list: [
            {title: 'My page 1', value: 'https://www.tiny.cloud'},
            {title: 'My page 2', value: 'http://www.moxiecode.com'}
        ],
        image_list: [
            {title: 'My page 1', value: 'https://www.tiny.cloud'},
            {title: 'My page 2', value: 'http://www.moxiecode.com'}
        ],
        image_class_list: [
            {title: 'None', value: ''},
            {title: 'Some class', value: 'class-name'}
        ],
        importcss_append: true,
        file_picker_callback: function (callback, value, meta) {
            /* Provide file and text for the link dialog */
            if (meta.filetype === 'file') {
                callback('https://www.google.com/logos/google.jpg', {
                    text: 'My text'
                })
            }

            /* Provide image and alt text for the image dialog */
            if (meta.filetype === 'image') {
                callback('https://www.google.com/logos/google.jpg', {
                    alt: 'My alt text'
                })
            }

            /* Provide alternative source and posted for the media dialog */
            if (meta.filetype === 'media') {
                callback('movie.mp4', {
                    source2: 'alt.ogg',
                    poster: 'https://www.google.com/logos/google.jpg'
                })
            }
        },
        templates: [
            {
                title: 'New Table',
                description: 'creates a new table',
                content:
                    '<div class="mceTmpl"><table width="98%%"  border="0" cellspacing="0" cellpadding="0"><tr><th scope="col"> </th><th scope="col"> </th></tr><tr><td> </td><td> </td></tr></table></div>'
            },
            {
                title: 'Starting my story',
                description: 'A cure for writers block',
                content: 'Once upon a time...'
            },
            {
                title: 'New list with dates',
                description: 'New List with dates',
                content:
                    '<div class="mceTmpl"><span class="cdate">cdate</span><br /><span class="mdate">mdate</span><h2>My List</h2><ul><li></li><li></li></ul></div>'
            }
        ],
        template_cdate_format: '[Date Created (CDATE): %m/%d/%Y : %H:%M:%S]',
        template_mdate_format: '[Date Modified (MDATE): %m/%d/%Y : %H:%M:%S]',
        height: 400,
        image_caption: true,
        quickbars_selection_toolbar:
            'bold italic | quicklink h2 h3 blockquote quickimage quicktable',
        noneditable_noneditable_class: 'mceNonEditable',
        toolbar_mode: 'sliding',
        contextmenu: 'link image imagetools table',
        skin: useDarkMode ? 'oxide-dark' : 'oxide',
        content_css: useDarkMode ? 'dark' : 'default',
        style_formats: [
            { title: 'Headers', items: [
                    { title: 'h1', block: 'h1' },
                    { title: 'h2', block: 'h2' },
                    { title: 'h3', block: 'h3' },
                    { title: 'h4', block: 'h4' },
                    { title: 'h5', block: 'h5' },
                    { title: 'h6', block: 'h6' }
                ] },

            { title: 'Blocks', items: [
                    { title: 'p', block: 'p' },
                    { title: 'div', block: 'div' },
                    { title: 'pre', block: 'pre' }
                ] },

            { title: 'Containers', items: [
                    { title: 'section', block: 'section', wrapper: true, merge_siblings: false },
                    { title: 'article', block: 'article', wrapper: true, merge_siblings: false },
                    { title: 'blockquote', block: 'blockquote', wrapper: true },
                    { title: 'hgroup', block: 'hgroup', wrapper: true },
                    { title: 'aside', block: 'aside', wrapper: true },
                    { title: 'figure', block: 'figure', wrapper: true }
                ] }
        ],
        visualblocks_default_state: true,
        end_container_on_empty_block: true,
        content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
    })

}

// kiểm tra xem trong local storage có key user k
// k có sẽ bắt login*/
function checkLogin() {
    let user = getItemLocalStorage("user");
    console.log(user)
    // let user = getItemLocalStorage("user");
    if (user != null) {
        let html = `
        <a href="admin" class="d-block" id="text-name-user" style="text-transform: capitalize">${user.data.name}</a>
        `;
        $("#idBlockSidebar").html(html)
    } else {
        window.location.href = "admin-login"
    }
}

//copy to clipboard
function copyToClipboard(id) {
    console.log(id)
    let copyText = document.getElementById(id);
    console.log(copyText)
    copyText.select();
    copyText.setSelectionRange(0, 99999)
    navigator.clipboard.writeText(copyText.value).then(() => {
        alertSuccess("Đã coppy vào clipboard")
    }).catch((error) => {
        alert(`Copy failed!`)
    })
}

/*Đăng xuất ra khỏi tk*/
function logOut() {
    sessionStorage.removeItem("user");
    // localStorage.removeItem("user");
    window.location.href = "admin-login";
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
async function ajaxCallUploadFile(url, file) {
    let data;
    await $.ajax({
        type: "POST",
        // url: "http://spec.edu.vn/api/v1/public/upload/upload-image",
        // url: URL_API+ "upload/upload-image",
        url: URL_API + url,
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

function setItemSessionStorage(key, val) {
    sessionStorage.setItem(key, JSON.stringify(val));
}

function getItemSessionStorage(key) {
    return JSON.parse(sessionStorage.getItem(key));
}



//format input type number
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

//format input type number
function formatFees(nStr, decSeperate, groupSeperate) {
    let arr = nStr.split(",");
    if (arr.length > 0) {
        // nếu phần chuỗi sau dính dấu "," nó sẽ cắt bỏ đi rồi mới gán
        arr = arr.toString().replaceAll(",", "")
        nStr = arr
    }
    nStr += '';
    x = nStr.split(decSeperate);
    x1 = x[0];
    x2 = x.length > 1 ? ',' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + groupSeperate + '$2');
    }
    return x1 + x2;
}

async function validateForm(id) {
    let form = document.getElementById(id)
    let rs = false
    // Loop over them and prevent submission
    $('#' + id).submit(function(event) {
        event.preventDefault();
        event.stopPropagation();
        $(this).addClass('was-validated')
        if (form.checkValidity() === false) {
            rs = false
            console.log("chua validae")
        } else {
            rs = true
            console.log("da validae")
        }
    })
    return rs
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
