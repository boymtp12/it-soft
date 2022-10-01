<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="admin/js_admin/ajax_admin/ajax_uploadfile_admin.js"></script>
<script src="admin/js_admin/upload_file.js"></script>
<script src="https://adminlte.io/themes/dev/AdminLTE/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<script type="text/javascript">
    $(document).ready(() => {
        bsCustomFileInput.init()
    })
</script>


<div class=" row">
    <div class="col-12">
        <div class="card" style="padding: 10px">
            <div class="card-header">
                <h3 class="card-title font-weight-bold">Danh sách ảnh tải lên</h3>
            </div>
            <div class="card-folder row" style="padding: 10px 0px 0px 0px">
                <div class="form-group col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                    <div class="input-group d-flex justify-content-around">
                        <form method="POST" class="custom-file" action="" enctype="multipart/form-data"
                              id="btn-upload-file">
                            <input name="file" type="file" class="custom-file-input" id="inputFileImage">
                            <label class="custom-file-label" for="inputFileImage">Tải ảnh lên</label>
                        </form>

                    </div>
                </div>
                <div class="form-group col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 d-flex" style="align-items: center">
                    <span style="width: auto" >Chọn folder: </span>
                    <div style="width: auto;height: auto;margin-left: 15px" class="input-group d-flex justify-content-around">
                        <select style="padding: 2px" id="folderSelect">
                            <option value="giangvien">Giảng Viên</option>
                            <option value="baiviet">Bài Viết</option>
                            <option value="khoahoc">Khóa học</option>
                            <option value="khac">Khác</option>
                        </select>

                    </div>
                </div>
            </div>

            <!-- /.card-header -->
            <div class="card-body table-responsive p-0" style="border: none">
                <table class="table table-hover text-nowrap">
                    <thead>
                    <tr>
                        <th style="width: 10px">STT</th>
                        <th>Ảnh</th>
                        <th>Nguồn</th>
                        <th style="width: 50px">Xóa</th>
                    </tr>
                    </thead>
                    <tbody id="listImageAdmin">


                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
    </div>
</div>