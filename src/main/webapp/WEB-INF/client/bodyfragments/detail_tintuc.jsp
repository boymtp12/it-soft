<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 14/03/2021
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<sql:setDataSource
        var="myDS"
        driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/spec"
        user="root" password="123456789"/>
<%
    String uri = request.getAttribute("javax.servlet.forward.request_uri").toString();
    String id = uri.split("/")[2];
    request.setAttribute("idBaiViet", id);
    request.setAttribute("urlView", uri.split("/")[3]);
%>
<c:set var="idBaiViet" value="${requestScope['idBaiViet']}"/>
<c:set var="urlView" value="${requestScope['urlView']}"/>
<sql:query var="baiViet" dataSource="${myDS}">
    SELECT c.content, c.title
    FROM topic as c
    where c.id = ? ;
    <sql:param value="${idBaiViet}"/>
</sql:query>
<header style="background-image: url('http://localhost:9092/client/image/images_Trang_Chu/RectangleBlue.jpg'); background-size: cover; height: 229px">
    <div class="nava row">
        <div class="container">
            <div class="area">
                <ul class="circles">
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>

            <div class="row align-items-center">
                <div class="col-12 col-sm-12 col-md-12 col-lg-7 col-sm-7 " style="">
                    <p class="display-4"
                       style="font-size: 22px; font-weight: bold ; color: #EBEBEB;margin: 0">
                        VỪA HỌC VỪA ĐI LÀM
                    </p>
                    <p class="lead">
                        <b>Lập trình java cơ bản + nâng
                            cao</b>
                    </p>

                </div>
                <div class="header-img col-lg-5 col-sm-5 "
                     style=" width: 256px">
                    <img class="img_background" src="http://localhost:9092/client/image/images_Trang_Chu/coding.png"
                         style="width: 256px"
                         alt="">
                </div>
            </div>
        </div>
    </div>
</header>

<!--Main-->
<div class="c-block is-single">
    <div class="container" style="padding: 0">
        <div class="row" style="padding: 5px">
            <div class="col-12 breadcrum-div" id="urlDetailTinTuc">
                <a href="https://spec.edu.vn">Trang chủ</a>
                <span class="bc"><i class="fas fa-chevron-right"></i></span>
                <a href="https://spec.edu.vn/tintuc">Tin tức</a>
                <span class="bc"><i class="fas fa-chevron-right"></i></span>
                <a href="#">${baiViet.rowsByIndex[0][1]}</a>
                <%--                <a href="spec.edu.vn">Trang chủ</a>--%>
                <%--                <span class="bc"><i class="fas fa-chevron-right"></i></span>--%>
                <%--                <a href="">Tin tức</a>--%>
                <%--                <span class="bc"><i class="fas fa-chevron-right"></i></span>--%>
                <%--                <a href="">Dạy lập trình Java cho trẻ và những điều bạn cần biết</a>--%>
            </div>
        </div>

        <div class="row main-post media-table">
            <div class="col-lg-8 col-sm-12 col-md-8  post"
                 style="margin:15px 0px;background-color:#ffffff85;padding:5px">
                <div class="post_left">
                    <article class="block-detail-topic" id="add-detatil-topic">
                        ${baiViet.rowsByIndex[0][0]}
                    </article>
                    <div class="post-comments">
                        <h1 class="title-comments-box" style="font-weight: 600;font-size: 2em;">Bình luận</h1>
                        <div class="list-cmt">
                        </div>
                        <div class="comments-box" id="writeComment">
                            <span class="note" style="color: blue;">* Vui lòng <a class="show-modal-login"
                                                                                  style="color: red;"
                                                                                  href="">đăng nhập</a> trước khi bình luận.</span>
                            <div class="comment row">
                                <div class="comment-author-avatar col-2 col-sm-2 col-md-1 col-lg-1 col-xl-1">
                                    <img src="https://spec.edu.vn/admin/plugin_admin/dist/img/avatar5.png"
                                         alt="Ảnh đại diện">
                                </div>
                                <div class="comment-author-content col-10 col-sm-10 col-md-11 col-lg-11 col-xl-11">
                                    <textarea class="cmts-area" placeholder="Viết bình luận..." data-autoresize=""
                                              onkeyup="UpdateContentCmt(this,e)"></textarea>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-12 col-md-4 fixedsticky" style="margin: 15px 0px;padding: 0px 10px">
                <div class="post_right">

                    <%--                    <div class="frame-div" id="priceCourseOfTintuc">--%>
                    <%--                    </div>--%>

                    <%--                    <div class="post_right1">--%>
                    <%--                        <a href="" style="color: #464646; text-decoration: none">--%>
                    <%--                            <div class="author">--%>
                    <%--                                <div class="author-avatar">--%>
                    <%--                                    <img src="http://spec.edu.vn/uploadfileimage/image/a4.png" alt="">--%>
                    <%--                                </div>--%>
                    <%--                                <div class="author-info">--%>
                    <%--                                    <div class="author-name">--%>
                    <%--                                        <b>Hoan Lê</b>--%>
                    <%--                                    </div>--%>
                    <%--                                    <div class="count-post">--%>
                    <%--                                        13 bài viết--%>
                    <%--                                    </div>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                        <div class="heading-article heading-article--highlight">--%>
                    <%--                            <h4 class="margin-bottom-15">--%>
                    <%--                                Các đầu mục bài viết--%>
                    <%--                            </h4>--%>
                    <%--                            <div id="toc">--%>
                    <%--                                <ul>--%>
                    <%--                                    <li class="toc-h2 toc-active"><a href="">Lập trình Java là gì?</a></li>--%>
                    <%--                                    <li class="toc-h2"><a href="">Tại sao nên cho trẻ tiếp cận với ngôn ngữ lập trình--%>
                    <%--                                        Java?&nbsp;</a></li>--%>
                    <%--                                    <li class="toc-h2"><a href="">Trẻ học lập trình Java có khó hay dễ</a></li>--%>
                    <%--                                    <li class="toc-h2"><a href="">SPEC- trung tâm dạy lập trình Java uy tín và chuyên--%>
                    <%--                                        nghiệp cho trẻ em&nbsp;</a></li>--%>
                    <%--                                    <li class="toc-h2"><a href="">Đề cương Lập trình Java cho trẻ</a></li>--%>
                    <%--                                </ul>--%>
                    <%--                            </div>--%>

                    <%--                        </div>--%>
                    <%--                    </div>--%>


                    <div class="post_right1">
                        <div id="showCourseOftintuc" class="related-courses heading-article--highlight">
                            <h4 class="margin-bottom-15"> Khoá học hay </h4>
                            <sql:query var="listKhoaHoc" dataSource="${myDS}">
                                SELECT c.id, c.name, c.url_view
                                FROM course as c
                                WHERE c.deleted = true order by c.id desc;
                            </sql:query>
                            <c:forEach var="row2" items="${listKhoaHoc.rows}">
                                <div class="related-item">
                                    <a href="https://spec.edu.vn/khoa-hoc-spec/${row2.id}/${row2.url_view}"
                                       target="_blank">
                                            ${row2.name}
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="post_right1">
                        <div id="showBaiVietLQ" class="related-courses heading-article--highlight">
                            <h4 class="margin-bottom-15">
                                Bài viết liên quan
                            </h4>
                            <sql:query var="listBaiViet" dataSource="${myDS}">
                                SELECT c.id, c.title, c.view_url
                                FROM topic as c
                                WHERE c.deleted = true order by c.id desc limit 6
                            </sql:query>
                            <c:forEach var="row2" items="${listBaiViet.rows}">
                                <div class="related-item">
                                    <a href="https://spec.edu.vn/detail-topic/${row2.id}/${row2.view_url}"
                                       target="_blank">
                                            ${row2.title}
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div style="margin-top: 2rem">
                        <div class="ml-rcm" rc-type="job" rc-layout="bjobs" rc-li="3" rc-for="url"
                             rc-title="Những việc làm hấp dẫn"
                             token-site="aSiWdrlopWgURBvaU7f%2F1kA%2BUJvdFhC4h7JaqdsgiCfXzOaq30WLBnGN9WJk9uXcGqwT41Zlj8joUzWeeMcNJg%3D%3D"
                             animate="off">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- container -->
</div>
<%--<script src="https://spec.edu.vn/client/js/ajax/ajax_detail_tintuc.min.js" async></script>--%>
<%--<script src="http://localhost:9665/client/js/ajax/ajax_detail_tintuc.js"></script>--%>