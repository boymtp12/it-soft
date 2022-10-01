<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Content Header (Page header) -->
<script src="admin/js_admin/ajax_admin/ajax_course_admin.js"></script>
<%--block nay hien ơ trên để chỉnh sủa--%>
<%-- sub window--%>
<div class="block-edit-course " id="block-edit-course"
     style="position: fixed;z-index: 10000;width: 100%;height: 100%; left: 0;top: 0; background: #00000045;display: none">
    <div class="edit-course"
         style="display: flex;align-items: center; width: 100%;height: 97%;margin-bottom: 10px;margin-top: 10px">
        <div class="admin-course container"
             style="margin-bottom: 10px;overflow-y: auto;max-height: 100%;padding: 0;margin-top: 10px" id="admin-course">
            <div class="row card">
                <%--        Start--%>

                <div class="col-12">
                    <div class="nav-tabs-custom">
                        <div class="card-header row"
                             style="border-bottom: 1px solid #ddd;padding-top: 10px;padding-left: 0px;padding-right: 0px">
                            <ul class="nav nav-tabs col-12 col-sm-12 col-md-10 col-lg-10 col-xl-10"
                                style="border-bottom: none!important">
                                <li class="active"><a href="#activity" data-toggle="tab" aria-expanded="true">Bài
                                    viết</a></li>
                                <li class=""><a href="#contentcourse" data-toggle="tab" aria-expanded="false">Nội
                                    dung</a></li>
                                <li class=""><a href="#seo" data-toggle="tab" aria-expanded="false">Meta SEO</a></li>

                            </ul>
                        </div>

                        <div class="tab-content">
                            <div class="tab-pane active" id="activity">
                                <!-- Post -->
                                <div class="card card-default col-12" style="margin-bottom: 0px;">
                                    <div class="card-header">
                                        <h2 class="card-title font-weight-bold"><font
                                                style="vertical-align: inherit;"><font
                                                style="vertical-align: inherit;">Thêm khóa học</font></font></h2>

                                        <div class="card-tools">
                                            <button type="button" class="btn btn-tool"
                                                    data-card-widget="collapse">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                            <button type="button" class="btn btn-tool btn-hide-add-course" title="Đóng">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body" style="display: block;">
                                        <div class="row">
                                            <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label for="nameCourse"><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Tên khóa học </font></font></label>
                                                    <input id="nameCourse" type="text" class="form-control"
                                                           placeholder="Nhập tiêu đề bài viết">
                                                </div>
                                                <div class="form-group">
                                                    <label for="studentFees"><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Học phí gốc  </font></font></label>
                                                    <input id="studentFees" type="text"  class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label for="imageCourse"><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Ảnh khóa học  </font></font></label>
                                                    <input id="imageCourse" type="text" class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label for="urlViewCourse"><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Link khóa học (tự tạo)  </font></font></label>
                                                    <input id="urlViewCourse" type="text" class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label for="objectCourse"><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Đối tượng học viên  </font></font></label>
                                                    <input id="objectCourse" type="text" class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label for="ageCourse"><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Độ tuổi  </font></font></label>
                                                    <input id="ageCourse" type="text" class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label for="numberOfStudent"><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Sĩ số  </font></font></label>
                                                    <input id="numberOfStudent" type="number" class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label for="promotionCourse"><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Giảm giá </font></font></label>
                                                    <select id="promotionCourse" style="width: 100%;padding: 2px;height: 34px">
                                                        <option value="0">0%</option>>
                                                        <option value="10">10%</option>
                                                        <option value="20">20%</option>
                                                        <option value="30">30%</option>
                                                        <option value="40">40%</option>
                                                        <option value="50">50%</option>
                                                        <option value="60">60%</option>
                                                        <option value="70">70%</option>
                                                        <option value="80">80%</option>
                                                        <option value="90">90%</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="durationOfStudy"><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Thời lượng học  </font></font></label>
                                                    <input id="durationOfStudy" type="text" class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 ">


                                                <div class="form-group">
                                                    <label for="sectionCourse"><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Số học phần  </font></font></label>
                                                    <input id="sectionCourse" type="email" class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label for="documentCourse"><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Tài liệu  </font></font></label>
                                                    <input id="documentCourse" type="text" class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label for="subContentCourse"><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Nội dung phụ  </font></font></label>
                                                    <input id="subContentCourse" type="email" class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label for="subContentCourse"><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Ngày khai giảng  </font></font></label>
                                                    <input id="openingDay" type="text" class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label for="subContentCourse"><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Lịch học</font></font></label>
                                                    <input id="studyTime" type="text" class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label for="teacherCourse"><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Giảng viên  </font></font></label>

                                                    <select id="teacherCourse"
                                                            style="width: 100%;padding: 6px;border:1px solid #00000040">
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="themeCourse"><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Chủ đề  </font></font></label>

                                                    <select id="themeCourse"
                                                            style="width: 100%;padding: 6px;border:1px solid #00000040">
                                                    </select>
                                                </div>
                                                <div class="form-group" style="padding-top: 15px">
                                                    <ul id="typeEducationCourse" class="row" style="justify-content: space-around;padding: 0;flex-wrap: wrap">

                                                    </ul>
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
                            <div class="tab-pane" id="contentcourse">
                                <div class="card card-default">
                                    <div class="card-header">
                                        <h2 class="card-title font-weight-bold"><font
                                                style="vertical-align: inherit;"><font
                                                style="vertical-align: inherit;">Nội dung chính</font></font></h2>
                                        <div class="card-tools">
                                            <button type="button" class="btn btn-tool"
                                                    data-card-widget="collapse">
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
                                                <div id="mainContentCourse">Nội dung chính</div>
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
                                            <button type="button" class="btn btn-tool"
                                                    data-card-widget="collapse">
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
                                        <div class="view-seo row col-12">
                                            <div class="form-group" style="width: 100%">
                                                <div class="col-12" id="viewSeoCourse"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->


                        </div>
                        <!-- /.tab-content -->

                    </div>
                    <div class="row">
                        <div class="form-group" style="display: flex;justify-content: space-around;width: 100%;margin-bottom:0!important;padding: 10px 10px 20px 10px;">
                            <%--                                                <button id="btnCheckInput"--%>
                            <%--                                                        class="btn btn-success">Lưu bài viết--%>
                            <%--                                                </button>--%>

                            <button id="btnPostCourse" onclick="postCourse(0)"
                                    class="btn btn-success">Lưu bài viết
                            </button>
                            <button id="btnEditCourse" class="btn btn-success " style="display: none" disabled>Lưu bài viết
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
<%--Block danh sach course--%>
<%--end sub window--%>
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header row justify-content-around"
                 style=" margin-bottom: 15px; border-bottom: none; margin-top: 10px;">
                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-3">
                    <h3 class="card-title">Danh Sách Khóa Học</h3>
                </div>
                <div class="card-tools col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-2 " style="margin-right: 0px">
                    <div class="input-group input-group-sm" style="display: flex">
                        <input id="inputSearchCourse" style="width: auto" type="text" name="table_search" class="form-control float-right"
                               placeholder="Search">

                        <div class="input-group-append">
                            <button id="btnSearchCourse" onclick="searchCourse" class="btn btn-default"><i class="fas fa-search"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row pb-1">
                <div class="input-group-append col-12">
                    <button onclick="clearDataCourse()" class="btn btn-success btn-show-add-course"><i
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
                    <tbody id="tableShowAllcourse"></tbody>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
</div>