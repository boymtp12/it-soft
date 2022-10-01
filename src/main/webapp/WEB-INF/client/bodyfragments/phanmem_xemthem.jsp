<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 16/01/2022
  Time: 11:36 CH
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
<script src="client/js/ajax/ajax_phanmem_xemthem.js" async></script>

<html>
<head>
    <title>Xem thêm phần mềm</title>
</head>
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
<body>
<div class="container" style="max-width: 1473px">
    <div class="main-title">
        <p>COMBO GIÁ GỐC</p>
    </div>
<%--    col-12 col-sm-12 col-md-12 col-lg-3 col-xl-3--%>
    <div id="content" class="row">
        <div class="left-content row col-12 col-sm-12 col-md-12 col-lg-12 col-xl-9">
            <%--            render SW--%>
        </div>
        <div class="right-content col-12 col-sm-12 col-md-12 col-lg-12 col-xl-3">
            <div id="listNewsHome" class="list-post">
                <div class="post-right1">
                    <span class="post-title">PHẦN MỀM HAY</span>
                    <ul class="post-list list-sw">
                        <%--                        <li class="post-item"><a href="" class="post-link">Khóa học lập trình Java cơ bản</a></li>--%>
                        <%--                        <li class="post-item"><a href="" class="post-link">Khóa học lập trình C# nâng cao - Online</a></li>--%>
                        <%--                        <li class="post-item"><a href="" class="post-link">Khóa học lập trình C# - Online</a></li>--%>
                    </ul>
                </div>
                <div class="post-right2">
                    <span class="post-title">BÀI VIẾT LIÊN QUAN</span>
                    <ul class="post-list list-sw">
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
                        <%--                        <li class="post-item"><a href="" class="post-link">Khóa học lập trình Java cơ bản</a></li>--%>
                        <%--                        <li class="post-item"><a href="" class="post-link">Khóa học lập trình C# nâng cao - Online</a></li>--%>
                        <%--                        <li class="post-item"><a href="" class="post-link">Khóa học lập trình C# - Online</a></li>--%>
                    </ul>

                </div>

            </div>
        </div>
    </div>
</div>


<%--<div id="main">--%>
<%--    <header id="header">--%>
<%--        <div class="header__brand">--%>
<%--            <a href="" class="header__brand-logo">--%>
<%--                <img src="./css/img/logo.png" alt="LogoPage">--%>
<%--            </a>--%>
<%--        </div>--%>
<%--        <div class="header__navbar">--%>
<%--            <ul class="header__navbar-lists">--%>
<%--                <li>--%>
<%--                    Lộ trình--%>
<%--                    <i class="fas fa-angle-down"></i>--%>
<%--                    <ul class="subnav">--%>
<%--                        <li>Font End + React</li>--%>
<%--                        <li>Java Spring Boot FullStack</li>--%>
<%--                        <li>Lộ trình IOS</li>--%>
<%--                        <li>Di động React Native</li>--%>
<%--                        <li>Lộ trình DevOps</li>--%>
<%--                        <li>Code game</li>--%>
<%--                        <li>Wordpress</li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
<%--                <li>Doanh nghiệp</li>--%>
<%--                <li>--%>
<%--                    Khóa học--%>
<%--                    <i class="fas fa-angle-down"></i>--%>
<%--                    <ul class="subnav">--%>
<%--                        <li>Phòng lab</li>--%>
<%--                        <li>Trực tuyến</li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
<%--                <li>Sản phẩm học viên</li>--%>
<%--                <li>Khai giảng</li>--%>
<%--                <li>blog</li>--%>
<%--                <li>trải nghiệm</li>--%>
<%--                <li>Việc làm</li>--%>
<%--                <li>--%>
<%--                    Chúng tôi--%>
<%--                    <i class="fas fa-angle-down"></i>--%>
<%--                    <ul class="subnav">--%>
<%--                        <li>Trung tâm</li>--%>
<%--                        <li>Quy định chung</li>--%>
<%--                        <li>Giảng viên</li>--%>
<%--                        <li>Hướng dẫn đăng ký học</li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--            <div class="header__navbar-shopping">--%>
<%--                <button class="btn js-buy-course"><i class="fas fa-shopping-cart"></i></button>--%>
<%--            </div>--%>
<%--            <div class="header__navbar-user">--%>
<%--                <a href=""><i class="fas fa-user"></i></a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </header>--%>
<%--    <div id="content">--%>
<%--        <div class="content__container">--%>
<%--            <div class="content__left">--%>
<%--                <div class="pos-sticky">--%>
<%--                    Chủ đề--%>
<%--                    <form class="form__theme">--%>
<%--                        <div class="check__box"><input type="radio" name="sport" value="Big Data, AI">Big Data, AI</div>--%>
<%--                        <div class="check__box"><input type="radio" name="sport" value="Di động">Di động</div>--%>
<%--                        <div class="check__box"><input type="radio" name="sport" value="JAVA">JAVA</div>--%>
<%--                        <div class="check__box"><input type="radio" name="sport" value="Khóa học căn bản">Khóa học căn bản</div>--%>
<%--                        <div class="check__box"><input type="radio" name="sport" value="Spring Boot">Spring Boot</div>--%>
<%--                        <div class="check__box"><input type="radio" name="sport" value="Web backend">Web backend</div>--%>
<%--                        <div class="check__box"><input type="radio" name="sport" value="Web fontend">Web fontend</div>--%>
<%--                    </form>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--            <div class="modal-filter">--%>
<%--                <div class="modal-filter-container">--%>
<%--                    <div class="modal-filter-header">--%>
<%--                        <div class='filter-header'>Lọc khóa học</div>--%>
<%--                        <div class="icon-close-mobie">--%>
<%--                            <i class="fas fa-times"></i>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="modal-filter-body">--%>
<%--                        <div class="modal-filter-theme">--%>
<%--                            Chủ đề--%>
<%--                        </div>--%>
<%--                        <div class="check__box"><input type="radio" name="sport" value="Big Data, AI">Big Data, AI</div>--%>
<%--                        <div class="check__box"><input type="radio" name="sport" value="Di động">Di động</div>--%>
<%--                        <div class="check__box"><input type="radio" name="sport" value="JAVA">JAVA</div>--%>
<%--                        <div class="check__box"><input type="radio" name="sport" value="Khóa học căn bản">Khóa học căn bản</div>--%>
<%--                        <div class="check__box"><input type="radio" name="sport" value="Spring Boot">Spring Boot</div>--%>
<%--                        <div class="check__box"><input type="radio" name="sport" value="Web backend">Web backend</div>--%>
<%--                        <div class="check__box"><input type="radio" name="sport" value="Web fontend">Web fontend</div>--%>
<%--                    </div>--%>
<%--                    <div class="modal-filter-footer ">--%>
<%--                        <div class="modal-filter-apply">--%>
<%--                            <button class="apply-btn modal-filter-btn">--%>
<%--                                Áp dụng--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                        <div class="modal-filter-delete">--%>
<%--                            <button class="delete-btn modal-filter-btn">--%>
<%--                                Xóa--%>
<%--                            </button>--%>
<%--                        </div>--%>

<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="content__right">--%>
<%--                <div class="content__right-header">--%>
<%--                    <div class="list-search">--%>
<%--                        <input type="text" placeholder="Tìm kếm khóa học">--%>
<%--                        <i class="fas fa-search"></i>--%>
<%--                    </div>--%>
<%--                    <div class="filter-mobie">--%>
<%--                        <i class="fas fa-filter"></i>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="list-courses">--%>

<%--                </div>--%>

<%--            </div>--%>

<%--        </div>--%>
<%--    </div>--%>

<%--    <div id="footer">--%>
<%--        <div class="footer-container">--%>
<%--            <div class="footer-list__item">--%>

<%--                <div class="footer__item">--%>
<%--                    <h3>Chủ sở hữu website</h3>--%>
<%--                    <ul class="footer__item-infor">--%>
<%--                        <li><a href="">Công ty TNHH TechMaster Vietnam Ltd</a></li>--%>
<%--                        <li><a href="">Số ĐKDN: 0105392153</a></li>--%>
<%--                        <li><a href="">Ngày cấp: 4-7-2011</a></li>--%>
<%--                        <li><a href="">Nơi cấp: Sở kế hoạch - đầu tư Hà nội</a></li>--%>
<%--                        <li><a href="">Người đại diện pháp luật: Lê Minh Thu</a></li>--%>
<%--                        <li><a href="">Phụ trách nội dung: Trịnh Minh Cường</a></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--                <div class="footer__item">--%>
<%--                    <h3>Giới thiệu</h3>--%>
<%--                    <ul class="footer__item-infor">--%>
<%--                        <li><a href="">Học viện CNTT TechMaster</a></li>--%>
<%--                        <li><a href="">Quy định</a></li>--%>
<%--                        <li><a href="">Hướng dẫn mua khóa học</a></li>--%>
<%--                        <li><a href="">Ưu đãi và hoàn trả học phí</a></li>--%>
<%--                        <li><a href="">Bảo vệ thông tin khách hàng</a></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--                <div class="footer__item">--%>
<%--                    <h3>Tư vấn tuyển sinh</h3>--%>
<%--                    <ul class="footer__item-infor">--%>
<%--                        <li style="color: #919294;font-size:13.5px">Tư vấn viên :</li>--%>
<%--                        <li><a href="">Phạm Thị Mẫn - 0963023185</a></li>--%>
<%--                        <li><a href="">manpham@techmaster.vn</a></li>--%>
<%--                        <li><a href="">Dương Đức Thịnh - 0987273764</a></li>--%>
<%--                        <li><a href="">thinh@techmaster.vn</a></li>--%>
<%--                        <li><a href="">Tư vấn đào tạo doanh nghiệp: 090 220 9011</a></li>--%>
<%--                        <li><a href="">cuong@techmaster.vn</a></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--                <div class="footer__item">--%>
<%--                    <h3>Địa chỉ</h3>--%>
<%--                    <ul class="footer__item-infor">--%>
<%--                        <li><a href="">Cơ sở Tố Hữu: Tầng 12A, tòa nhà Viwaseen Tower, số 48, Tố Hữu, Lê Văn Lương kéo dài, Hà Nội</a></li>--%>
<%--                        <li><a href="">Cơ sở Nguyễn Đình Chiểu: 14 ngõ 4, Nguyễn Đình Chiểu, Quận Hai Bà Trưng, Hà Nội</a></li>--%>
<%--                        <li>--%>
<%--                            <a href="https://www.facebook.com/">--%>
<%--                                <i class="fab fa-facebook-square"></i>--%>
<%--                            </a>--%>
<%--                            <a href="https://www.instagram.com/">--%>
<%--                                <i class="fab fa-instagram"></i>--%>
<%--                            </a>--%>
<%--                            <a href="https://github.com/">--%>
<%--                                <i class="fab fa-github"></i>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="modal-shopping">--%>
<%--    <div class="icon-close">--%>
<%--        <i class="fas fa-times"></i>--%>
<%--    </div>--%>
<%--    <div class="modal-container-shopping">--%>
<%--        <div class="cart-inner">--%>
<%--            <h3>Giỏ hàng</h3>--%>
<%--            <div class="product-heading">--%>
<%--                <div class="row">--%>
<%--                    <div class="col col-5">--%>
<%--                        <label for="">--%>
<%--                            <input type="checkbox" name="" id="">--%>
<%--                            <span>Tất cả (1 sản phẩm)</span>--%>
<%--                        </label>--%>
<%--                    </div>--%>
<%--                    <div class="col col-2">Đơn giá</div>--%>
<%--                    <div class="col col-2">Số lượng</div>--%>
<%--                    <div class="col col-2">Thành tiền</div>--%>
<%--                    <div class="col col 1"><i class="fas fa-trash-alt"></i></div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="product-content">--%>
<%--                <div class="row">--%>
<%--                    <div class="col col-5">--%>
<%--                        <div class="row">--%>
<%--                            <div class="col col-1">--%>
<%--                                <input type="checkbox" name="" id="">--%>
<%--                            </div>--%>
<%--                            <a href="" class="col col-3 product-img">--%>
<%--                                <img src="/css/img/devops.png" alt="">--%>
<%--                            </a>--%>
<%--                            <div class="col col-8">--%>
<%--                                <a href="" class="product-name">--%>
<%--                                    DevOps 2021--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="col col-2 m-black">50.000đ</div>--%>
<%--                    <div class="col col-2">1</div>--%>
<%--                    <div class="col col-2 m-red">50.000đ</div>--%>
<%--                    <div class="col col 1"><i class="product-delete fas fa-trash-alt"></i></div>--%>
<%--                </div>--%>
<%--                <div class="row">--%>
<%--                    <div class="col col-5">--%>
<%--                        <div class="row">--%>
<%--                            <div class="col col-1">--%>
<%--                                <input type="checkbox" name="" id="">--%>
<%--                            </div>--%>
<%--                            <a href="" class="col col-3 product-img">--%>
<%--                                <img src="/css/img/golang.jfif" alt="">--%>
<%--                            </a>--%>
<%--                            <div class="col col-8">--%>
<%--                                <a href="" class="product-name">--%>
<%--                                    DevOps 2021--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="col col-2 m-black">50.000đ</div>--%>
<%--                    <div class="col col-2">1</div>--%>
<%--                    <div class="col col-2 m-red">50.000đ</div>--%>
<%--                    <div class="col col 1"><i class="product-delete fas fa-trash-alt"></i></div>--%>
<%--                </div>--%>
<%--                <div class="row">--%>
<%--                    <div class="col col-5">--%>
<%--                        <div class="row">--%>
<%--                            <div class="col col-1">--%>
<%--                                <input type="checkbox" name="" id="">--%>
<%--                            </div>--%>
<%--                            <a href="" class="col col-3 product-img">--%>
<%--                                <img src="/css/img/devops.png" alt="">--%>
<%--                            </a>--%>
<%--                            <div class="col col-8">--%>
<%--                                <a href="" class="product-name">--%>
<%--                                    DevOps 2021--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="col col-2 m-black">50.000đ</div>--%>
<%--                    <div class="col col-2">1</div>--%>
<%--                    <div class="col col-2 m-red">50.000đ</div>--%>
<%--                    <div class="col col 1"><i class="product-delete fas fa-trash-alt"></i></div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="cart-total-prices">--%>
<%--            <div class="cart-total-prices__inner">--%>
<%--                <div class="infor-customer">--%>
<%--                    <p>Khách hàng</p>--%>
<%--                    <div class="input-customer name-customer">--%>
<%--                        <input type="text" name="ht" placeholder='Họ tên'>--%>
<%--                    </div>--%>
<%--                    <div class="input-customer number-customer">--%>
<%--                        <input type="text" name="sdt" placeholder='Số điện thoại'>--%>
<%--                    </div>--%>
<%--                    <div class="input-customer address-customer">--%>
<%--                        <input type="text" name="dc" placeholder='Địa chỉ'>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="payment">--%>
<%--                    <div class="price-item">--%>
<%--                        <div class="row">--%>
<%--                            <p class="col col-8">Tạm tính</p>--%>
<%--                            <p class="col col-4 m-text-center">1.000.000đ</p>--%>
<%--                        </div>--%>
<%--                        <div class="row">--%>
<%--                            <p class="col col-8">Giảm giá</p>--%>
<%--                            <p class="col col-4 m-text-center">1.000.000đ</p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="price-total">--%>
<%--                        <div class="row">--%>
<%--                            <p class="col col-8">--%>
<%--                                Tổng cộng--%>
<%--                            </p>--%>
<%--                            <p class="col col-4 m-text-center">1.000.000đ</p>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                </div>--%>
<%--                <button class="buy-btn">Mua hàng</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
</body>
</html>



