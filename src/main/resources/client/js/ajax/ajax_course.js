$(function () {
    let url = window.location.href.split("/");
    let idCourse = url[url.length - 2]
    showCourse(idCourse)
    showKhoaHocLienQuan()
    showTopicLQ(idCourse)
    $("#contentCourse").css({"background-image": `url(${URLHTTP}client/image/bg_khoa_hoc.jpg)`})
})

function showCourse(idCourse) {
    ajaxCallGet("course/find-by-id/" + idCourse).then(rs => {
        $("#contentCourse").html(rs.data.mainContent)
        $("#nameCourseHead").html(rs.data.name)
        let html = `
                        <div class="c-course-detail__row is-icon">
                            <span class="icon24-newspaper"></span>
                            <label>Nội dung</label>
                            <p>${rs.data.subContent}</p>
                        </div>
                        <div class="c-course-detail__row is-icon">
                            <span class="icon24-age"></span>
                            <label>Độ tuổi</label>
                            <p>${rs.data.age} tuổi</p>
                        </div>
                        <div class="c-course-detail__row is-icon">
                            <span class="icon24-books"></span>
                            <label>Học phần</label>
                            <p>${rs.data.section}</p>
                        </div>
                        <div class="c-course-detail__row is-icon">
                            <span class="icon24-rewind-time"></span>
                            <label>Thời lượng</label>
                            <p>${rs.data.durationOfStudy}</p>
                        </div>
                        <div class="c-course-detail__row is-icon">
                            <span class="icon24-student"></span>
                            <label>Lớp tiêu chuẩn</label>
                            <p>${rs.data.numberOfStudent}</p>
                        </div>
                        <div class="c-course-detail__row is-icon">
                            <span class="icon24-warning"></span>
                            <label>Điều kiện để học</label>
                            <p>Không</p>
                        </div>
                        <div class="c-course-detail__row is-icon">
                            <span class="icon24-manual"></span>
                            <label>Giáo trình</label>
                            <p>${rs.data.document}</p>
                        </div>
                        <div class="c-course-detail__row is-icon">
                            <span class="icon24-money"></span>
                            <label>Học phí</label>
                            <p style="color: #ff0000;font-weight: 600">${formatNumber(rs.data.studentFees - (rs.data.studentFees / 100) * rs.data.percentOfPromotion, '.', '.') + "đ"}</p>
                        </div>
                        <div class="c-course-detail__row is-icon">
                            <span class="icon24-money"></span>
                            <label>Giảm giá</label>
                            <p>${rs.data.percentOfPromotion}%</p>
                        </div>`;
        $("#propertyCourse").html(html)
        let html2 = `
         <div class="author-avatar">
                                <img src="${rs.data.idTeacher.imageSrc}" alt="Ảnh giảng viên">
                            </div>
                            <div class="author-info">
                                <div class="author-name">
                                    <b>Giảng viên</b>
                                </div>
                                <div class="count-post">
                                    ${rs.data.idTeacher.name}
                                </div>
                            </div>`;
        $("#teacherCourse").html(html2)
    })
}

function showKhoaHocLienQuan() {
    let html = "";
    ajaxCallGet("course/find-by-name-image-subcontent-createdate/6").then(rs => {
        rs.data.map(item => {
            if (item.urlView === "android-tutorial") {
                html += `
        <div class="col-sm-6 col-md-4 col-lg-4 d-flex align-items-stretch">
                        <div class="product-item">
                            <a href="${URLHTTP + "khoa-hoc-spec/13/android-tutorial"}" style="text-decoration: none;">
                                <div class="product-item-img1">
                                    <img src="${ item.image}" alt="abccccc">
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
                            <a href="${URLHTTP + "khoa-hoc-spec/" + item.id + "/" + item.urlView}" style="text-decoration: none;">
                                <div class="product-item-img1">
                                    <img src="${ item.image}" alt="abccccc">
                                </div>
                                <div class="product-item-text">
                                    <h4 class="product-item-name">${item.name}</h4>
                                </div>
                            </a>
                        </div>
                    </div>
        `;
            }

        })
        $("#listCourseLQ").html(html)

    })
}
function showTopicLQ(idCourse){
    let html=``
    ajaxCallGet("topic/find-by-idcourse/"+idCourse).then(rs=>{
        if (rs.data.length>0){
            rs.data.map((item)=>{
                html+=`
        <div class="col-12">
              <a href="${URLHTTP+"detail-topic/"+item.id+"/"+item.viewUrl}" target="_blank">${item.title} </a>
        </div>`;
            })
            $("#topicOfCourse").html(html)
        }else {
            $("#topicOfCourse").html("<span>Không có khóa học liên quan</span>")
        }

    })
}

function addMetaCourse(rs) {
    let html = `
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="content-style-type" content="text/css">
    <meta http-equiv="content-language" content="en-vi">
    <meta name="copyright" content="spec.edu.vn">
    <meta name="keywords" content="${rs.data.metaKeyword}">
    <meta name="description" content="${rs.data.metaDescription}">
    <meta property="og:site_name" content="spec.edu.vn">
    <meta property="og:type" content="website">
    <meta property="og:title" content="${rs.data.metaTitle}">
    <meta property="og:description" content="${rs.data.metaDescription}">
    <meta property="og:url" content="https://spec.edu.vn">
    <meta name=”robots” content=”${rs.data.metaRobot}” >
    <meta name="author" content="SpecEdu">
    <meta name="googlebot" content="${rs.data.metaRobot}">
    <meta property="og:type" content="article">
    <meta property="og:locale" content="vi_VN">
    <meta property="og:image" content="${rs.data.image}">
    `;
    $("#head").append(html)
    $("#titleIndex").html(`${rs.data.metaTitle}`)
}