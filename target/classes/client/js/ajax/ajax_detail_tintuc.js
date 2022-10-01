

window.onload = function () {
    let url = window.location.href.split("/")
    let idTopic = url[url.length - 2]
    let urlHead = url[0] + "//" + url[2] + "/";

    showDetailTinTuc(idTopic, urlHead)
    // showTopicLQ(idTopic, urlHead)
    showCourseOftintuc(urlHead)
}


// show nội dung chi tiêt tin tức
function showDetailTinTuc(idTopic, url) {

    ajaxCallGet("topic/find-by-idtopic/" + idTopic).then(rs => {

        let html = `
        <a href="spec.edu.vn">Trang chủ</a>
                <span class="bc"><i class="fas fa-chevron-right"></i></span>
                <a href="${url + "tintuc"}">Tin tức</a>
                <span class="bc"><i class="fas fa-chevron-right"></i></span>
                <a href="#">${rs.data.title}</a>
        `;

        $("#urlDetailTinTuc").html(html)
        $("#head").append(rs.data.metaHtml)
        $("#add-detatil-topic").html(rs.data.content);
        // showCourseOfTopic(rs.data.idCourse.id, url)


    }).catch(err => {
        $("#add-detatil-topic").html("<span>Rất tiếc, nội dung này không tồn tại.</span>");
    })


}

// show khóa học mà bài viết này đang hướng đến
function showCourseOfTopic(id, url) {
    let html = ``

    ajaxCallGet("course/find-by-id/" + id).then(rs => {

        let newPrice="";
        if (rs.data.percentOfPromotion>0){
            newPrice = formatNumber(rs.data.tuitionFeeAfterReduction,".",".")+"đ" ;
        }else{
            newPrice =formatNumber(rs.data.studentFees,'.','.') +"đ";
        }
        html += `
                        <div class="course-thumbnail">
                            <img src="${rs.data.image}"
                                 alt="Lập trình di động">
<!--                                 onerror="this.onerror=null;this.src='/resources/image/thumbnail.jpg'"-->
                        </div>
                        <div  class="course-info" style="padding: 0px 10px 0px 10px">
                            <div class="course-price">

                                <div class="new-price">
                                    <span class="techmaster-price">${newPrice}</span>đ
                                </div>
                            </div>

                            <div class="course-info-item">
                                <div class="course-info-item-i">
                                    <i class="far fa-calendar"></i>
                                </div>
                                <div class="course-info-item-content my-tooltip">
                                    ${rs.data.section}
                                </div>
                            </div>

                            <div class="course-info-item">
                                <div class="course-info-item-i">
                                    <i class="far fa-money-bill-alt"></i>
                                </div>
                                <div class="course-info-item-content">
                                     <span> Hỗ trợ học phí khoá tiếp theo</span>
                                </div>
                            </div>

                        </div>
                        <div class="course-btn">
                            <a target="_blank" href="${URLHTTP + "khoa-hoc-spec/" + rs.data.id + "/" + rs.data.urlView}" class="btn-buy-now">
                                <button class="btn btn-red" style="width: 100%">Xem chi tiết</button>
                            </a>
                        </div>  
            `
        $("#priceCourseOfTintuc").html(html)
    })

}

// show những bài viết liên quan theo topic hiện tại
function showTopicLQ(id, url) {
    let html = `<h4 class="margin-bottom-15">
                               Bài viết liên quan
                            </h4>`
    let listTag = []
    ajaxCallGet("topic-has-tag/find-by-idtopic?id=" + id).then(rs => {
        rs.data.map(items => {
            html += ` 

                            <div class="related-item">
                                <a href="${url}detail-topic/${items.topic.id}/${items.topic.viewUrl}" target="_blank">
                                    ${items.topic.title}
                                </a>
                            </div>
            `
        })
        $("#showBaiVietLQ").html(html)
    }).catch(err => {
        $("#showBaiVietLQ").html("<span>Không có bài viết liên quan.</span>")
    })
}

// show những khóa học hay trong chi tiết tin tức
function showCourseOftintuc(url) {
    let html = ` <h4 class="margin-bottom-15"> Khoá học hay </h4>`
    ajaxCallGet("course/find-by-name-image-subcontent-createdate/0").then(rs => {
        rs.data.map(items => {
            html += ` 

                            <div class="related-item">
                                <a href="${URLHTTP + "khoa-hoc-spec/" + items.id + "/" + items.urlView}" target="_blank">
                                    ${items.name}
                                </a>
                            </div>
            `
        })
        $("#showCourseOftintuc").html(html)
    })
}




