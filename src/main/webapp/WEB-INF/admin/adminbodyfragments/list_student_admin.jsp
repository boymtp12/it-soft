<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="admin/js_admin/ajax_admin/ajax_list_student_admin.js"></script>
<script src="admin/js_admin/libs_admin/table2excel.js"></script>
<%--<script src="//cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>--%>
<div class="row" style="margin-bottom: 40px!important;">
    <div class="col-12">
        <div class="card" style="font-size: 12px">
            <div class="card-header" style="display:inline;">
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6 mb-3">
                        <h3 class="card-title">Danh sách sinh viên đăng ký khóa học</h3>
                    </div>
<%--                    <div class="card-tools col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-2 "--%>
<%--                         style="margin-right: 0px;display: flex;justify-content: flex-end;">--%>
<%--                        <button data-bind="click: btnShowBlockChucNang.bind(this)" class="btn btn-success"--%>
<%--                                style="display: inline;margin-right: 15px">Chức năng--%>
<%--                        </button>--%>
<%--                    </div>--%>
                </div>
                <div class="row">
                    <div class="input-group input-group-sm"
                         style="display: flex;width: 100%;justify-content: flex-start">
                        <div data-bind="click: selectGr.bind(this)" style="font-size: 0.8rem;margin-right: 10px">
                            <select data-bind="options: listCourse,optionsText: 'dataT',optionsValue:'valueT',value: selectedItemListCourse,optionsCaption: 'Chọn khóa học...'"
                                    id="selectClassStudent"
                                    style=" padding: 5px;margin-top: 10px; margin-bottom: 5px;border: 1px solid #00000059;height: 30px">
                            </select>
                        </div>
                        <div data-bind="click: selectGr.bind(this)" style="font-size: 0.8rem;margin-right: 10px">
                            <select data-bind="options: listGroupStudent,optionsText: 'dataT',optionsValue:'valueT',value: selectedItemListGroupStudent,optionsCaption: 'Chọn nhóm...'"
                                    id="selectGroupStudent"
                                    style=" padding: 5px;margin-top: 10px; margin-bottom: 5px;border: 1px solid #00000059;height: 30px">
                            </select>
                        </div>
                        <div style="font-size: 0.8rem;margin-right: 10px">
                            <button data-bind="click: btnFilterStudent.bind(this)" class="btn btn-success"
                                    style=" padding: 5px;margin-top: 10px; margin-bottom: 5px;border: 1px solid #00000059;height: 30px">
                                Lọc
                            </button>
                        </div>
                        <div class="form-inline sidebar-search-open" style="font-size: 0.8rem;margin-right: 10px">
                            <select data-bind="value: selectedItemListSearch"
                                    style=" padding: 5px;margin: 10px 10px 5px 0px;border: 1px solid #00000059;height: 30px">
                                <option value="1">Tìm kiếm theo tên</option>
                                <option value="2">Tìm kiếm theo số điện thoại</option>
                                <option value="3">Tìm kiếm theo mã cá nhân</option>
                                <option value="4">Tìm kiếm theo mã giới thiệu</option>
                                <option value="5">Tìm kiếm theo ngày tháng năm</option>
                            </select>
                            <div class="input-group" style="margin-bottom: 5px; margin-top: 10px">
                                <input id="inputSearch" class="form-control form-control-sidebar"
                                       style="width: auto;height: 30px;font-size: 0.8rem" type="search"
                                       placeholder="Nhập..."
                                       aria-label="Search"
                                       data-bind="textInput : keywordSearch, valueUpdate : 'afterkeydown',event: {'keyup': onEnter}">
                                <div class="input-group-append" style="height: 30px">
                                    <button class="btn btn-success "
                                            data-bind="click: btnSearchNV.bind(this,keywordSearch())">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div style="font-size: 0.8rem;margin-right: 10px">
                            <button data-bind="click: exportExcell.bind(this)" class="btn btn-success"
                                    style=" padding: 5px;margin-top: 10px; margin-bottom: 5px;border: 1px solid #00000059;height: 30px">
                                Export excel
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                    <thead>
                    <tr style="font-size: 1rem">
                        <th>STT</th>
                        <th>Thông tin</th>
                        <th>Địa chỉ</th>
                        <th>Nhóm</th>
                        <th>Mã giới thiệu</th>
                        <th>Khóa học</th>
                        <th>Nơi học</th>
                        <th>Ngày đăng ký</th>
                        <th>Tư vấn viên</th>
                    </tr>
                    </thead>
                    <tbody id="list-student" data-bind="foreach: listStudent">
                    <tr data-bind="attr:{'id':'attrStudent'+id},click: $parent.clickGetIdStudent.bind(this,id)">
                        <td data-bind="text: ($index() + 1)"></td>
                        <td>
                            <a rel="follow, index" title="Xem chi tiết"
                               data-bind=" attr:{href: 'admin-detail-student?id='+id},click: $parent.loading.bind(this, 'admin-detail-student?id='+id) ">
                                <span>Tên: </span> <span data-bind="text: fullName"></span>
                            </a>
                            <p>Email: <span data-bind="text: email"></span></p>
                            <p>Sđt: <span data-bind="text: phoneNumber"></span></p>
                            <p>Giới tính: <span data-bind="text: sex == 0?'nam':'nữ'"></span> ${sex}</p>
                            <p>Mã cá nhân: <span data-bind="text: codePrivate "></span></p>
                        </td>
                        <td data-bind="text: address"></td>
                        <td style="display: flex">
                            <select data-bind="value: idGroupStudentOfEachStudent," style="padding: 2px 2px">
                                <!-- ko foreach:  $parent.listGroupStudentOfEachStudent-->
                                <option data-bind="text: dataT,  attr: {'value':valueT,selected: valueT == $parent.groupStudentIdNum ? true:false},"></option>
                                <!-- /ko -->
                            </select>
                        </td>
                        <td data-bind="text: codeGt"></td>
                        <td data-bind="attr:{'class':'classListStudent'+$index()}">

                        </td>
                        <td>
                            Viện tin học xây dựng
                        </td>
                        <td data-bind="text: signinDate"></td>
                        <td>
                            <select data-bind="value: idUserSystemOfEachStudent,enable: $parent.idAdmin() != 8 ? false : true "
                                    style="padding: 2px 2px">
                                <!-- ko foreach:  $parent.listUserSystem-->
                                <option data-bind="text: dataT,  attr: {'value':valueT,selected: valueT == $parent.userIdNum ? true:false},"></option>
                                <!-- /ko -->
                            </select>
                        </td>
                    </tr>
                    </tbody>
                    <tfoot style="font-size: 1rem" data-bind="if: listStudent().length == 0?true:false">
                    <tr>
                        <td colspan="7">Không có sinh viên</td>
                    </tr>
                    </tfoot>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
</div>
<%--table này có chức năng dùng để export excel, để ẩn đi vì nội dung nó giống table trên--%>
<div class="card-body table-responsive p-0" style="visibility: hidden;opacity: 0;height: 1px">
    <table class="table table-hover text-nowrap" id="idTable">
        <thead>
        <tr style="font-size: 1rem">
            <th>STT</th>
            <th>Họ và tên</th>
            <th>Giới tính</th>
            <th>Số điện thoại</th>
            <th>Email</th>
            <th>Ngày tháng năm sinh</th>
            <th>Địa chỉ</th>
            <th>Trường</th>
            <th>Khoa</th>
            <th>Mã cá nhân</th>
            <th>Mã giới thiệu</th>
            <th>Khóa học</th>
            <th>Học phí phải đóng</th>
            <th>Ngày đăng ký</th>
            <th>Nơi học</th>
            <th>Nhận chứng chỉ</th>
            <th>Nhóm</th>
            <th>Tư vấn viên</th>
            <%--                        <!-- ko if: $root.hideee()-->--%>

            <%--                        <!-- /ko -->--%>
        </tr>
        </thead>
        <tbody data-bind="foreach: listStudent">
        <tr data-bind="attr:{'id':'attrStudent'+id},click: $parent.clickGetIdStudent.bind(this,id)">
            <td data-bind="text: ($index() + 1)"></td>
            <td>
                <a rel="follow, index" title="Xem chi tiết"
                   data-bind=" attr:{href: 'admin-detail-student?id='+id},click: $parent.loading.bind(this, 'admin-detail-student?id='+id) ">
                    <span></span> <span data-bind="text: fullName"></span>
                </a>
            </td>
            <td data-bind="text: sex == 0?'nam':'nữ'"></td>
            <td data-bind="text: phoneNumber"></td>
            <td data-bind="text: email"></td>
            <td data-bind="text: dateOfBirth"></td>
            <td data-bind="text: address"></td>
            <td data-bind="text: nameSchool"></td>
            <td data-bind="text: facultySchool"><p>Mã cá nhân: <span data-bind="text: codePrivate "></span></p></td>
            <td data-bind="text: codePrivate"></td>
            <td data-bind="text: codeGt"></td>
            <td data-bind="attr:{'class':'classListStudent'+$index()}">
            </td>
            <td data-bind="text: tuitionFeeOfStudent"></td>
            <td data-bind="text: signinDate"></td>
            <td>
                Viện tin học xây dựng
            </td>
            <td>
                <select data-bind="value: takeCertification == true? 1:0"
                        style="padding: 2px 2px">
                    <option value="0">Nhận chứng chỉ tại nhà</option>
                    <option value="1">Nhận chứng chỉ tại trung tâm</option>
                </select>
            </td>
            <td style="display: flex">
                <select data-bind="value: idGroupStudentOfEachStudent," style="padding: 2px 2px">
                    <!-- ko foreach:  $parent.listGroupStudentOfEachStudent-->
                    <option data-bind="text: dataT,  attr: {'value':valueT,selected: valueT == $parent.groupStudentIdNum ? true:false},"></option>
                    <!-- /ko -->
                </select>
            </td>
            <td>
                <select data-bind="value: idUserSystemOfEachStudent,enable: $parent.idAdmin() != 8 ? false : true "
                        style="padding: 2px 2px">
                    <!-- ko foreach:  $parent.listUserSystem-->
                    <option data-bind="text: dataT,  attr: {'value':valueT,selected: valueT == $parent.userIdNum ? true:false},"></option>
                    <!-- /ko -->
                </select>
            </td>
        </tr>
        </tbody>
    </table>
</div>

