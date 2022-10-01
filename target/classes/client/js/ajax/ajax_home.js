$(function () {

    showListCourseHome();
    showNewsHome();
    showSlideImageTeacherHome()
});

function actionSLide() {
    $(".owl-carousel").owlCarousel({
        autoPlay: 3000,
        items: 3,
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [979, 1],
        center: true,
        nav: true,
        loop: true,
        responsive: {
            800: {
                items: 3
            },
            300: {
                items: 1
            }
        }
    });
    $(".owl-carousel> .owl-wrapper-outer >.owl-wrapper >.owl-item >.item >img").css({"height": "450px"})
}

function showSlideImageTeacherHome() {
    let html = "";
    ajaxCallGet("teacher/find-all").then(rs => {
        rs.data.map((item, index) => {
            index === 0 ? html += `<div class="item">
                                     <img class="d-block w-100" src="${item.imageSlide}" alt="First slide"></div> `
                : html += `<div class="item">
                            <img class="d-block w-100 " src="${item.imageSlide}" alt="First slide"></div> `;

        })
        let blockSlide = `
        <div class="product">
        <div class="container">
            <div id="" class="carouseller ">
                <div class="carouseller-header">
                    <a href="javascript:void(0)" class="carouseller__left"><i class="fas fa-chevron-left"></i></a>
                    <a href="giangvien" class="title-session text-center" style="font-weight: 600;">ĐỘI NGŨ GIẢNG VIÊN SPEC</a>
                    <a href="javascript:void(0)" class="carouseller__right"><i class="fas fa-chevron-right"></i></a>
                </div>
                <div class="page-content page-container" id="page-content">
                    <div class="padding">
                        <div class="row container-fluid" style="padding: 0">
                            <div class="col-lg-12 grid-margin stretch-card" style="padding: 0">
                                <div class="card">
                                    <div class="card-body">

                                        <div class="owl-carousel" style="display: inline!important;">
                                            ${html} 
                                        </div>
                                      
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        `;
        $("#zone2").html(blockSlide)
        actionSLide()
    })
}

function showListCourseHome() {
    let html = ``;
    ajaxCallGet("course/find-by-name-image-subcontent-createdate/6").then(rs => {
        rs.data.map(items => {

            let html2 = "";
            if (items.percentOfPromotion > 0) {
                html2 = `<div class="product-sale"><span>-${items.percentOfPromotion}%</span> </div>`
            }
            if (items.urlView === "android-tutorial") {
                html += `   <div   class="col-sm-6 col-md-4 col-lg-4 d-flex align-items-stretch">
                        <div  class="product-item" style="height: 450px">    
                                             ${html2}
                            <a style="height:100%; display: block " href="${URLHTTP + "khoa-hoc-spec/13/android-tutorial"}  " >
                                <div class="product-item-img" style="height: 55%;display: flex"> 
                                    <img style="min-height: 100%;min-width: 100%" src="${items.image}" alt="abccccc">
                                </div>
                                <div class="product-item-text" style="height: 45%">
                                    <h4 class="product-item-name">${items.name}</h4>
                                    <p class="product-item-title"> ${items.subContent}</p>
                                    <span class="product-item-price">Học phí: ${formatNumber(items.tuitionFeeAfterReduction, '.', '.')}</span>
                                </div>
                            </a>
                   </div>
                    </div>`;
            }else if (items.urlView === "khoa-hoc-lap-trinh-c-sharp") {
                html += `   <div   class="col-sm-6 col-md-4 col-lg-4 d-flex align-items-stretch">
                        <div  class="product-item" style="height: 450px">    
                                             ${html2}
                            <a style="height:100%; display: block " href="${URLHTTP + "khoa-hoc-spec/21/khoa-hoc-lap-trinh-c-sharp"}  " >
                                <div class="product-item-img" style="height: 55%;display: flex">
                                    <img style="min-height: 100%;min-width: 100%" class="img-thumbnail" src="${items.image}" alt="abccccc">
                                </div>
                                <div class="product-item-text" style="height: 45%">
                                    <h4 class="product-item-name">${items.name}</h4>
                                    <p class="product-item-title"> ${items.subContent}</p>
                                    <span class="product-item-price">Học phí: ${formatNumber(items.tuitionFeeAfterReduction, '.', '.')}</span>
                                </div>
                            </a>
                   </div>
                    </div>`;
            } else {
                html += `   <div   class="col-sm-6 col-md-4 col-lg-4 d-flex align-items-stretch">
                        <div  class="product-item" style="height: 450px">     
                            ${html2}            
                            <a style="height:100%; display: block " href="${"khoa-hoc-spec/" + items.id + "/" + items.urlView} " >
                                <div class="product-item-img" style="height: 55%;display: flex">
                                    <img style="min-height: 100%;min-width: 100%" class="img-thumbnail" src="${items.image}" alt="abccccc">
                                </div>
                                <div class="product-item-text" style="height: 45%">
                                    <h4 class="product-item-name">${items.name}</h4>
                                    <p class="product-item-title"> ${items.subContent}</p>
                                    <span class="product-item-price">Học phí: ${formatNumber(items.tuitionFeeAfterReduction, '.', '.')}</span>
                                </div>
                            </a>
                   </div>
                    </div>`;
            }

        })
        $("#listCourseHome").html(html)
    })
}

function showNewsHome() {
    let html = ``
    ajaxCallGet("topic/find-by-name-imagesrc-introduct-creatdate/" + 4).then(rs => {
        rs.data.map(items => {
            html += `<div class="post">
                            <div class="post-thumbnail">
                                <img src="${items.imageSrc}" alt="post-thumbnail">
                            </div>
                            <a href="detail-topic/${items.id}/${items.viewUrl}">
                                <div class="post-info">
                                    <div class="post-title">${items.title}</div>
                                    <div class="post-author">
                                        
                                    </div>
                                    <div class="showmore">Xem thêm</div>
                                </div>
                            </a>
                            <div class="clear"></div>
                        </div>
            `
        })
        $("#listNewsHome").html(html)
    })
}

