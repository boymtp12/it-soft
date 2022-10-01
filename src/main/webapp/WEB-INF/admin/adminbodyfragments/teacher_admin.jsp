<%--
  Created by IntelliJ IDEA.
  User: HieuPC
  Date: 3/25/2021
  Time: 1:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="admin/js_admin/ajax_admin/ajax_teacher_admin.js" async></script>
<script src="admin/js_admin/teacher_admin.js" async></script>
<script src="https://adminlte.io/themes/dev/AdminLTE/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<script src="https://adminlte.io/themes/dev/AdminLTE/plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
<script src="https://adminlte.io/themes/dev/AdminLTE/plugins/moment/moment.min.js"></script>

<script type="text/javascript">
    $(document).ready(() => {
        bsCustomFileInput.init()
    })
</script>

<div class="edit-teacher " id="edit-teacher"
     style="display: none; width:100%;height: 100%;position: fixed;opacity: 1;top: 0;left: 0;z-index: 72347;background: #00000030;">
    <div class="row" style="justify-content: space-around;align-items: center;height: 100%;">
        <div class="col-11 col-md-8 col-sm-10 col-lg-8 col-xl-8"
             style="max-height: 100%;overflow: auto;padding: 0!important;">
            <div class="card card-secondary">
                <div class="card-header">
                    <h3 class="card-title">Thông tin giảng viên</h3>

                    <div class="card-tools">
                        <button type="button" class="btn btn-tool btn-secondary" data-card-widget="collapse"
                                data-toggle="tooltip" title="Cuộn lại">
                            <i class="fas fa-minus"></i></button>
                        <button id="btn-hide-teacher" type="button" class="btn btn-tool btn-secondary" title="Đóng">
                            <i class="fas fa-times"></i></button>
                    </div>
                </div>
                <div class="card-body" style="padding: 10px 5px 5px 5px">
                    <div class="row">
                        <div class="col-12 col-md-12 col-lg-6 col-xl-6">
                            <div class="form-group">
                                <label>Họ và tên:</label>
                                <div class="input-group d-flex">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                                    </div>
                                    <input id="nameTeacher" style="width: auto" type="text" class="form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Ngày tháng năm sinh:</label>
                                <div class="input-group d-flex">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                                    </div>
                                    <input id="dateOfBirthTeacher" style="width: auto" type="date" class="form-control"
                                           placeholder="mm-dd-yyyy">
                                </div>
                                <!-- /.input group -->
                            </div>
                            <div class="form-group">
                                <label>Ảnh slide:</label>
                                <div class="input-group d-flex">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                                    </div>
                                    <input id="imageSlide" style="width: auto" type="text" class="form-control"
                                           placeholder="dán link ảnh">
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- phone mask -->
                            <div class="form-group ">
                                <label>Ảnh đại diện:</label>
                                <div class="input-group row d-flex" style="justify-content: space-around">
                                    <div class="col-7 col-sm-7 col-md-8 col-lg-9 col-xl-9" style="padding: 0px">
                                        <div class="input-group d-flex justify-content-around ">
                                            <form method="POST" class="custom-file" action=""
                                                  enctype="multipart/form-data"
                                                  id="btn-upload-file">
                                                <input name="file" type="file" class="custom-file-input"
                                                       id="inputFileImage"
                                                       placeholder="Tải ảnh...">
                                                <label class="custom-file-label" for="inputFileImage">Ảnh...</label>
                                            </form>
                                        </div>
                                    </div>
                                    <div id="blockUpLoadImageTeacher" style="width: 40px;height: 40px"
                                         class="input-group-prepend col-5 col-sm-5 col-md-4 col-lg-3 col-xl-3">
                                        <img src="https://znews-photo.zadn.vn/w1200/Uploaded/qhj_yvobvhfwbv/2018_07_18/Nguyen_Huy_Binh1.jpg"
                                             style="width: 40px;height: 40px">
                                    </div>
                                    <input id="imgSrcTeacher" style="width: auto;display: none" type="text"
                                           class="form-control" im-insert="false">
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->

                        </div>
                        <div class="col-12 col-md-12 col-lg-6 col-xl-6">
                            <!-- phone mask -->
                            <div class="form-group ">
                                <label>Chức vụ:</label>
                                <div class="input-group d-flex ">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-star"></i></span>
                                    </div>
                                    <input id="regencyTeacher" style="width: auto" type="text" class="form-control">
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->

                            <!-- phone mask -->
                            <div class="form-group">
                                <label>Địa chỉ:</label>
                                <div class="input-group d-flex">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-map-marker"></i></span>
                                    </div>
                                    <input id="addressTeacher" style="width: auto" type="text" class="form-control">
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- phone mask -->
                            <div class="form-group">
                                <label>Quê quán:</label>
                                <div class="input-group d-flex">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-map-marker"></i></span>
                                    </div>
                                    <input id="countrySide" style="width: auto" type="text" class="form-control">
                                </div>
                                <!-- /.input group -->
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label>Profile</label>
                                <div id="profile-teacher" style="min-height: 250px"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group d-flex justify-content-around">
                                <button id="btnSaveTeacher" style="display: inline" type="button" class="btn  btn-secondary" title="Lưu lại">
                                    Thêm mới
                                </button>
                                <button style="display: none" id="btnSaveEditTeacher" type="button" class="btn  btn-secondary" title="Lưu lại">
                                    Lưu lại
                                </button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
</div>
<div class="row" style="margin-bottom: 50px!important;">
    <div class="col-12">
        <div class="card" style="padding: 5px">
            <div class="card-header row justify-content-around"
                 style=" margin-bottom: 15px; border-bottom: none; margin-top: 10px;">
                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-3">
                    <h3 class="card-title">Danh Sách Giảng Viên</h3>
                </div>
                <div class="card-tools col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-2 " style="margin-right: 0px">
                    <div class="input-group input-group-sm" style="display: flex">
                        <input style="width: auto" type="text" id="searchTeacher" name="table_search"
                               class="form-control float-right"
                               placeholder="Search">

                        <div class="input-group-append">
                            <button class="btn btn-default" onclick="searchTeacher()"><i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row pb-1">
                <div class="input-group-append col-12">
                    <button onclick="addNewTeacher()" class="btn btn-success btn-show-teacher"><i
                            class="fas fa-plus"></i> Thêm
                        mới
                    </button>
                </div>
            </div>

            <!-- /.card-header -->
            <div class="card-body table-responsive p-0" style="min-height: 350px; max-height: 900px">
                <table class="table table-head-fixed">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên</th>
                        <th>Năm sinh</th>
                        <th>Chức vụ</th>
                        <th>Địa chỉ</th>
                        <th>Chức năng</th>
                    </tr>
                    </thead>
                    <tbody id="tableShowAllTeacher">


                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
</div>
