<%--
  Created by IntelliJ IDEA.
  User: HieuPC
  Date: 2/26/2021
  Time: 10:46 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="admin/js_admin/ajax_admin/detail_student_admin.js"></script>
<div class="block-detail-student container"
     style="padding-right: 0px;padding-left:0px;margin-right:0px;margin-left: 0px;margin: auto  ">
    <div class="row">
        <div class="col-12">
            <!-- About Me Box -->
            <div class="card" style="padding: 15px">
                <div class="tab-content">
                    <div class="tab-pane active" id="activity">
                        <!-- Post -->
                        <form class="card card-default col-12" style="margin-bottom: 0px;" novalidate=""
                              data-bind="submit: btnSaveNew" method="post" id="bootstrapForm">
                            <div class="card-header">
                                <h2 class="card-title font-weight-bold"><font
                                        style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">Chi tiết học viên</font></font></h2>

                                <div class="card-tools">
                                    <button title="Chỉnh sửa" data-bind="click: edittSingleClick.bind(this)" type="button" class="btn btn-tool">
                                        <i class="fas fa-wrench"></i>
                                    </button>
                                    <button title="Cuộn lại" type="button" class="btn btn-tool"
                                            data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>

                                </div>
                            </div>
                            <div class="card-body" style="display: block;">
                                <div data-bind="if: showModal()">
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                            <div class="form-group">
                                                <label class="h4 form-control-label" for="input1">Họ và tên:
                                                    <abbr class="text-danger" title="This is required">*</abbr>
                                                </label>
                                                <input id="input1" data-bind="textInput: fullName,enable: checkEdit" type="text"
                                                       class="form-control" placeholder="Nhập họ và tên (*)"
                                                       required autocomplete="false">
                                                <div class="invalid-feedback">Làm ơn nhập. Đây là bắt buộc</div>
                                            </div>
                                            <div class="form-group">
                                                <label class="h4 form-control-label" for="input1">Email:
                                                    <abbr class="text-danger" title="This is required">*</abbr>
                                                </label>
                                                <input data-bind="textInput: email ,enable: checkEdit" type="text"
                                                       class="form-control" style="height: 35px"
                                                       pattern="^[a-z][a-z0-9_\.]{3,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$"
                                                       placeholder="Nhập email (*)" required autocomplete="false    ">
                                                <div class="invalid-feedback">Làm ơn nhập. Đây là bắt buộc</div>
                                            </div>
                                            <div class="form-group">
                                                <label class="h4 form-control-label" for="input1">Số điện thoại:
                                                    <abbr class="text-danger" title="This is required">*</abbr>
                                                </label>
                                                <input data-bind="textInput: phoneNumber,enable: checkEdit" type="text"
                                                       style="height: 35px"
                                                       class="form-control" pattern="^\+?(?:0|84)(?:\d){9}$"
                                                       placeholder="Nhập số điện thoại (*)" required>
                                                <div class="invalid-feedback">Làm ơn nhập. Đây là bắt buộc</div>
                                            </div>
                                            <div class="form-group">
                                                <label class="h4 form-control-label" for="input1">Địa chỉ:
                                                    <abbr class="text-danger" title="This is required">*</abbr>
                                                </label>
                                                <input data-bind="textInput: address,enable: checkEdit"
                                                       type="text" class="form-control" style="height: 35px"
                                                       placeholder="Nhập địa chỉ (*)" >
                                                <div class="invalid-feedback">Làm ơn nhập. Đây là
                                                    bắt buộc
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="h4 form-control-label" for="input1">Ngày/tháng/năm sinh:
                                                    <abbr class="text-danger" title="This is required">*</abbr>
                                                </label>
                                                <input data-bind="textInput: dateOfBirth,enable: checkEdit"
                                                       type="text" class="form-control" style="height: 35px"
                                                       placeholder="Ngày/tháng/năm sinh (*)" type="text"
                                                       onfocus="(this.type='date')" onblur="(this.type='text')"
                                                       required>
                                                <div class="invalid-feedback">Làm ơn nhập. Đây là bắt buộc</div>
                                            </div>
                                            <div class="form-group">
                                                <label class="h4 form-control-label" for="input1">Công việc hiện tại:
                                                    <abbr class="text-danger" title="This is required">*</abbr>
                                                </label>
                                                <input data-bind="textInput: jobCurrent,enable: checkEdit" type="text"
                                                       class="form-control" style="height: 35px"
                                                       placeholder="Nhập công việc hiện tại (*)" >
                                                <div class="invalid-feedback">Làm ơn nhập. Đây là bắt buộc</div>
                                            </div>
                                            <div class="form-group">
                                                <label class="h4 form-control-label" for="input1">Tên trường:
                                                    <abbr class="text-danger" title="This is required">*</abbr>
                                                </label>
                                                <input data-bind="textInput: nameSchool,enable: checkEdit" type="text"
                                                       class="form-control" style="height: 35px"
                                                       placeholder="Nhập tên trường (*)" >
                                                <div class="invalid-feedback">Làm ơn nhập. Đây là bắt buộc</div>
                                            </div>
                                            <div class="form-group">
                                                <label class="h4 form-control-label" for="input1">Tên khoa
                                                    <abbr class="text-danger" title="This is required">*</abbr>
                                                </label>
                                                <input data-bind="textInput: facultySchool,enable: checkEdit" type="text"
                                                       class="form-control" style="height: 35px"
                                                       placeholder="Nhập tên khoa (*)" >
                                                <div class="invalid-feedback">Làm ơn nhập. Đây là bắt buộc</div>
                                            </div>
                                            <div class="form-group">
                                                <label class="h4 form-control-label" for="input1">Học phí phải đóng: <span
                                                        data-bind="text: tuitionFeeOfStudent" style="color: red"></span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">

                                            <div class="form-group">
                                                <label class="h4 form-control-label" for="input1">Mã cá nhân:
                                                    <abbr class="text-danger" title="This is required">*</abbr>
                                                </label>
                                                <input data-bind="textInput: codePrivate" type="text"
                                                       class="form-control" style="height: 35px"
                                                       placeholder="Nhập mã cá nhân" required disabled>
                                                <div class="invalid-feedback">Làm ơn nhập. Đây là bắt buộc</div>
                                            </div>
                                            <div class="form-group">
                                                <label class="h4 form-control-label" for="input1">Mã giới thiệu:
                                                    <abbr class="text-danger" title="This is required">*</abbr>
                                                </label>
                                                <input data-bind="textInput: codeGt,enable: checkEdit" type="text"
                                                       class="form-control" style="height: 35px"
                                                       placeholder="Nhập mã giới thiệu">
                                                <div class="invalid-feedback">Làm ơn nhập. Đây là bắt buộc</div>
                                                <div class="text-danger" data-bind="if: codeGt() == 'Cảnh báo: Trưởng nhóm không học cùng lớp. Vui lòng kiểm tra lại'? true: false">Vui lòng kiểm tra lại mã.</div>
                                            </div>
                                            <div class="form-group">
                                                <label class="h4 form-control-label" for="input1">Khóa học:
                                                    <abbr class="text-danger" title="This is required">*</abbr>
                                                </label>
                                                <select data-bind="options: listCourse,optionsText: 'dataT',optionsValue:'valueT',value: valueOfEachCourse,enable: checkEdit"
                                                        class="custom-select" style="height: 35px">

                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label class="h4 form-control-label" for="input1">Nhận chứng chỉ tại:
                                                    <abbr class="text-danger" title="This is required">*</abbr>
                                                </label>
                                                <select data-bind="value: takeCertification,enable: checkEdit" class="custom-select"
                                                        style="height: 35px">
                                                    <option value="0">Nhận chứng chỉ tại nhà</option>
                                                    <option value="1">Nhận chứng chỉ tại trung tâm</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label class="h4 form-control-label" for="input1">Giới tính
                                                    <abbr class="text-danger" title="This is required">*</abbr>
                                                </label>
                                                <select data-bind="value: sex,enable: checkEdit" class="custom-select"
                                                        style="height: 35px">
                                                    <option value="0">Nam</option>
                                                    <option value="1">Nữ</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label class="h4 form-control-label" for="input1">Nhóm:
                                                    <abbr class="text-danger" title="This is required">*</abbr>
                                                </label>
                                                <select class="custom-select" style="height: 35px"
                                                        data-bind="options: listGroupStudent,optionsText: 'dataT',optionsValue:'valueT',value: valueOfEachGroupStudent,enable: checkEdit">
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label class="h4 form-control-label" for="input1">Người tư vấn:
                                                    <abbr class="text-danger" title="This is required">*</abbr>
                                                </label>
                                                <select class="custom-select" style="height: 35px"
                                                        data-bind="options: listUserSystem,optionsText: 'dataT',optionsValue:'valueT',value: valueOfEachUserSystem,enable: idAdmin() != 8 ? false : true">
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label class="h4 form-control-label" for="input1">Đã giới thiệu được:
                                                    <span data-bind="text: listStudentGtLength"></span> học viên
                                                </label>
                                                <div class="row">
                                                    <ul style="display: flex;flex-wrap: wrap; padding: 0">
                                                        <!-- ko foreach: listStudentGt-->
                                                        <li style="padding: 2px 10px;margin: 3px 5px;background: #dadada;border-radius: 5px">
                                                            <a title="Xem thông tin chi tiết" href=""
                                                               data-bind=" attr:{href: 'admin-detail-student?id='+id},click: $parent.loading.bind(this, 'admin-detail-student?id='+id) ">
                                                                <span data-bind="text: fullName"
                                                                      style="color: black"> </span>
                                                            </a>
                                                        </li>
                                                        <!-- /ko -->
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="h4 form-control-label" for="input1">Có: <span
                                                        data-bind="text: lengthGroup"></span> Nhóm.
                                                </label>
                                                <label class="h4 form-control-label" for="input1">Trưởng nhóm:
                                                    <a title="Xem thông tin chi tiết" href=""
                                                       data-bind=" attr:{href: 'admin-detail-student?id='+ idLeader()},click: loading.bind(this, 'admin-detail-student?id='+idLeader()) ">
                                                               <span data-bind="text: fullNameLeader"></span>.
                                                    </a>

                                                </label>
                                                <label class="h4 form-control-label" for="input1">Số thành viên (chưa tính trưởng nhóm): <span
                                                        data-bind="text: listStudentGtLengthLike"></span>.
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group"
                                     style="display: flex;justify-content: space-around;width: 100%;margin-bottom:0!important;padding: 10px 10px 20px 10px;">
                                    <button type="submit" data-bind="enable: checkEdit" class="btn btn-success"> Lưu lại</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <%--        end--%>
            </div>
            <!-- /.card -->
        </div>
    </div>
</div>
