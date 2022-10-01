<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="client/image/images_Trang_Chu/firstLogo.png" type="image/x-icon">

    <meta charset="utf-8">
    <meta http-equiv="content-style-type" content="text/css">
    <meta http-equiv="content-language" content="en-vi">
    <%--    JSTL--%>
    <sql:setDataSource
            var="myDS"
            driver="com.mysql.cj.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/itsoft"
            user="root" password="123456789"/>
    <%if (request.getAttribute("javax.servlet.forward.request_uri").equals("/") || request.getAttribute("javax.servlet.forward.request_uri").equals("/home")) {%>
    <%--
        Meta trang chủ
        --%>
    <title id="titleIndex"><tiles:insertAttribute name="title"/></title>
    <meta name="copyright" content="https://spec.edu.vn/">
    <meta name="keywords"
          content="Học lập trình, SPEC Learing, Lập trình cho người mới bắt đầu, Lập trình cơ bản, Trung tâm SPEC, Java,C++,C#, Lập trình cho trẻ em">
    <meta name="description"
          content="Trung tâm đào tạo lập trình viên hàng đầu, cam kết đầu ra chất lượng cao. Được giảng dạy bởi những giảng viên, thạc sĩ, tiến sĩ hàng đầu đang công tác tại đại học xây dựng. Java,C++,C#,Python,MySql,Android,Reactjs,ReactNative.">
    <meta name=”robots” content=”index,follow”>
    <meta name="author" content="spec.edu.vn">
    <meta property="og:site_name" content="spec.edu.vn">
    <meta property="og:url"
          content="https://spec.edu.vn${requestScope['javax.servlet.forward.request_uri']}"/>
    <meta property="og:type" content="article"/>
    <meta property="og:title" content="Trang chủ"/>
    <meta property="og:description"
          content="Trung tâm đào tạo lập trình viên hàng đầu, cam kết đầu ra chất lượng cao. Được giảng dạy bởi những giảng viên, thạc sĩ, tiến sĩ hàng đầu đang công tác tại đại học xây dựng.Java,C++,C#,Python,MySql,Android,Reactjs,ReactNative.">
    <meta property="og:image"
          content="https://spec.edu.vn/client/image/images_Trang_Chu/banner1.jpeg"/>
    <%} else if (request.getAttribute("javax.servlet.forward.request_uri").toString().contains("/khoa-hoc-spec")) {%>
    <%--
        Meta trang khóa học
        --%>
    <%--  get id in url--%>
    <c:set var="currentPage" value="${requestScope['javax.servlet.forward.request_uri']}"/>
    <c:set var="splitURI" value="${fn:split(currentPage, '/')}"/>
    <c:set var="idCourse" value="${splitURI[fn:length(splitURI)-2]}"/>
    <%--  end get id in url--%>
    <sql:query var="course" dataSource="${myDS}">
        SELECT c.id,c.name,c.image,c.meta_title,c.meta_description,c.meta_keyword,c.meta_robot FROM course as c where c.id=? and c.deleted =true;
        <sql:param value="${idCourse}"/>
    </sql:query>
    <c:forEach var="row" items="${course.rows}">
        <title>${row.name}</title>
        <meta name="copyright" content="https://spec.edu.vn/">
        <meta name="keywords"
              content="${row.meta_keyword}">
        <meta property="og:locale" content="vi_VN">
        <meta name="description"
              content="${row.meta_description}">
        <meta name=”robots” content=”index,follow”>
        <meta name="author" content="spec.edu.vn">
        <meta property="og:site_name" content="spec.edu.vn">
        <meta property="og:url"
              content="https://spec.edu.vn${requestScope['javax.servlet.forward.request_uri']}"/>
        <meta property="og:type" content="article"/>
        <meta property="og:title" content="${row.name}"/>
        <meta property="og:description"
              content="${row.meta_description}">
        <meta property="og:image"
              content="${row.image}"/>
    </c:forEach>
    <% } else if (request.getAttribute("javax.servlet.forward.request_uri").toString().contains("/tintuc")) {%>
    <%--
        Meta trang tin tức
        --%>
    <title>Tin tức SPEC</title>
    <meta name="copyright" content="https://spec.edu.vn/">
    <meta name="keywords"
          content="Tin tức,Học lập trình, SPEC Learing, Lập trình cho người mới bắt đầu, Lập trình cơ bản, Trung tâm SPEC, Java,C++,C#, Lập trình cho trẻ em">
    <meta name="description"
          content="Tin tức nổi bật về công nghệ, cập nhật nhanh chóng, chính xác, tinh cậy. Địa chỉ uy tín để học lập trình. Java,C++,C#,Python,MySql,Android,Reactjs,ReactNative.">
    <meta property="og:site_name" content="spec.edu.vn">
    <meta property="og:description"
          content="Tin tức nổi bật về công nghệ, cập nhật nhanh chóng, chính xác, tinh cậy. Địa chỉ uy tín để học lập trình. Java,C++,C#,Python,MySql,Android,Reactjs,ReactNative.">
    <meta property="og:url" content="https://spec.edu.vn${requestScope['javax.servlet.forward.request_uri']}">
    <meta name=”robots” content=”index,follow”>
    <meta name="author" content="spec.edu.vn">
    <meta property="og:title" content="Tin tức SPEC"/>
    <meta property="og:type" content="article">
    <meta property="og:image" content="https://spec.edu.vn/client/image/images_Trang_Chu/banner3.jpeg">
    <%} else if (request.getAttribute("javax.servlet.forward.request_uri").toString().contains("/giangvien")) {%>
    <%--
        Meta trang giảng viên
        --%>
    <title>Giảng viên trung tâm SPEC</title>
    <meta name="copyright" content="https://spec.edu.vn/">
    <meta name="keywords"
          content="Giảng viên, SPEC Learing, Lập trình cho người mới bắt đầu, Lập trình cơ bản, Trung tâm SPEC, Java,C++,C#, Lập trình cho trẻ em">
    <meta name="description"
          content="Giảng viên uy tín, có chuyên môn cao, có trình độ thạc sĩ tiến sỹ trở lên đang công tác giảng dạy lâu năm tại trường Đại Học Xây Dựng (NUCE).">
    <meta property="og:site_name" content="spec.edu.vn">
    <meta property="og:type" content="website">
    <meta property="og:description"
          content="Giảng viên uy tín, có chuyên môn cao, có trình độ thạc sĩ tiến sỹ trở lên đang công tác giảng dạy lâu năm tại trường Đại Học Xây Dựng (NUCE).">
    <meta property="og:url" content="https://spec.edu.vn${requestScope['javax.servlet.forward.request_uri']}">
    <meta name=”robots” content=”index,follow”>
    <meta name="author" content="spec.edu.vn">
    <meta property="og:title" content="Giảng viên trung tâm SPEC"/>
    <meta property="og:type" content="article">
    <meta property="og:image" content="https://spec.edu.vn/client/image/images_Trang_Chu/banner1.jpeg">
    <%} else if (request.getAttribute("javax.servlet.forward.request_uri").toString().contains("/detail-topic") == true) {%>
    <c:set var="currentPagee" value="${requestScope['javax.servlet.forward.request_uri']}"/>
    <c:set var="splitURII" value="${fn:split(currentPagee, '/')}"/>
    <c:set var="idTopic" value="${splitURII[fn:length(splitURII)-2]}"/>
    <%--  end get id in url--%>
    <sql:query var="topic" dataSource="${myDS}">
        SELECT t.title,t.image_src,t.meta_title,t.meta_description,t.meta_keyword,t.meta_robot FROM topic as t where t.id=? and t.deleted=true;
        <sql:param value="${idTopic}"/>
    </sql:query>
    <c:forEach var="roww" items="${topic.rows}">
        <title>${roww.title}</title>
        <meta name="copyright" content="https://spec.edu.vn/">
        <meta name="keywords"
              content="${roww.meta_keyword}">
        <meta property="og:locale" content="vi_VN">
        <meta name="description"
              content="${roww.meta_description}">
        <meta property="og:site_name" content="spec.edu.vn">
        <meta property="og:type" content="website">
        <meta property="og:description"
              content="${roww.meta_description}">
        <meta property="og:url" content="https://spec.edu.vn${requestScope['javax.servlet.forward.request_uri']}">
        <meta name=”robots” content=”index,follow”>
        <meta name="author" content="spec.edu.vn">
        <meta property="og:title" content="${roww.title}"/>
        <meta property="og:type" content="article">
        <meta property="og:image" content="${roww.image_src}">
        <meta property="og:image:secure_url" content="${roww.image_src}">
    </c:forEach>
    <%} else {%>

    <%}%>
    <meta name="copyright" content="Copyright © 2021 SPEC LEARNING">
    <meta property="og:type" content="threed.asset"/>
    <meta property="og:asset" content="https://spec.edu.vn${requestScope['javax.servlet.forward.request_uri']}"/>
    <link rel="canonical" href="https://spec.edu.vn${requestScope['javax.servlet.forward.request_uri']}"/>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<%--    <link rel="stylesheet" href="https://spec.edu.vn/client/css/home.css">--%>
    <link rel="stylesheet" href="http://localhost:9092/client/css/home.css">
    <link rel="stylesheet" href="https://spec.edu.vn/client/css/animotion.min.css">
<%--    <link rel="stylesheet" href="https://spec.edu.vn/client/css/styleheader.css">--%>
    <link rel="stylesheet" href="http://localhost:9092/client/css/styleheader.css">
    <link rel="stylesheet" href="<tiles:insertAttribute name="css"/>">
    <script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%--    &lt;%&ndash;    jquery&ndash;%&gt;--%>
<%--    <script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">--%>
<%--    </script>--%>
    <%--styles.css--%>
    <!-- Facebook Pixel Code -->
    <script async>
        function loadFacebookPixel(_time) {
            setTimeout(function () {
                (function () {
                    !function (f, b, e, v, n, t, s) {
                        if (f.fbq) return;
                        n = f.fbq = function () {
                            n.callMethod ?
                                n.callMethod.apply(n, arguments) : n.queue.push(arguments)
                        };
                        if (!f._fbq) f._fbq = n;
                        n.push = n;
                        n.loaded = !0;
                        n.version = '2.0';
                        n.queue = [];
                        t = b.createElement(e);
                        t.async = !0;
                        t.src = v;
                        s = b.getElementsByTagName(e)[0];
                        s.parentNode.insertBefore(t, s)
                    }(window, document, 'script',
                        'https://connect.facebook.net/en_US/fbevents.js');
                    fbq('init', '277357285800457');
                    fbq('track', 'PageView');
                })();
            }, _time);
        }

        loadFacebookPixel(5000);
    </script>
    <noscript><img height="1" width="1" style="display:none"
                   src="https://www.facebook.com/tr?id=277357285800457&ev=PageView&noscript=1"
    /></noscript>
    <!-- End Facebook Pixel Code -->
    <!-- Facebook Pixel Code -->
    <script async>
        function loadFacebookPixel(_time) {
            setTimeout(function () {
                (function () {
                    !function (f, b, e, v, n, t, s) {
                        if (f.fbq) return;
                        n = f.fbq = function () {
                            n.callMethod ?
                                n.callMethod.apply(n, arguments) : n.queue.push(arguments)
                        };
                        if (!f._fbq) f._fbq = n;
                        n.push = n;
                        n.loaded = !0;
                        n.version = '2.0';
                        n.queue = [];
                        t = b.createElement(e);
                        t.async = !0;
                        t.src = v;
                        s = b.getElementsByTagName(e)[0];
                        s.parentNode.insertBefore(t, s)
                    }(window, document, 'script',
                        'https://connect.facebook.net/en_US/fbevents.js');
                    fbq('init', '277357285800457');
                    fbq('track', 'PageView');
                })();
            }, _time);
        }

        loadFacebookPixel(5000);
    </script>
    <noscript><img height="1" width="1" style="display:none"
                   src="https://www.facebook.com/tr?id=277357285800457&ev=PageView&noscript=1"
    /></noscript>
    <!-- End Facebook Pixel Code -->
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-4JGN0PKPNJ"></script>
    <script async>
        window.dataLayer = window.dataLayer || [];
        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());
        gtag('config', 'G-4JGN0PKPNJ');
    </script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<%--layout-fixed--%>
<body class="hold-transition sidebar-mini ">
<div class="wrapper" style="height: 100%">
    <tiles:insertAttribute name="main_layout"/>
</div>

<!-- jQuery library -->
<script async src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script async src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script async src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.js" async></script>
<script src="https://spec.edu.vn/client/js/ajax/ajax_base.js" ></script>
<%--<script src="http://localhost:9092/client/js/ajax/ajax_base.js" ></script>--%>
<script src="https://spec.edu.vn/admin/js_admin/libs_admin/knockout.min.js" async></script>
<%--&lt;%&ndash;notify js&ndash;%&gt;--%>
<script src="https://spec.edu.vn/admin/plugin_admin/bootstrap-notify.min.js" async></script>

</body>
</html>
