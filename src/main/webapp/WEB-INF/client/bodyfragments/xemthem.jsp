<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 14/03/2021
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header style="background-image: url('client/image/images_Trang_Chu/RectangleBlue.jpg'); background-size: cover; height: 229px">
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
                    <img class="img_background" src="client/image/images_Trang_Chu/coding.png"
                         style="width: 256px"
                         alt="">
                </div>
            </div>
        </div>
    </div>
</header>


<!--Main-->
<div class="container">
    <div class="body-part">
        <div id="app-2" class="container body-content">
            <div class="row">
                <div class="col-md-12 col-xl-2 filter-desktop">
                    <div class="sticky">
                        <div class="post-sidebar-inner">
                            <div>

                                <!-- Sticky -->
                                <div class="filter-field"><p class="subjectTitle">Khuyến mãi</p>
                                    <div class="md-radio">
                                        <input onclick="showAllCourseXemThem()" type="radio" id="Mới ra mắt" name="Khuyến mãi"
                                                                 class="course-filter" value="Mới ra mắt"> <label
                                            for="Mới ra mắt" class="subjectTitleLabel">
                                        Mới ra mắt
                                    </label></div>
                                    <div class="md-radio">
                                        <input onclick="clickShowCoursePromotions()" type="radio" id="Đang giảm giá" name="Khuyến mãi"
                                                                 class="course-filter" value="Đang giảm giá"> <label
                                            for="Đang giảm giá" class="subjectTitleLabel">
                                        Đang giảm giá
                                    </label></div>
                                </div>
                                <div class="filter-field addObjectCourseXemThem">
                                    <%--    ajax addObjectCourseXemThem()--%>
                                </div>
                                <div class="filter-field themeXemThem"><p class="subjectTitle">Chủ đề</p>
                                    <%--ajax xem them showThemeXemThem()--%>
                                    <div class="md-radio"><input type="radio" id="Webfrontend-mobile3" name="Chủ đề"
                                                                 class="course-filter" value="Web frontend"> <label
                                            for="Webfrontend-mobile3" class="subjectTitleLabel">
                                        Web frontend
                                    </label></div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal dialog -->
                <div id="modal-filter" tabindex="-1" role="dialog" class="modal fade modal-filter">
                    <div role="document" class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header"><h4 class="modal-title">Lọc khoá học</h4>
                                <button type="button" data-dismiss="modal" class="close">×</button>
                            </div>
                            <div class="modal-body" style="max-height: 350px; overflow-y: scroll;">
                                <div class="filter-field"><p class="subjectTitle">Khuyến mãi</p>
                                    <div class="md-radio">
                                        <input onclick="showAllCourseXemThem()" type="radio" id="Mới ra mắt-mobile"
                                               name="Khuyến mãi"
                                               class="course-filter" value="Mới ra mắt"> <label
                                            for="Mới ra mắt-mobile" class="subjectTitleLabel">
                                        Mới ra mắt
                                    </label></div>
                                    <div class="md-radio">
                                        <input onclick="clickShowCoursePromotions()" type="radio"
                                               id="Đang giảm giá-mobile"
                                               name="Khuyến mãi" class="course-filter"
                                               value="Đang giảm giá"> <label
                                            for="Đang giảm giá-mobile" class="subjectTitleLabel">
                                        Đang giảm giá
                                    </label></div>
                                </div>
                                <div class="filter-field addObjectCourseXemThem">
                                    <%--    ajax addObjectCourseXemThem()--%>
                                </div>
                                <div class="filter-field themeXemThem"><p class="subjectTitle">Chủ đề</p>
                                    <%--ajax xem them showThemeXemThem()--%>
                                    <%--                                    <div class="md-radio"><input type="radio" id="Webfrontend-mobile" name="Chủ đề"--%>
                                    <%--                                                                 class="course-filter" value="Web frontend"> <label--%>
                                    <%--                                            for="Webfrontend-mobile" class="subjectTitleLabel">--%>
                                    <%--                                        Web frontend--%>
                                    <%--                                    </label></div> --%>

                                </div>
                            </div>
                            <div class="modal-footer"><!---->
                                <button type="button" data-dismiss="modal" class="btn btn-green">Áp dụng</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-xl-10 padding-3rem">
                    <div class="list-search">
                        <div>
                            <div class="search-course"><input type="text" placeholder="Tìm kiếm khóa học"
                                                              id="input-search-course" class="form-control"> <i
                                    class="fa fa-search btn"  ></i></div>
                            <button data-toggle="modal" data-target="#modal-filter" class="btn btn-green filter-mobile">
                                <i class="fas fa-filter"></i></button>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="list-courses" id="listCourseXemThem">
                        <%--                        ajax show all course--%>
<%--                        <div class="tech-card"><a href="java?java=4">--%>
<%--                            <div class="product_sale1" >-40%</div>--%>
<%--                            <div class="course-thumbnail"><img src="client/image/30.jpg" alt="Java mobile"></div>--%>
<%--                            <div class="course-info"><p class="course-title">--%>
<%--                                Java mobile--%>
<%--                            </p><!----></div>--%>
<%--                            <div class="course-price">--%>
<%--                                <span class="new-price">500,000đ</span>--%>
<%--                                <span class="old-price">3.500.000đ</span>--%>
<%--                            </div>--%>
<%--                        </a>--%>
<%--                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
        <style>
            [v-cloak] {
                display: none
            }

            .clear {
                clear: both
            }

            div.sticky {
                position: -webkit-sticky;
                position: sticky;
                top: 20px
            }

            #input-search-course {
                color: #5e5e5e;
                width: 100%;
                padding: 6px 40px 6px 12px
            }

            .search-course .fa-search {
                color: #c4c4c4;
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                right: 15px
            }

            #input-search-course:focus {
                border: none !important
            }

            .clear-filter {
                width: 100%;
                margin-bottom: 1.5rem
            }

            .subjectTitle {
                font-weight: bold;
                font-size: 1.1rem;
                margin-bottom: 1rem
            }

            @keyframes ripple {
                0% {
                    box-shadow: 0 0 0 1px transparent
                }
                50% {
                    box-shadow: 0 0 0 15px rgba(0, 0, 0, .1)
                }
                100% {
                    box-shadow: 0 0 0 15px transparent
                }
            }

            .md-radio {
                margin-bottom: 1rem
            }

            .md-radio.md-radio-inline {
                display: inline-block
            }

            .md-radio input[type=radio] {
                display: none
            }

            .md-radio input[type=radio]:checked + label:before {
                border-color: #337ab7;
                animation: ripple .2s linear forwards
            }

            .md-radio input[type=radio]:checked + label:after {
                transform: scale(1)
            }

            .md-radio label {
                display: inline-block;
                position: relative;
                padding: 0 0 0 30px;
                margin-bottom: 0;
                cursor: pointer;
                line-height: 20px;
                vertical-align: bottom;
                font-size: 1rem
            }

            .md-radio label:after, .md-radio label:before {
                position: absolute;
                content: '';
                border-radius: 50%;
                transition: all .3s ease;
                transition-property: transform, border-color
            }

            .md-radio label:before {
                left: 0;
                top: 0;
                width: 20px;
                height: 20px;
                border: 2px solid #3c78e8
            }

            .md-radio label:after {
                top: 5px;
                left: 5px;
                width: 10px;
                height: 10px;
                transform: scale(0);
                background: #337ab7
            }

            .filter-field {
                padding-bottom: 1.5rem
            }

            .filter-field:not(:first-child) {
                padding-top: 1.5rem
            }

            .filter-field:not(:last-child) {
                border-bottom: .5px solid #c4c4c4
            }

            .search-course {
                width: 100%;
                position: relative
            }

            .search-course input {
                outline: 0 !important;
                border-radius: 4px;
                border: none;
                box-shadow: 0 4px 4px rgba(0, 0, 0, .15);
                -webkit-box-shadow: 0 4px 4px rgba(0, 0, 0, .15)
            }

            :focus {
                outline: 0
            }

            .padding-3rem {
                padding-left: 3rem
            }

            @media (max-width: 1365px) {
                .padding-3rem {
                    padding-left: 1.5rem
                }
            }

            .list-courses, .list-search {
                display: grid;
                grid-template-columns:repeat(3, 1fr);
                grid-gap: 2rem 2rem
            }

            .list-search {
                margin-bottom: 1.5rem
            }

            .tech-card {
                position: relative;
                background-color: #fff;
                border-radius: 4px;
                border: 0;
                box-shadow: 0 2px 4px rgba(0, 0, 0, .15);
                -webkit-box-shadow: 0 2px 4px rgba(0, 0, 0, .15)
            }

            .list-courses a {
                color: #464646
            }

            .list-courses a:hover {
                text-decoration: none
            }

            .course-thumbnail {
                position: relative;
                border-top-left-radius: 4px;
                border-top-right-radius: 4px;
                overflow: hidden
            }

            .course-thumbnail::before {
                content: "";
                display: block;
                padding-top: 70%
            }

            .course-thumbnail img {
                width: 100%;
                height: 100%;
                position: absolute;
                top: 0;
                left: 0;
                object-fit: cover
            }

            .course-info {
                height: 6rem;
                display: flex;
                align-content: space-around;
                flex-wrap: wrap;
                margin: 1rem 1.5rem 0 1.5rem
            }

            .course-title {
                width: 100%;
                font-size: 1.2rem
            }

            .course-description {
                font-weight: lighter;
                color: #757575;
                width: 100%;
                font-size: .9rem;
                display: flex;
                justify-content: space-between
            }

            .course-price {
                padding:0 1.5rem 1rem 1.5rem;
                display: flex;
                align-content: flex-start;
                justify-content: space-between
            }

            .new-price {
                color: #f65623;
                font-size: 1.2rem
            }

            .old-price {
                font-size: 1.2rem;
                color: #757575;
                text-decoration: line-through
            }

            .filter-desktop {
                display: block
            }

            .filter-mobile {
                display: none
            }

            @media (max-width: 1199px) {
                .filter-desktop {
                    display: none
                }

                .list-search {
                    grid-template-columns:repeat(2, 1fr)
                }

                .search-course {
                    float: left;
                    width: calc(100% - 50px)
                }

                .filter-mobile {
                    display: inline-block;
                    float: left;
                    margin-left: 10px;
                    width: 40px
                }

                .filter-field:not(:last-child) {
                    border-bottom-color: #dee2e6
                }

                .filter-field:last-child {
                    padding-bottom: 0
                }

                .padding-3rem {
                    padding-left: 15px
                }
            }

            @media (max-width: 992px) {
                .list-courses, .list-search {
                    grid-gap: 1.5rem 1.5rem
                }
            }

            @media (max-width: 767px) {
                .list-courses {
                    grid-template-columns:repeat(2, 1fr)
                }

                .list-search {
                    grid-template-columns:repeat(1, 1fr)
                }
            }

            @media (max-width: 550px) {
                .list-courses {
                    grid-template-columns:repeat(1, 1fr)
                }
            }
        </style>
    </div>
</div>

<script src="client/js/ajax/ajax_xemthem.min.js" async></script>
<%--<script src="client/js/ajax/ajax_xemthem.js"></script>--%>