<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <script src="admin/js_admin/ajax_admin/ajax_phan_mem_admin.js"></script>

    <div class="block-edit-course" id="block-edit-course" style="position: fixed;z-index: 10000;width: 100%;height: 100%; left: 0;top: 0; background: #00000045; display: none">
        <div class="edit-topic" style="display: flex;align-items: center; width: 100%;height: 97%;margin-bottom: 10px;margin-top: 10px">
            <div class="admin-topic container" style="margin-bottom: 10px;max-height: 100%;overflow-y:auto ;padding: 0;margin-top: 10px" id="admin-topic">
                <div class="row card">
                    <%--        Start--%>
                        <form id="form-id" class="needs-validation" novalidate>
                        <div class="col-12">
                            <div class="nav-tabs-custom">
                                <div class="card-header row" style="border-bottom: 1px solid #ddd;padding-top: 10px;padding-left: 0px;padding-right: 0px">
                                    <ul class="nav nav-tabs col-12 col-sm-12 col-md-10 col-lg-10 col-xl-10" style="border-bottom: none!important">
                                        <li class="active"><a href="#activity" data-toggle="tab" aria-expanded="true">Bài
                                    viết</a></li>
                                        <li class=""><a href="#contentTopic" data-toggle="tab" aria-expanded="false">Nội
                                    dung</a></li>
                                        <li class=""><a href="#seo" data-toggle="tab" aria-expanded="false">Meta SEO</a></li>

                                    </ul>
                                </div>

                                <div class="tab-content">
                                    <div class="tab-pane active" id="activity">
                                        <!-- Post -->
                                        <div class="card card-default col-12" style="margin-bottom: 0px;">
                                            <div class="card-header">
                                                <h2 class="card-title font-weight-bold">
                                                    <font style="vertical-align: inherit;">
                                                        <font style="vertical-align: inherit;">Thêm phần mềm</font>
                                                    </font>
                                                </h2>

                                                <div class="card-tools">
                                                    <button type="button" class="btn btn-tool" data-widget="fullscreen">
                                                <i class="fas fa-expand-arrows-alt"></i>
                                            </button>
                                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                                    <button type="button" class="btn btn-tool btn-hide-add-course" id="btn-hide-add-course" title="Đóng">
                                                <i class="fas fa-times"></i>
                                            </button>

                                                </div>
                                            </div>
                                            <!-- /.card-header -->
                                                <div class="card-body" style="display: block;">
                                                    <div class="row">
                                                        <div class="col-12">

                                                                <div class="form-group">
                                                                    <label for="nameCourse"><font style="vertical-align: inherit;"><font
                                                                            style="vertical-align: inherit;">Tên phần mềm </font></font></label>
                                                                    <input id="nameCourse" type="text" class="form-control" placeholder="Nhập tên phần mềm" required>
                                                                    <div class="invalid-feedback">
                                                                        Vui lòng nhập tên phần mềm
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label><font style="vertical-align: inherit;"><font
                                                                            style="vertical-align: inherit;">Mô tả ngắn</font></font></label>
                                                                    <div id="subContent"></div>

                                                                </div>

                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6" style="padding: 5px;margin-bottom: 5px">
                                                                            <label for="priceCourse"><font
                                                                                    style="vertical-align: inherit;"><font
                                                                                    style="vertical-align: inherit;">Giá của phần mềm</font></font></label>
                                                                            <input id="priceCourse" type="text" class="form-control" placeholder="Nhập giá (Tính theo VND)" required>
                                                                            <div class="invalid-feedback">
                                                                                Giá không được bỏ trống
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6" style="padding: 5px;margin-bottom: 5px">
                                                                            <label for="discountCourse"><font
                                                                                    style="vertical-align: inherit;"><font
                                                                                    style="vertical-align: inherit;">Giảm giá</font></font></label>
                                                                            <input id="discountCourse" type="text" class="form-control" placeholder="Giảm giá..." required>
                                                                            <div class="invalid-feedback">
                                                                                Giá không được bỏ trống
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6" style="padding: 5px;margin-bottom: 5px" novalidate>
                                                                            <label for="urlImage"><font
                                                                                    style="vertical-align: inherit;"><font
                                                                                    style="vertical-align: inherit;">Link ảnh phần mềm</font></font></label>
                                                                            <input id="urlImage" type="text" class="form-control" placeholder="Copy link vào đây (Chỉ 1)." required>
                                                                            <div class="invalid-feedback">
                                                                                Nhập link ảnh bạn muốn sử dụng
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6" style="padding: 5px;margin-bottom: 5px">
                                                                            <label for="slug"><font
                                                                                    style="vertical-align: inherit;"><font
                                                                                    style="vertical-align: inherit;">Slug</font></font></label>
                                                                            <input id="slug" type="text" class="form-control" placeholder="Slug..." required>
                                                                            <div class="invalid-feedback">
                                                                                Phần này không được bỏ trống
                                                                            </div>
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
                                                    <h2 class="card-title font-weight-bold">
                                                        <font style="vertical-align: inherit;">
                                                            <font style="vertical-align: inherit;">Mô tả chi tiết</font>
                                                        </font>
                                                    </h2>
                                                    <div class="card-tools">
                                                        <button type="button" class="btn btn-tool" data-widget="fullscreen">
                                                <i class="fas fa-expand-arrows-alt"></i>
                                            </button>
                                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                                        <button type="button" class="btn btn-tool btn-hide-add-course" title="Đóng">
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
                                                            <h2 class="card-title font-weight-bold">
                                                                <font style="vertical-align: inherit;">
                                                                    <font style="vertical-align: inherit;">Thêm SEO phần mềm</font>
                                                                </font>
                                                            </h2>
                                                            <div class="card-tools">
                                                                <button type="button" class="btn btn-tool" data-widget="fullscreen">
                                                <i class="fas fa-expand-arrows-alt"></i>
                                            </button>
                                                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                                                <button type="button" class="btn btn-tool btn-hide-add-course" title="Đóng">
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
                                                                        <input type="text" class="form-control" id="metaSeoTitle" placeholder="Nhập tiêu đề phần mềm" required>
                                                                        <div class="invalid-feedback">
                                                                            Vui lòng nhập tiêu đề phần mềm
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="metaKeyWord"><font
                                                            style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Meta
                                                        keyword </font></font></label>
                                                                        <input type="text" class="form-control" id="metaKeyWord" placeholder="Nhập từ khóa phần mềm ">
                                                                    </div>
                                                                </div>
                                                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-3">
                                                                    <div class="form-group">
                                                                        <label for="metaSeoDescription"><font
                                                            style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Meta
                                                        description </font></font></label>
                                                                        <input type="text" class="form-control" id="metaSeoDescription" placeholder="Nhập mô tả phần mềm" required>
                                                                        <div class="invalid-feedback">
                                                                            Vui lòng nhập mô tả phần mềm
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Meta robot</label>
                                                                        <select id="metaSeoRobotSua" class="form-control select2 select2-hidden-accessible" style="width: 100%;" data-select2-id="1" tabindex="-1" aria-hidden="true">
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
                                <div class="form-group d-flex justify-content-around " style="margin-bottom:0!important;padding: 20px 10px 20px 10px;">
                                    <button id="postCourse" class="btn btn-success">Lưu phần mềm
                            </button>
                                    <button id="btnEditCourse" class="btn btn-success " style="display: none" disabled>Lưu phần mềm                            </button>
                                </div>
                            </div>
                            <!-- /.nav-tabs-custom -->
                        </div>
                        </form>
                        <%--        end--%>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header row justify-content-around" style=" margin-bottom: 15px; border-bottom: none; margin-top: 10px;">
                    <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-3">
                        <h3 class="card-title">Danh Sách Phần Mềm</h3>
                    </div>
                    <div class="card-tools col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-2 " style="margin-right: 0px">
                        <div class="input-group input-group-sm" style="display: flex">
                            <input id="inputSearchCourse" style="width: auto" type="text" name="table_search" class="form-control float-right" placeholder="Search">

                            <div class="input-group-append">
                                <button id="btnSearchCourse" class="btn btn-default"><i class="fas fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row pb-1">
                    <div class="input-group-append col-12">
                        <button class="btn btn-success btn-show-add-course"><i
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
                        <tbody id="tableShowAllCourse"></tbody>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
    </div>