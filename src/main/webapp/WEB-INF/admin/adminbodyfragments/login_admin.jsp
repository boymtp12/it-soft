<%--
  Created by IntelliJ IDEA.
  User: HieuPC
  Date: 2/26/2021
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="admin/js_admin/ajax_admin/ajax_login_admin.js"></script>
<div class="container" style="height: 100%">

    <div class="block-sign row"
         style="margin: auto;display: flex;justify-content: space-around;align-items: center;height: 100%;">
        <div class="modal-content col-lg-4 col-md-6 col-sm-10 col-xl-4 col-11" style="min-width: 200px;">
            <ul class="nav nav-tabs head-block-sign" role="tablist">
                <li class="nav-item" style="flex: 1">
                    <a class="nav-link active" id="sign-in-tab" data-toggle="tab" href="#sign-in-div" role="tab">Đăng
                        nhập</a>
                </li>
                <li class="nav-item" style="flex: 1">
                    <a class="nav-link " id="sign-up-tab" data-toggle="tab" href="#sign-up-div" role="tab">Đăng ký</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade active show in" id="sign-in-div" role="tabpanel">
                    <div class="card-body">
                        <div class="form-group">
                            <input style="font-size: 1rem" type="email" class="form-control border-ip-none-tlb"
                                   id="emailLog"
                                   placeholder="Nhập email" title="email">
                            <label class="d-none">
                                <p style="color: red;font-size: 0.7rem">Bạn chưa nhập email.</p>
                            </label>
                        </div>
                        <div class="form-group">
                            <input style="font-size: 1rem" type="password" class="form-control border-ip-none-tlb"
                                   id="passwordLog"
                                   placeholder="Nhập mật khẩu">
                            <label class="d-none">
                                <p style="color: red;font-size: 0.7rem">Bạn chưa nhập mật khẩu.</p>
                            </label>
                        </div>
                        <div class="form-check">
                            <input style="position: unset" type="checkbox" class="form-check-input" id="exampleCheck">
                            <label style="font-size: 1rem" class="form-check-label" for="exampleCheck1"><font
                                    style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">Lưu mật khẩu</font></font></label>
                        </div>
                    </div>
                    <div class="card-footer " style="display: flex;background: none;">
                        <button  class="btn btn-success" style="margin: auto;min-width: 100%" onclick="login()">Đăng nhập</button>
                    </div>

                </div>
                <div class="tab-pane fade" id="sign-up-div" role="tabpanel">

                    <div class="card-body">
                        <div class="form-group" id="fullName">
                            <input type="text" style="font-size: 1rem" class="form-control border-ip-none-tlb"

                                   placeholder="Nhập họ và tên" title="Họ và tên">
                            <label class="d-none">
                                <p style="color: red;font-size: 0.7rem">Bạn chưa nhập họ tên.</p>
                            </label>
                        </div>
                        <div class="form-group" id="phoneNumber">
                            <input style="font-size: 1rem" type="text" class="form-control border-ip-none-tlb"

                                   placeholder="Nhập số điện thoại" title="Số điện thoại">
                            <label class="d-none">
                                <p style="color: red;font-size: 0.7rem">Bạn chưa nhập số điện thoại.</p>
                            </label>
                        </div>
                        <div class="form-group" id="email">
                            <input style="font-size: 1rem" type="email" class="form-control border-ip-none-tlb"

                                   placeholder="Nhập email" title="email">
                            <label class="d-none">
                                <p style="color: red;font-size: 0.7rem">Bạn chưa nhập email.</p>
                            </label>
                        </div>
                        <div class="form-group" id="address">
                            <input style="font-size: 1rem" type="text" class="form-control border-ip-none-tlb"

                                   placeholder="Nhập địa chỉ">
                            <label class="d-none">
                                <p style="color: red;font-size: 0.7rem">Bạn chưa nhập địa chỉ.</p>
                            </label>
                        </div>
                        <div class="form-group" id="password">
                            <input style="font-size: 1rem" type="password" class="form-control border-ip-none-tlb"

                                   placeholder="Nhập mật khẩu">
                            <label class="d-none">
                                <p style="color: red;font-size: 0.7rem">Bạn chưa nhập mật khẩu.</p>
                            </label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" style="position: unset" class="form-check-input" id="exampleCheck1">
                            <label style="font-size: 1rem" class="form-check-label" for="exampleCheck1"><font
                                    style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">Lưu mật khẩu</font></font></label>
                        </div>
                    </div>
                    <!-- /.card-body -->

<%--                    <div class="card-footer" style="display: flex;background: none;">--%>
<%--                        <button onclick="checkSignIn()"  class="btn btn-success" style="margin: auto;min-width: 100%"><font--%>
<%--                                style="vertical-align: inherit;"><font--%>
<%--                                style="vertical-align: inherit;">Đăng ký</font></font></button>--%>
<%--                    </div>--%>

                </div>
            </div>
        </div>
        <%--        <div class="card card-primary col-lg-8 col-md-6 col-sm-10 col-xl-6 col-11" style="min-width: 250px;">--%>
        <%--            <div class="card-header">--%>
        <%--                <h3 class="card-title" style="display: flex;justify-content: space-between"><span>Đăng ký</span></h3>--%>
        <%--            </div>--%>
        <%--            <!-- /.card-header -->--%>
        <%--            <!-- form start -->--%>

        <%--        </div>--%>
    </div>
</div>