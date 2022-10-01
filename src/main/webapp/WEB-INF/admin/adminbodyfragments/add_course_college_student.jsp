<%--
  Created by IntelliJ IDEA.
  User: HieuPC
  Date: 5/10/2021
  Time: 2:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <div class="nav-tabs-custom" data-bind="with: itemCourse">
                        <div class="card-header row"
                             style="border-bottom: 1px solid #ddd;padding-top: 10px;padding-left: 0px;padding-right: 0px">
                            <ul class="nav nav-tabs col-12 col-sm-12 col-md-10 col-lg-10 col-xl-10"
                                style="border-bottom: none!important">
                                <li class="active"><a href="#activity" data-toggle="tab" aria-expanded="true">Bài
                                    viết</a></li>
                                <li class=""><a href="#contentcourse" data-toggle="tab" aria-expanded="false">Nội
                                    dung</a></li>
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
                                            <button data-bind="click: $parent.clickHideSubWindows.bind(this)" type="button" class="btn btn-tool btn-hide-add-course" title="Đóng">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body" style="display: block;">
                                        <div class="row">
                                            <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Tên khóa học </font></font></label>
                                                    <input data-bind="textInput: name" type="text" class="form-control"
                                                           placeholder="Nhập tiêu đề bài viết">
                                                </div>
                                                <div class="form-group">
                                                    <label ><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Học phí gốc  </font></font></label>
                                                    <input data-bind="textInput: studentFees"  type="text"  class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label ><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Ảnh khóa học  </font></font></label>
                                                    <input data-bind="textInput: image" type="text" class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label ><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Link khóa học (tự tạo)  </font></font></label>
                                                    <input data-bind="textInput: urlView" type="text" class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label ><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Đối tượng học viên  </font></font></label>
                                                    <input data-bind="textInput: objStudents" type="text" class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label ><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Độ tuổi  </font></font></label>
                                                    <input data-bind="textInput: age" type="text" class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label ><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Sĩ số  </font></font></label>
                                                    <input data-bind="textInput: numberOfStudent " type="number" class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label ><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Giảm giá </font></font></label>
                                                    <select  style="width: 100%;padding: 2px">
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
                                            </div>
                                            <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 ">

                                                <div class="form-group">
                                                    <label ><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Thời lượng học  </font></font></label>
                                                    <input data-bind="textInput: durationOfStudy" type="text" class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label ><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Số học phần  </font></font></label>
                                                    <input data-bind="textInput: section" type="email" class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label ><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Tài liệu  </font></font></label>
                                                    <input data-bind="textInput: document" type="text" class="form-control"
                                                           placeholder="Nhập ">
                                                </div>
                                                <div class="form-group">
                                                    <label ><font style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Nội dung phụ  </font></font></label>
                                                    <input data-bind="textInput: subContent" type="email" class="form-control"
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
                        </div>
                        <!-- /.tab-content -->

                    </div>
                    <div class="row">
                        <div class="form-group" style="display: flex;justify-content: space-around;width: 100%;margin-bottom:0!important;padding: 10px 10px 20px 10px;">
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
                        <input style="width: auto" type="text" name="table_search" class="form-control float-right"
                               placeholder="Search">
                        <div class="input-group-append">
                            <button class="btn btn-default"><i class="fas fa-search"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row pb-1">
                <div class="input-group-append col-12">
                    <button data-bind="click: clickShowSubWindows.bind(this)" class="btn btn-success btn-show-add-course"><i
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
                    <tbody data-bind="foreach: listCourse">
                    <tr data-bind="attr:{'id':'course'+id}">
                        <td data-bind="text: ($index() + 1)"></td>
                        <td>
                            <a href="" data-bind=" attr:{href: 'admin-detail-student?id='+id} "><span
                                    data-bind="text: name"></span></a>
                        </td>
                        <td data-bind="text: createDate"></td>
                        <td>
                            <div class="mailbox-controls">
                                <!-- Check all button -->
                                <div class="btn-group">
                                    <button data-bind="click: $parent.bindItemCourseToEdit.bind(this,id)" data-toggle="" title="Sửa" type="button"
                                            class="btn btn-default btn-sm btn-show-add-course">
                                        <i class="fas fa-wrench"></i>
                                    </button>
                                    <button title="Xóa" type="button" class="btn btn-default btn-sm">
                                        <i class="far fa-trash-alt"></i>
                                    </button>
                                </div>
                                <!-- /.btn-group -->
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
</div>
<script src="admin/js_admin/ajax_admin/ajax_course_sv_admin.js"></script>