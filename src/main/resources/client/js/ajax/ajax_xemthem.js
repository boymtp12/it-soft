$(function () {
    showAllCourseXemThem()
    showCourseOfThemeXemThem()
    addObjectCourseXemThem()

})

// show mặc định toàn bộ khóa học
function showAllCourseXemThem() {
    let html = ``;
    ajaxCallGet("course/find-by-name-image-subcontent-createdate/0").then(rs => {
        $("#listCourseXemThem").html(showCourseAjaxXemThem(rs));
    }).catch(e => {
        console.log("error")
    })
}


// show toàn bộ bộ lọc chủ đề
function showCourseOfThemeXemThem() {
    let html = `<p class="subjectTitle">Chủ đề</p>`;
    ajaxCallGet("theme/find-all").then(rs => {

        rs.data.map((item, index) => {

            html += `    <div class="md-radio">
      <input onclick="clickShowCourse(${item.id})"  type="radio" id="themeXemThem${index}" name="Chủ đề"
              class="course-filter" value="${item.id}"/> <label
                        for="themeXemThem${index}" class="subjectTitleLabel">
                               ${item.name}
                       </label></div>
            `
        })
        $(".themeXemThem").html(html)
        // console.log($(".themeXemThem >div >input:selected").val())
    })
}

function addObjectCourseXemThem() {

    let html = `
     <p class="subjectTitle">Đối tượng người học</p>
                                    <div class="md-radio">
                                        <input type="radio" onclick="clickShowCourseOfObjCourse(${0})" id="Doanh nghiệp"
                                                                 name="Đối tượng người học" class="course-filter"
                                                                 value="Doanh nghiệp">
                                        <label for="Doanh nghiệp" class="subjectTitleLabel">
                                        Doanh nghiệp
                                    </label></div>
                                    <div class="md-radio">
                                        <input onclick="clickShowCourseOfObjCourse(${1})" type="radio" id="Lớp tối" name="Đối tượng người học"
                                                                 class="course-filter" value="Lớp tối">
                                        <label for="Lớp tối" class="subjectTitleLabel">
                                        Lớp tối
                                    </label></div>

                                    <div class="md-radio">
                                        <input onclick="clickShowCourseOfObjCourse(${2})" type="radio" id="Thiếu nhi" name="Đối tượng người học"
                                                                 class="course-filter" value="Thiếu nhi">
                                        <label for="Thiếu nhi" class="subjectTitleLabel">
                                        Thiếu nhi
                                    </label></div>
                                    <div class="md-radio">
                                        <input onclick="clickShowCourseOfObjCourse(${3})" type="radio" id="Học từ đầu" name="Đối tượng người học"
                                                                 class="course-filter" value="Học từ đầu">
                                        <label for="Học từ đầu" class="subjectTitleLabel">
                                        Học từ đầu
                                    </label></div>
    `
    $(".addObjectCourseXemThem").html(html)
}

//click vao doi tuong nguoi hoc sẽ ra các khóa học theo đối tượng
function clickShowCourseOfObjCourse(index) {
    let arr = ["Doanh nghiệp", "Lớp tối", "Thiếu nhi", "Học từ đầu"]
    ajaxCallGet("course/find-by-name-object/" + arr[index]).then(rs => {
        rs.data.length != 0 ? $("#listCourseXemThem").html(showCourseAjaxXemThem(rs)) : $("#listCourseXemThem").html("<span>Không có khóa học nào phù hợp.</span>")
    }).catch(e => {
        $("#listCourseXemThem").html("<span>Không có khóa học nào phù hợp.</span>")
    })
}

// show những khóa học đc giảm giá
function clickShowCoursePromotions() {
    ajaxCallGet("course/find-by-promotion").then(rs => {
        rs.data.length != 0 ? $("#listCourseXemThem").html(showCourseAjaxXemThem(rs)) : $("#listCourseXemThem").html("<span>Không có khóa học nào phù hợp.</span>")
    }).catch(e => {
        $("#listCourseXemThem").html("<span>Không có khóa học nào phù hợp.</span>")
    })
}

// mỗi lần click vào bộ lọc  sẽ add lại khóa học mới
function clickShowCourse(id) {
    ajaxCallGet("course/find-by-idtheme/" + id).then(rs => {

        rs.data.length != 0 ? $("#listCourseXemThem").html(showCourseAjaxXemThem(rs)) : $("#listCourseXemThem").html("<span>Không có khóa học nào phù hợp.</span>")

    }).catch(e => {
        $("#listCourseXemThem").html("<span>Không có khóa học nào phù hợp.</span>")
    })
}

// show khóa học sau khi nhận kq từ các ajax
function showCourseAjaxXemThem(rs) {
    let html = ``
    rs.data.map(item => {
        let html2="";
        let newPrice="";
        let oldPrice = "";
        if (item.percentOfPromotion>0){
            html2=`<div class="product_sale1" >-${item.percentOfPromotion}%</div>`;
            newPrice = formatNumber(item.tuitionFeeAfterReduction,".",".")+"đ" ;
            oldPrice =formatNumber(item.studentFees,'.','.') +"đ";
        }else{
            newPrice =formatNumber(item.studentFees,'.','.') +"đ";
            oldPrice ="";
        }
        // let    oldprice = formatNumber(item.studentFees, '.', '.')+"đ";
        // let   newprice = formatNumber(item.studentFees - (item.studentFees/100)*item.percentOfPromotion, '.', '.')+"đ";
        // }
        if (item.urlView === "android-tutorial") {
            html += `<div class="tech-card">
             <a href="${URLHTTP + "khoa-hoc-spec/13/android-tutorial"}">
                    ${html2}
                    <div class="course-thumbnail" style="min-height: 200px"><img src="${item.image}" alt="Java mobile"></div>
                     <div class="course-info" style="margin: 0rem 1.5rem 0 1.5rem">
                     <p class="course-title">  ${item.name}  </p></div>
                            <div class="course-price">
                                <span class="new-price">${newPrice}</span>
                                <span class="old-price">${oldPrice}</span>
                            </div></a></div>`;
        } else {
            // let html1=""
            // item.percentOfPromotion==0 ?html1="":html1=`${"-"+item.percentOfPromotion +"%"}`;
            // item.percentOfPromotion==0 ?oldprice="":oldprice== `formatNumber(item.studentFees, '.', '.')+"đ"`;
            html += `<div class="tech-card">
             <a href="${"khoa-hoc-spec/" + item.id + "/" + item.urlView}">
                    ${html2}
                    <div class="course-thumbnail" style="min-height: 200px"><img src="${item.image}" alt="Java mobile"></div>
                     <div class="course-info" style="margin: 0rem 1.5rem 0 1.5rem">
                     <p class="course-title">  ${item.name}  </p></div>
                            <div class="course-price">
                                <span class="new-price">${newPrice}</span>
                                <span class="old-price">${oldPrice}</span>
                            </div> </a></div>`;
        }
    })
    return html;
}