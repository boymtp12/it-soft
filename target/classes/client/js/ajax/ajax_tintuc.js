
window.onload = function () {
    showAllNews()
    showTagNews()
}


//show all tin tức
function showAllNews() {
    let html = ``
    ajaxCallGet("topic/find-by-name-imagesrc-introduct-creatdate").then(rs => {
        rs.data.map(item => {
            // rs.data.map(items => {
            html += `<div class="content-inner row" style="height:auto !important">
                                  <div class="entry-top col-lg-6 col-md-6 col-xs-12 col-12">
                                        <div class="post-formats-wrapper">
                                        <a class="post-image" href="detail-topic/${item.id}/${item.viewUrl}" alt=""><img src="${item.imageSrc}" alt=""></a></div>
                                    </div><!-- .entry-top -->

                                    <div class="entry-content col-lg-6 col-md-6 col-xs-12 col-12">
                                        <header class="entry-header">
                                            <h2 class="entry-title"><a href="detail-topic/${item.id}/${item.viewUrl}" rel="bookmark">${item.title}</a></h2> </header>
                                        <!-- .entry-header -->

                                        <div class="entry-button-meta">
                                            <div class="entry-meta">
                                                <div class="entry-summary">
                                                    <p class="titleCourse">${item.introduct} </p>
                                                </div><!-- .entry-summary -->                                             
                                            </div><!-- .entry-content -->
                                        </div> <!-- .content-inner -->
                                    </div>
                                </div>
            `;
        })
        $("#listNews").html(html)
    }).catch(e => {
        console.log("error")
    })
}


//show all tag
function showTagNews() {
    let html = ``
    ajaxCallGet("tag/find-all").then(rs => {
        rs.data.map(items => {
            html += `
            <a onclick="clickShowNews(${items.id})" class="tag-cloud-link tag-link-1689 tag-link-position-1" 
            style="font-size: 8.7466666666667pt;" >${items.name}</a>`
        })
        $("#showTagNews").html(html)
    })
}


function showNewsAjax(item, html) {

    html += `<div class="content-inner row" style="height:auto !important">
                                    <div class="entry-top col-lg-6 col-md-6 col-xs-12 col-12">
                                        <div class="post-formats-wrapper">
                                        <a class="post-image" href="detail-topic/${item.id}/${item.viewUrl}" alt=""><img src="${item.imageSrc}" alt=""></a></div>
                                    </div><!-- .entry-top -->

                                    <div class="entry-content col-lg-6 col-md-6 col-xs-12 col-12">
                                        <header class="entry-header">
                                            <h2 class="entry-title"><a href="detail-topic/${item.id}/${item.viewUrl}" rel="bookmark">${item.title}</a></h2> </header>
                                        <!-- .entry-header -->

                                        <div class="entry-button-meta">
                                            <div class="entry-meta">
                                                <div class="entry-summary">
                                                    <p class="titleCourse">${item.introduct} </p>
                                                </div><!-- .entry-summary -->                                             
                                            </div><!-- .entry-content -->
                                        </div> <!-- .content-inner -->
                                    </div>
                                </div>`;

    return html;
}


//click tag ra bài viết tương tự
// click tag ra bài viết theo tag chứ kp click tag ra trang khóa học
function clickShowNews(index) {
    // let arr = ["java", "full-stack", "python", "minecraft","robot","scrath","react-native"]
    let html = ``;
    ajaxCallGet("topic-has-tag/find-by-idtag?id=" + index).then(rs => {
        if (rs.data.length === 0) {
            $("#listNews").html("<span>Không có tin tức nào phù hợp.</span>")
        } else {
            rs.data.map(item => {
                html += `<div class="content-inner row" style="height:auto !important">
                                    <div class="entry-top col-lg-6 col-md-6 col-xs-12 col-12">
                                        <div class="post-formats-wrapper">
                                        <a class="post-image" href="detail-topic/${item.topic.id}/${item.topic.viewUrl}" alt=""><img src="${item.topic.imageSrc}" alt=""></a></div>
                                    </div><!-- .entry-top -->

                                    <div class="entry-content col-lg-6 col-md-6 col-xs-12 col-12">
                                        <header class="entry-header">
                                            <h2 class="entry-title"><a href="detail-topic/${item.topic.id}/${item.topic.viewUrl}" rel="bookmark">${item.topic.title}</a></h2> </header>
                                        <!-- .entry-header -->

                                        <div class="entry-button-meta">
                                                <div class="entry-summary">
                                                    <p class="titleCourse">${item.topic.introduct} </p>
                                                </div><!-- .entry-summary -->                                             
                                            </div><!-- .entry-content -->
                                        </div> <!-- .content-inner -->
                                    </div>
                                </div>`;
            })
            $("#listNews").html(html)
        }
    }).catch(e => {
        $("#listNews").html("<span>Không có tin tức nào phù hợp.</span>")
    })
}