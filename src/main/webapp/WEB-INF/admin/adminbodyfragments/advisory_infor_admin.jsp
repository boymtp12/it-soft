<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Content Header (Page header) -->
<script src="admin/js_admin/ajax_admin/ajax_advisory_infor_admin.min.js"></script>
<div class="row" style="min-height: 300px">
    <div class="col-12">
        <div class="card" style="height: 100%">
            <div class="card-header">
                <h3 class="card-title font-weight-bold" >Danh sách học viên yêu cầu được tư vấn</h3>

<%--                <div class="card-tools">--%>
<%--                    <div class="input-group input-group-sm" style="width: 150px;">--%>
<%--                        <input type="text" name="table_search" class="form-control float-right"--%>
<%--                               placeholder="Search">--%>

<%--                        <div class="input-group-append">--%>
<%--                            <button type="submit" class="btn btn-default">--%>
<%--                                <i class="fas fa-search"></i>--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>
            <!-- /.card-header -->
            <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tên phụ huynh</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Tên học sinh</th>
                        <th>Năm sinh</th>
                        <th>Môn học</th>
                        <th>Địa chỉ lớp</th>
                        <th>Đã tư vấn</th>
                    </tr>
                    </thead>
                    <tbody id="list-student">
                    <tr>
                        <td>183</td>
                        <td>John Doe</td>
                        <td>11-7-2014</td>
                        <td><span class="tag tag-success">Approved</span></td>
                        <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>

                </table>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
</div>
