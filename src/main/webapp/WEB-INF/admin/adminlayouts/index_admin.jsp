<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="client/image/images_Trang_Chu/firstLogo.png"/>
    <!-- ============= Title  ============= -->
    <title><tiles:insertAttribute name="title_admin"/></title>

    <%-- ================ ADMIN_LTE ================ --%>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="admin/plugin_admin/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="admin/plugin_admin/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="admin/plugin_admin/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="admin/plugin_admin/dist/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="admin/plugin_admin/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="admin/plugin_admin/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="admin/plugin_admin/summernote/summernote-bs4.min.css">
    <%--link-js--%>
    <!-- jQuery -->
    <script src="admin/plugin_admin/jquery/jquery.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="admin/plugin_admin/jquery-ui/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <!-- Bootstrap 4 -->
    <script src="admin/plugin_admin/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- ChartJS -->
    <script src="admin/plugin_admin/chart_js/Chart.min.js"></script>
    <!-- Sparkline -->
    <script src="admin/plugin_admin/sparklines/sparkline.js"></script>
    <!-- jQuery Knob Chart -->
    <script src="admin/plugin_admin/jquery-knob/jquery.knob.min.js"></script>
    <!-- daterangepicker -->
    <script src="admin/plugin_admin/moment/moment.min.js"></script>
    <script src="admin/plugin_admin/daterangepicker/daterangepicker.js"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="admin/plugin_admin/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    <!-- Summernote -->
    <script src="admin/plugin_admin/summernote/summernote-bs4.min.js"></script>
    <!-- overlayScrollbars -->
    <script src="admin/plugin_admin/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <!-- AdminLTE App -->
    <script src="admin/plugin_admin/dist/js/adminlte.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="admin/plugin_admin/dist/js/demo.js"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="admin/plugin_admin/dist/js/pages/dashboard.js"></script>
    <!-- Bootstrap notifi for demo purposes -->
    <link rel="stylesheet" href="admin/plugin_admin/bootstrap-notify/bootstrap-notify.min.css">

    <script src="admin/plugin_admin/bootstrap-notify/bootstrap-notify.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>

    <link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.css">

    <!-- Bootstrap notifi for demo purposes -->
    <link rel="stylesheet" href="admin/plugin_admin/bootstrap-notify/bootstrap-notify.min.css">
    <script src="admin/plugin_admin/bootstrap-notify.min.js"></script>
    <script src="admin/plugin_admin/bootstrap-notify/bootstrap-notify.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

    <%--    font awesome 5--%>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <%--    summernote--%>
    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <%--styles.css--%>
    <link rel="stylesheet" href="admin/css_admin/style_admin.css">
    <%--    ajax-main--%>
    <%--    <script src="https://cdn.ckeditor.com/4.16.0/standard-all/ckeditor.js"></script>--%>
    <%--    <script src="//cdn.ckeditor.com/4.17.1/full-all/ckeditor.js"></script>--%>
    <script src="admin/js_admin/ajax_admin/ajax_base_admin.js"></script>
    <script src="admin/js_admin/libs_admin/knockout.js"></script>
    <%--    <script src="admin/js_admin/ckeditor_admin.js"></script>--%>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        figure.image {
            display: inline-block;
            border: 1px solid gray;
            margin: 0 2px 0 1px;
            background: #f5f2f0;
        }

        figure.align-left {
            float: left;
        }

        figure.align-right {
            float: right;
        }

        figure.image img {
            margin: 8px 8px 0 8px;
        }

        figure.image figcaption {
            margin: 6px 8px 6px 8px;
            text-align: center;
        }

        img.align-left {
            float: left;
        }

        img.align-right {
            float: right;
        }

        .mce-toc {
            border: 1px solid gray;
        }

        .mce-toc h2 {
            margin: 4px;
        }

        .mce-toc li {
            list-style-type: none;
        }
    </style>
    <script src="https://cdn.tiny.cloud/1/0cvgyq8htwfa5cldcb7inwo3d6meev709oz5fuwnlml6q7iz/tinymce/5/tinymce.min.js"
            referrerpolicy="origin"></script>
</head>
<%--layout-fixed--%>
<body class="hold-transition sidebar-mini ">
<div class="wrapper" style="height: 100%">
    <tiles:insertAttribute name="main_layout_admin"/>
</div>

</body>
</html>