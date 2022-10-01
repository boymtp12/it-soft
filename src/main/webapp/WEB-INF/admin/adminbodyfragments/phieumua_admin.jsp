<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 13/02/2022
  Time: 4:32 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="admin/js_admin/ajax_admin/ajax_phieumua_admin.js"></script>
<html>
<head>
    <title>Quản lý phiếu mua</title>
</head>
<body>
<div class="block-edit-cp" id="block-edit-cp"
     style="position: fixed;z-index: 10000;width: 100%;height: 100%; left: 0;top: 0; background: #00000045; display: none">
    <div class="edit-topic"
         style="display: flex;align-items: center; width: 100%;height: 97%;margin-bottom: 10px;margin-top: 10px">
        <div class="admin-topic container"
             style="margin-bottom: 10px;max-height: 100%;overflow-y:auto ;padding: 0;margin-top: 10px" id="admin-topic">
            <div class="row card">
                <%--        Start--%>
                <div class="col-12">
                    <div class="nav-tabs-custom">
                        <div class="tab-content">
                            <div class="tab-pane active" id="activity">
                                <!-- Post -->
                                <div class="card card-default col-12" style="margin-bottom: 0px;">
                                    <div class="card-header" style="padding-top: 30px">
                                        <h2 class="card-title font-weight-bold">
                                            <font style="vertical-align: inherit;">
                                                <font style="vertical-align: inherit;">Phiếu mua phần mềm</font>
                                            </font>
                                        </h2>
                                        <div class="card-tools">
                                            <button type="button" class="btn btn-tool" data-widget="fullscreen">
                                                <i class="fas fa-expand-arrows-alt"></i>
                                            </button>
                                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                            <button type="button" class="btn btn-tool btn-hide-add-cp"
                                                    id="btn-hide-add-cp" title="Đóng">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body" style="display: block;">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6"
                                                             style="padding: 5px;margin-bottom: 5px">
                                                            <label for="nameCr"><font
                                                                    style="vertical-align: inherit;"><font
                                                                    style="vertical-align: inherit;">Họ tên khách
                                                                hàng</font></font></label>
                                                            <input id="nameCr" type="text" class="form-control"
                                                                   placeholder="Họ tên">
                                                        </div>
                                                        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6"
                                                             style="padding: 5px;margin-bottom: 5px">
                                                            <label for="mailCr"><font
                                                                    style="vertical-align: inherit;"><font
                                                                    style="vertical-align: inherit;">Email</font></font></label>
                                                            <input id="mailCr" type="email" class="form-control"
                                                                   placeholder="Email">
                                                        </div>

                                                        <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3" style="padding: 5px;margin-bottom: 5px">
                                                            <label for="deliveryDate"><font
                                                                    style="vertical-align: inherit;"><font
                                                                    style="vertical-align: inherit;">Ngày chuyển</font></font></label>
                                                            <input id="deliveryDate" type="date" class="form-control">
                                                        </div>
                                                        <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3" style="padding: 5px;margin-bottom: 5px">
                                                            <label for="createDate"><font
                                                                    style="vertical-align: inherit;"><font
                                                                    style="vertical-align: inherit;">Ngày tạo</font></font></label>
                                                            <input id="createDate" type="date" class="form-control">
                                                        </div>
                                                        <div class="multiselect col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6" style="padding: 5px;margin-bottom: 5px">
                                                            <label for=""><font
                                                                    style="vertical-align: inherit;"><font
                                                                    style="vertical-align: inherit;">Phần mềm</font></font></label>

                                                            <div class="selectBox" onclick="showCheckboxes()">
                                                                <select style="
                                                                        border: 1px solid #ccc;
                                                                        height: 34px;
                                                                        border-radius: 5px">

                                                                    <option>Chọn phần mềm</option>
                                                                </select>
                                                                <div class="overSelect"></div>
                                                                <div style="padding: 8px 12px" id="checkboxes">
                                                                    <label for="one">
                                                                        <input type="checkbox" id="one" />First checkbox</label>
                                                                    <label for="two">
                                                                        <input type="checkbox" id="two" />Second checkbox</label>
                                                                    <label for="three">
                                                                        <input type="checkbox" id="three" />Third checkbox</label>

                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3"
                                                         style="padding: 5px;margin-bottom: 5px">

                                                        <label for="activationDate"><font
                                                                style="vertical-align: inherit;"><font
                                                                style="vertical-align: inherit;">Ngày kích hoạt</font></font></label>
                                                        <input id="activationDate" type="date" class="form-control">
                                                    </div>
                                                    <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3"
                                                         style="padding: 5px;margin-bottom: 5px">
                                                        <label for="expirationDate"><font

                                                                style="vertical-align: inherit;"><font
                                                                style="vertical-align: inherit;">Ngày hết hạn</font></font></label>
                                                        <input id="expirationDate" type="date" class="form-control">
                                                    </div>



                                                    <div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2" style="padding: 5px;margin-bottom: 5px">

                                                        <label for="numberCr"><font
                                                                style="vertical-align: inherit;"><font
                                                                style="vertical-align: inherit;">Số điện
                                                            thoại</font></font></label>
                                                        <input id="numberCr" type="text" class="form-control"
                                                               placeholder="Số điện thoại...">
                                                    </div>

                                                    <div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2"
                                                         style="padding: 5px;margin-bottom: 5px">
                                                        <label for="nguon"><font
                                                                style="vertical-align: inherit;"><font
                                                                style="vertical-align: inherit;">Nguồn</font></font></label>
                                                        <select id="nguon"
                                                                class="form-control select2 select2-hidden-accessible"
                                                                style="width: 100%;" data-select2-id="1" tabindex="-1"
                                                                aria-hidden="true">
                                                            <option value="Page" selected>Page</option>
                                                            <option value="Group">Group</option>
                                                            <option value="Cá nhân">Cá nhân</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2"
                                                         style="padding: 5px;margin-bottom: 5px">
                                                        <label for="soMaMua"><font
                                                                style="vertical-align: inherit;"><font
                                                                style="vertical-align: inherit;">Số mã mua</font></font></label>
                                                        <input id="soMaMua" type="text" class="form-control"
                                                               placeholder="Số mã mua">
                                                    </div>
                                                    <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3" style="padding: 5px;margin-bottom: 5px">
                                                        <label for="trangThai"><font
                                                                style="vertical-align: inherit;"><font

                                                                style="vertical-align: inherit;">Trạng thái phiếu</font></font></label>
                                                        <select id="trangThai" class="form-control select2 select2-hidden-accessible" style="width: 100%;" data-select2-id="1" tabindex="-1" aria-hidden="true">
                                                            <option value="Chưa gọi" selected>Chưa gọi</option>
                                                            <option value="Đã gọi">Đã gọi</option>
                                                            <option value="Đã liên hệ">Đã liên hệ</option>
                                                            <option value="Không trả lời">Không trả lời</option>
                                                            <option value="Đang dùng thử">Đang dùng thử</option>
                                                            <option value="Hết hạn dùng thử">Hết hạn dùng thử</option>
                                                            <option value="Đã mua">Đã mua</option>
                                                            <option value="Không mua">Không mua</option>
                                                        </select>

                                                    </div>

                                                    <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3" style="padding: 5px;margin-bottom: 5px">
                                                        <label for="staffCr"><font
                                                                style="vertical-align: inherit;"><font

                                                                style="vertical-align: inherit;">Tư vấn viên</font></font></label>
                                                        <select id="staffCr" class="form-control select2 select2-hidden-accessible" style="width: 100%;" data-select2-id="1" tabindex="-1" aria-hidden="true">
                                                            <option value="Thảo" selected>Thảo</option>
                                                            <option value="Nguyệt">Nguyệt</option>
                                                            <option value="Hằng">Hằng</option>
                                                            <option value="Vui">Vui</option>
                                                            <option value="Khương">Khương</option>
                                                        </select>

                                                    </div>

                                                    <div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2"
                                                         style="padding: 5px;margin-bottom: 5px">
                                                        <label for="luotGoi"><font
                                                                style="vertical-align: inherit;"><font
                                                                style="vertical-align: inherit;">Lượt gọi</font></font></label>
                                                        <input id="luotGoi" type="text" class="form-control"
                                                               placeholder="Lượt gọi">
                                                    </div>
                                                    <div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2"
                                                         style="padding: 5px;margin-bottom: 5px">
                                                        <label for="luotHoTro"><font
                                                                style="vertical-align: inherit;"><font
                                                                style="vertical-align: inherit;">Lượt hỗ
                                                            trợ</font></font></label>
                                                        <input id="luotHoTro" type="text" class="form-control"
                                                               placeholder="Lượt hỗ trợ">
                                                    </div>

                                                    <div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2"
                                                         style="padding: 5px;margin-bottom: 5px">
                                                        <label for="soMaCai"><font
                                                                style="vertical-align: inherit;"><font
                                                                style="vertical-align: inherit;">Số mã cài</font></font></label>
                                                        <input id="soMaCai" type="text" class="form-control"
                                                               placeholder="Số mã cài">
                                                    </div>




                                                    <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3" style="padding: 5px;margin-bottom: 5px">

                                                        <label for="kyThuatVien"><font
                                                                style="vertical-align: inherit;"><font
                                                                style="vertical-align: inherit;">Kỹ thuật
                                                            viên</font></font></label>
                                                        <select id="kyThuatVien"
                                                                class="form-control select2 select2-hidden-accessible"
                                                                style="width: 100%;" data-select2-id="1" tabindex="-1"
                                                                aria-hidden="true">
                                                            <option value="Nguyễn Tuấn Anh" selected>Nguyễn Tuấn Anh
                                                            </option>
                                                            <option value="Hoàng Trang">Hoàng Trang</option>
                                                            <option value="Vương Ngọc Linh">Vương Ngọc Linh</option>
                                                        </select>
                                                    </div>

                                                    <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3" style="padding: 5px;margin-bottom: 5px">
                                                        <label for="discountSw"><font
                                                                style="vertical-align: inherit;"><font
                                                                style="vertical-align: inherit;">Tổng tiền</font></font></label>
                                                        <input id="discountSw" type="text" class="form-control" placeholder="Tổng tiền phần mềm">
                                                    </div>
                                                    <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3" style="display: none; padding: 5px;margin-bottom: 5px">
                                                        <label for="priceSw"><font
                                                                style="vertical-align: inherit;"><font
                                                                style="vertical-align: inherit;">Giá gốc</font></font></label>
                                                        <input id="priceSw" type="text" class="form-control" placeholder="Giá gốc phần mềm">
                                                    </div>
                                                    <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6" style="padding: 5px;margin-bottom: 5px">

                                                        <label for="noteCr"><font
                                                                style="vertical-align: inherit;"><font
                                                                style="vertical-align: inherit;">Ghi
                                                            chú</font></font></label>
                                                        <input id="noteCr" type="text" class="form-control"
                                                               placeholder="Ghi chú">
                                                    </div>
                                                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12" style="padding:0 4px;">
                                                        <label for="">Phiếu mua phần mềm chi tiết</label>
                                                        <table class="table table-bordered">
                                                            <thead style="font-size: 13px">
                                                            <tr>
                                                                <th style="text-align: center">STT</th>
                                                                <th style="text-align: center">Phần mềm</th>
                                                                <th style="text-align: center">Số lượng</th>
                                                                <th style="text-align: center">Đơn giá</th>
                                                                <th style="text-align: center">Thành tiền</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="couponsDetailBody" style="font-size: 13px">
                                                            <tr>
                                                            </tr>


                                                            </tbody>
                                                        </table>
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
                                            <button type="button" class="btn btn-tool btn-hide-add-cp" title="Đóng">
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
                                            <button type="button" class="btn btn-tool btn-hide-add-cp" title="Đóng">
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
                                                    <input type="text" class="form-control" id="metaSeoTitle"
                                                           placeholder="Nhập tiêu đề phần mềm">
                                                </div>
                                                <div class="form-group">
                                                    <label for="metaKeyWord"><font
                                                            style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Meta
                                                        keyword </font></font></label>
                                                    <input type="text" class="form-control" id="metaKeyWord"
                                                           placeholder="Nhập tiêu đề phần mềm ">
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-3">
                                                <div class="form-group">
                                                    <label for="metaSeoDescription"><font
                                                            style="vertical-align: inherit;"><font
                                                            style="vertical-align: inherit;">Meta
                                                        description </font></font></label>
                                                    <input type="text" class="form-control" id="metaSeoDescription"
                                                           placeholder="Nhập tiêu đề phần mềm ">
                                                </div>
                                                <div class="form-group">
                                                    <label>Meta robot</label>
                                                    <select id="metaSeoRobotSua"
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
                            <button id="postCourse" class="btn btn-success" style="display: none" disabled>Lưu phần mềm
                            </button>
                            <button id="btnEditCp" class="btn btn-success">Lưu phần mềm</button>
                        </div>
                    </div>
                    <!-- /.nav-tabs-custom -->
                </div>

                <%--        end--%>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header row justify-content-around"
                 style=" margin-bottom: 15px; border-bottom: none; margin-top: 10px;">
                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-3">
                    <h3 class="card-title">Danh Sách khách hàng</h3>
                </div>
                <div class="card-tools col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-2 " style="margin-right: 0px">
                    <div class="input-group input-group-sm" style="display: flex">
                        <input id="inputSearchCourse" style="width: auto" type="text" name="table_search"
                               class="form-control float-right" placeholder="Search">

                        <div class="input-group-append">
                            <button id="btnSearchCourse" class="btn btn-default"><i class="fas fa-search"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row pb-1">
                <div class="input-group-append col-12">
                    <button onclick="handlePostCr()" class="btn btn-success btn-show-add-cp"><i
                            class="fas fa-plus"></i> Thêm mới
                    </button>
                </div>
            </div>

            <!-- /.card-header -->
            <div class="card-body table-responsive p-0" style="height: auto;">
                <table class="table table-head-fixed table-bordered" style="text-align: center;font-size: 13px;">
                    <thead style="text-align: center">
                    <tr>
                        <th>STT</th>
                        <th style="min-width:200px;text-align: center">Họ và tên</th>
                        <th style="min-width:150px;text-align: center">Số điện thoại</th>
                        <th style="min-width: 250px;text-align: center">Ghi chú</th>
                        <th style="min-width:250px;text-align: center">Gmail</th>
                        <th style="min-width: 130px;text-align: center">Trạng thái</th>
                        <th style="min-width:100px;text-align: center">Lượt gọi</th>
                        <th style="min-width: 100px;text-align: center">Lượt hỗ trợ</th>
                        <th style="text-align: center">Ngày kích hoạt</th>
                        <th style="text-align: center">Ngày hết hạn</th>
                        <th style="min-width:100px;text-align: center">Số mã cài</th>
                        <th style="min-width:100px;text-align: center">Số mã mua</th>
                        <th style="min-width:150px;text-align: center">Tư vấn viên</th>
                        <th style="min-width:120px;text-align: center">Nguồn</th>
                        <th style="min-width:150px;text-align: center">Kỹ thuật viên</th>
                        <th style="min-width:110px;text-align: center">Xử lý</th>
                    </tr>
                    </thead>
                    <tbody id="tableShowAllCoupons">
                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
</div>
<div class="dialog overlay" id="infor-dialog">

</div>
</body>
</html>