<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light" style="z-index: 89">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="admin" class="nav-link">Home</a>
        </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                <i class="fas fa-expand-arrows-alt"></i>
            </a>
        </li>
    </ul>
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4"style="position: fixed;z-index: 90!important">
    <!-- Brand Logo -->
    <a href="admin" class="brand-link">
        <img src="http://localhost:9092/client/image/images_Trang_Chu/firstLogo.jpg" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
             style="opacity: .8; border-radius: 0;">
        <span class="brand-text font-weight-light">Task Manager</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="admin/plugin_admin/dist/img/avatar5.png" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info" id="idBlockSidebar">

            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                <li class="nav-item " id="menu-2">
                    <a href="" class="nav-link">
                        <i class="nav-icon fas fa-building"></i>
                        <p>
                            Qu???n l?? h???c vi??n
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="admin-list-student" class="nav-link ">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Danh s??ch h???c vi??n</p>
                            </a>
                        </li><li class="nav-item">
                            <a href="admin-advisory-infor" class="nav-link ">
                                <i class="far fa-circle nav-icon"></i>
                                <p>T?? v???n h???c vi??n</p>
                            </a>
                        </li>
<%--                        <li class="nav-item">--%>
<%--                            <a href="admin/danh-sach-khach-hang" class="nav-link">--%>
<%--                                <i class="far fa-circle nav-icon"></i>--%>
<%--                                <p>Th??m h???c vi??n </p>--%>
<%--                            </a>--%>
<%--                        </li>--%>
                    </ul>
                </li>
                <li class="nav-item " id="menu-3">
                    <a href="" class="nav-link">
                        <i class="nav-icon fas fa-building"></i>
                        <p>
                            Qu???n l?? b??i vi???t
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="admin-topic" class="nav-link ">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Danh s??ch b??i vi???t.</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item " id="menu-8">
                    <a href="" class="nav-link">
                        <i class="nav-icon fas fa-building"></i>
                        <p>
                            Qu???n l?? phi???u mua
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="phieumua-admin" class="nav-link ">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Danh s??ch phi???u mua.</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item " id="menu-7">
                    <a href="" class="nav-link">
                        <i class="nav-icon fas fa-building"></i>
                        <p>
                            Qu???n l?? ph???n m???m
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="admin-phan-mem" class="nav-link ">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Danh s??ch ph???n m???m</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item " id="menu-4">
                    <a href="" class="nav-link">
                        <i class="nav-icon fas fa-building"></i>
                        <p>
                            Gi???ng vi??n
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="admin-teacher" class="nav-link ">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Danh s??ch gi???ng vi??n</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item " id="menu-5">
                    <a href="" class="nav-link">
                        <i class="nav-icon fas fa-building"></i>
                        <p>
                            Kh??a h???c
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="admin-course" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Danh s??ch kh??a h???c</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="admin-course-college-student" class="nav-link ">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Th??m kh??a h???c sinh vi??n</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item " id="menu-6">
                    <a href="" class="nav-link">
                        <i class="nav-icon fas fa-building"></i>
                        <p>
                            Kh??c
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="admin-upload-file" class="nav-link ">
                                <i class="far fa-circle nav-icon"></i>
                                <p>T???i ???nh l??n.</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item" onclick="logOut()">
                    <span href="dang-nhap" class="nav-link" id="btn-dang-xuat" style="cursor: pointer">
                        <i class="nav-icon fas fa-sign-out-alt"></i>
                        <p>
                            ????ng xu???t
                        </p>
                    </span>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>