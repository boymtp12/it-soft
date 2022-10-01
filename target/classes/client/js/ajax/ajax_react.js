$(function () {
    let url = window.location.href.split("/")
    url = url[0] + "/" + "/" + url[2] + "/"
    let url2 = window.location.href.split("/")
    let id = url2[url2.length - 2]
    console.log(id)
    addCourseHeaderNative(url)
    callCourseLq(url)
    ajaxCallGet("course/find-by-id/" + id).then(function (rs) {
        $("#openingDay").html(rs.data.openingDay);
        $("#studyTime").html(rs.data.studyTime)
        $("#studentFees").html(formatNumber(rs.data.studentFees, ".", "."))
        if (rs.data.percentOfPromotion == 0){
            $("#hideStudentFees").css("display","none")
        }
        $("#tuitionFeeAfterRedution").html(formatNumber(rs.data.tuitionFeeAfterReduction, ".", "."))
    })

})

function callCourseLq(url) {
    let html = "";
    ajaxCallGet("course/find-limit/6").then(rs => {
        rs.data.map(item => {
            if (item.urlView === "android-tutorial") {
                html += `
        <div class="col-sm-6 col-md-4 col-lg-4 d-flex align-items-stretch">
                        <div class="product-item">
                            <a href="${url + "khoa-hoc-spec/13/android-tutorial"}" style="text-decoration: none;">
                                <div class="product-item-img1">
                                    <img src="${item.image}" alt="abccccc">
                                </div>
                                <div class="product-item-text">
                                    <h4 class="product-item-name">${item.name}</h4>
                                </div>
                            </a>
                        </div>
                    </div>
        `;
            } else {
                html += `
        <div class="col-sm-6 col-md-4 col-lg-4 d-flex align-items-stretch">
                        <div class="product-item">
                            <a href="${url + "khoa-hoc-spec/" + item.id + "/" + item.urlView}" style="text-decoration: none;">
                                <div class="product-item-img1">
                                    <img src="${item.image}" alt="abccccc">
                                </div>
                                <div class="product-item-text">
                                    <h4 class="product-item-name">${item.name}</h4>
                                </div>
                            </a>
                        </div>
                    </div>`;
            }
        })
        $("#listCourseLQ").html(html)

    })
}

function addCourseHeaderNative(url) {
    console.log(url)
    let html = ` `;
    ajaxCallGet("course/find-by-name-image-subcontent-createdate/0").then(rs => {
        rs.data.map(item => {
            if (item.urlView === "android-tutorial") {
                html += `
            <li style="position: relative"><a class="dropdown-item" href="${url + "khoa-hoc-spec/13/android-tutorial"} ">${item.name}</a></li>
            `;
            } else {
                html += `
            <li style="position: relative"><a class="dropdown-item" href="${url + "khoa-hoc-spec/" + item.id + "/" + item.urlView}">${item.name}</a></li>
            `;
            }
        })
        $("#menuKhoaHocNative").html(html)
        $("#menuKhoaHocNative").append(`<li><a class="dropdown-item" href="${url + "xemthem"}">Xem thêm</a></li>`)
    })
}