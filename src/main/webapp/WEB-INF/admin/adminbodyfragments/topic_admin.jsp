<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Content Header (Page header) -->
<script src="admin/js_admin/ajax_admin/ajax_topic_admin.js"></script>
<%--block nay hien ơ trên để chỉnh sủa--%>
<%-- sub window--%>
<div class="block-edit-topic" id="block-edit-topic"
     style="position: fixed;z-index: 100;width: 100%;height: 100%; left: 0;top: 0; background: #00000045;">
    <div class="edit-topic"
         style="display: flex;align-items: center; width: 100%;height: 97%;margin-bottom: 10px;margin-top: 10px">
        <div class="admin-topic container"
             style="margin-bottom: 10px;max-height: 100%;overflow-y:auto ;padding: 0;margin-top: 10px" id="admin-topic">
            <div class="row card">
                <%--        Start--%>
                <div class="col-12">
                    <div class="nav-tabs-custom">
                        <div class="card-header row"
                             style="border-bottom: 1px solid #ddd;padding-top: 10px;background:white;padding-left: 0px;padding-right: 0px">
                            <ul class="nav nav-pills col-12 col-sm-12 col-md-10 col-lg-10 col-xl-10"
                                style="border-bottom: none!important">
                                <li class="nav-item  ">
                                    <a href="#activity" data-toggle="tab"
                                       class="nav-link active" aria-expanded="true">Bài
                                        viết</a></li>
                                <li class="nav-item"><a href="#contentTopic" data-toggle="tab"
                                                                 class="nav-link" aria-expanded="false">Nội
                                    dung</a></li>
                                <li class="nav-item"><a href="#seo" data-toggle="tab" class="nav-link"
                                                                 aria-expanded="false">Meta
                                    SEO</a></li>
                            </ul>
                        </div>

                        <div class="tab-content">
                            <div class="tab-pane active" id="activity">
                                <!-- Post -->
                                <div class="card card-default col-12" style="margin-bottom: 0px;">
                                    <div class="card-header">
                                        <h2 class="card-title font-weight-bold"><font
                                                style="vertical-align: inherit;"><font
                                                style="vertical-align: inherit;">Thêm bài viết</font></font></h2>

                                        <div class="card-tools">
                                            <button type="button" class="btn btn-tool" data-widget="fullscreen">
                                                <i class="fas fa-expand-arrows-alt"></i>
                                            </button>
                                            <button type="button" class="btn btn-tool"
                                                    data-card-widget="collapse">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                            <button type="button" class="btn btn-tool btn-hide-add-topic" title="Đóng">
                                                <i class="fas fa-times"></i>
                                            </button>

                                        </div>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body" style="display: block;">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="titleTopic"><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Tiêu đề bài
                                                        viết </font></font></label>
                                                    <input id="titleTopic" type="email" class="form-control"
                                                           placeholder="Nhập tiêu đề bài viết">
                                                </div>
                                                <div class="form-group">
                                                    <label><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Nội dung nhỏ</font></font></label>
                                                    <div id="subContent"></div>


                                                </div>

                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6"
                                                             style="padding: 5px;margin-bottom: 5px">
                                                            <label for="tagTopic"><font
                                                                    style="vertical-align: inherit;"><font
                                                                    style="vertical-align: inherit;">Tag (Thẻ bài
                                                                viết)</font></font></label>
                                                            <input id="tagTopic" type="email" class="form-control"
                                                                   placeholder="Nhập tags (định dạng #Tag1#Tag2...#TagN)">
                                                        </div>
                                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6"
                                                             style="padding: 5px;margin-bottom: 5px">
                                                            <label for="urlTopic"><font
                                                                    style="vertical-align: inherit;"><font
                                                                    style="vertical-align: inherit;">URL</font></font></label>
                                                            <input id="urlTopic" type="email" class="form-control"
                                                                   placeholder="Nhập url: Ví dụ bai-viet-1">
                                                        </div>
                                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6"
                                                             style="padding: 5px;margin-bottom: 5px">
                                                            <label for="tagTopic"><font
                                                                    style="vertical-align: inherit;"><font
                                                                    style="vertical-align: inherit;">Link ảnh bài
                                                                viết.</font></font></label>
                                                            <input id="urlImage" type="email" class="form-control"
                                                                   placeholder="Copy link vào đây (Chỉ 1).">
                                                        </div>
                                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6"
                                                             style="padding: 5px;margin-bottom: 5px">
                                                            <label for="tagTopic"><font
                                                                    style="vertical-align: inherit;"><font
                                                                    style="vertical-align: inherit;">Khóa học liên
                                                                quan</font></font></label>
                                                            <select id="courseOfTopic"
                                                                    style="width: 100%;padding: 6px;border:1px solid #00000040">
                                                            </select>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="form-group">
                                                    <div class="row">

                                                    </div>

                                                </div>


                                            </div>
                                            <!-- /.col -->
                                        </div>
                                        <!-- /.row -->
                                    </div>
                                </div>
                                <!-- /.post -->
                            </div>
                            <!-- /.tab-pane -->
                            <%--content main--%>
                            <div class="tab-pane" id="contentTopic">
                                <div class="card card-default">
                                    <div class="card-header">
                                        <h2 class="card-title font-weight-bold"><font
                                                style="vertical-align: inherit;"><font
                                                style="vertical-align: inherit;">Nội dung chính</font></font></h2>
                                        <div class="card-tools">
                                            <button type="button" class="btn btn-tool" data-widget="fullscreen">
                                                <i class="fas fa-expand-arrows-alt"></i>
                                            </button>
                                            <button type="button" class="btn btn-tool"
                                                    data-card-widget="collapse">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                            <button type="button" class="btn btn-tool btn-hide-add-topic" title="Đóng">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="card-body block-seo row" style="padding: 10px">
                                        <div class="main-seo col-12 ">
                                            <div class="form-group">
                                                <div id="mainContent">Nội dung chính</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--end content main--%>

                            <%--    seo                    --%>
                            <div class="tab-pane" id="seo">
                                <div class="card card-default">
                                    <div class="card-header">
                                        <h2 class="card-title font-weight-bold"><font
                                                style="vertical-align: inherit;"><font
                                                style="vertical-align: inherit;">Thêm SEO bài viết</font></font></h2>
                                        <div class="card-tools">
                                            <button type="button" class="btn btn-tool" data-widget="fullscreen">
                                                <i class="fas fa-expand-arrows-alt"></i>
                                            </button>
                                            <button type="button" class="btn btn-tool"
                                                    data-card-widget="collapse">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                            <button type="button" class="btn btn-tool btn-hide-add-topic" title="Đóng">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="card-body block-seo " style="padding: 10px">
                                        <div class="main-seo row col-12 ">
                                            <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-3">
                                                <div class="form-group">
                                                    <label for="metaSeoTitle"><font
                                                            style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Meta
                                                        title</font></font></label>
                                                    <input type="text" class="form-control"
                                                           id="metaSeoTitle"
                                                           placeholder="Nhập tiêu đề bài viết">
                                                </div>
                                                <div class="form-group">
                                                    <label for="metaKeyWord"><font
                                                            style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Meta
                                                        keyword </font></font></label>
                                                    <input type="text" class="form-control"
                                                           id="metaKeyWord"
                                                           placeholder="Nhập tiêu đề bài viết">
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-3">
                                                <div class="form-group">
                                                    <label for="metaSeoDescription"><font
                                                            style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Meta
                                                        description </font></font></label>
                                                    <input type="text" class="form-control"
                                                           id="metaSeoDescription"
                                                           placeholder="Nhập tiêu đề bài viết">
                                                </div>
                                                <div class="form-group">
                                                    <label>Meta robot</label>
                                                    <select id="metaSeoRobot"
                                                            class="form-control select2 select2-hidden-accessible"
                                                            style="width: 100%;" data-select2-id="1" tabindex="-1"
                                                            aria-hidden="true">
                                                        <option value="index,follow" selected>index,follow</option>
                                                        <option value="noindex,nofollow">noindex,nofollow</option>
                                                        <option value="index,nofollow">index,nofollow</option>
                                                        <option value="noindex,follow">noindex,follow</option>
                                                    </select>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                        </div>
                        <!-- /.tab-content -->
                        <div class="form-group d-flex justify-content-around "
                             style="margin-bottom:0!important;padding: 20px 10px 20px 10px;">
                            <button id="postTopic" onclick="postTopic(0)"
                                    class="btn btn-success">Lưu bài viết
                            </button>
                            <button id="btnEditTopic" class="btn btn-success " style="display: none" disabled>Lưu bài
                                viết
                            </button>
                        </div>
                    </div>
                    <!-- /.nav-tabs-custom -->
                </div>

                <%--        end--%>
            </div>
        </div>
    </div>
</div>
<%--Block danh sach topic--%>
<%--end sub window--%>
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header row justify-content-around"
                 style=" margin-bottom: 15px; border-bottom: none; margin-top: 10px;">
                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-3">
                    <h3 class="card-title">Danh Sách Bài Viết</h3>
                </div>
                <div class="card-tools col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-2 " style="margin-right: 0px">
                    <div class="input-group input-group-sm" style="display: flex">
                        <input id="inputSearchTopic" style="width: auto" type="text" name="table_search"
                               class="form-control float-right"
                               placeholder="Search">

                        <div class="input-group-append">
                            <button id="btnSearchTopic" onclick="searchTopic()" class="btn btn-default"><i
                                    class="fas fa-search"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row pb-1">
                <div class="input-group-append col-12">
                    <button onclick="clearDataTopic()" class="btn btn-success btn-show-add-topic"><i
                            class="fas fa-plus"></i> Thêm mới
                    </button>
                </div>
            </div>

            <!-- /.card-header -->
            <div class="card-body table-responsive p-0" style="height: auto;">
                <table class="table table-head-fixed">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tiêu đề</th>
                        <th>Ngày tạo</th>
                        <th>Chức năng</th>
                    </tr>
                    </thead>
                    <tbody id="tableShowAllTopic"></tbody>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
</div>