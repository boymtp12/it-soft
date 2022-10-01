<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Header -->
<%--<script src="http://localhost:9092/client/js/ajax/ajax_header.js" ></script>--%>
<script src="https://spec.edu.vn/client/js/ajax/ajax_header.js"></script>
<header class="navbar navbar-base navbar-expand-md navbar-light navbar-reactnative" id="header-website">
    <a class="navbar-brand pb-2" style="" href="http://localhost:9092/home">
        <div class="header-logo-company" style="">
            <img class="img_logo" src="http://localhost:9092/client/image/images_Trang_Chu/logoNew.png" alt="Logo">
        </div>
    </a>
    <button class="navbar-toggler btn-nv-sp col-1 col-sm-1 col-md-1 menu-mobie" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <i class="fas fa-bars" style="color: #EBEBEB"></i>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav  ml-auto" >
            <li class="nav-item">
                <a class="nav-link" href="http://localhost:9092/home" style="color: #EBEBEB; font-weight: 600;">Trang chủ
                    <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="http://localhost:9092/xemthem" style="color: #EBEBEB; font-weight: 600;">Lộ trình
                    <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="http://localhost:9092/phanmem-xemthem" style="color: #EBEBEB;font-weight: 600;">Phần mềm<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="http://localhost:9092/tintuc" style="color: #EBEBEB;font-weight: 600;">Giới thiệu<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="http://localhost:9092/giangvien"
                   style="color: #EBEBEB;font-weight: 600;">Giảng viên <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item1 nav-item-cart">
                <a class="nav-link" href="http://localhost:9092/cart" style="color: #EBEBEB;font-weight: 600; position: relative">
                    <i class="fas fa-shopping-cart icon-cart"></i>
                    <div class="amount-cart"><span>1</span></div>
                </a>
            </li>
        </ul>
    </div>

</header>

<script type="text/javascript">
    $(document).scroll(function () {
        var height = $(".navbar-base").height();
        var width = $(".navbar-base").width();
        console.log(height);
        if ($(this).scrollTop() > 1) {
            $(".navbar-base").css("background-image", "linear-gradient(to bottom right, #305E9C, #44647D)");
            $(".btn-nv-sp>i").css("color", "#EBEBEB");
        } else {
            $(".navbar-base").css("background-image", "none");
            $(".btn-nv-sp>i").css("color", "#EBEBEB");
        }
    });

    $('.menu-mobie').click(function() {
        $(".navbar-base").css("background-color", "linear-gradient(to right bottom, rgb(48, 94, 156), rgb(68, 100, 125))");
    })
</script>


