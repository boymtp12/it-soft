<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 21/01/2022
  Time: 10:14 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="client/js/ajax/ajax_cart_phanmem.js" async></script>

<html>
<head>
    <title>Giỏ hàng phần mềm</title>
</head>
<header style="background-image: url('http://localhost:9092/client/image/images_Trang_Chu/RectangleBlue.jpg'); background-size: cover; height: 229px">
    <div class="nava row">
        <div class="container">
            <div class="area">
                <ul class="circles">
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>

            <div class="row align-items-center">
                <div class="col-12 col-sm-12 col-md-12 col-lg-7 col-sm-7 " style="">
                    <p class="display-4"
                       style="font-size: 22px; font-weight: bold ; color: #EBEBEB;margin: 0">
                        VỪA HỌC VỪA ĐI LÀM
                    </p>
                    <p class="lead">
                        <b>Lập trình java cơ bản + nâng
                            cao</b>
                    </p>

                </div>
                <div class="header-img col-lg-5 col-sm-5 "
                     style=" width: 256px">
                    <img class="img_background" src="http://localhost:9092/client/image/images_Trang_Chu/coding.png"
                         style="width: 256px"
                         alt="">
                </div>
            </div>
        </div>
    </div>
</header>
<body>
<div class="modal-shopping">
    <%--    <div class="icon-close">--%>
    <%--        <i class="fas fa-times"></i>--%>
    <%--    </div>--%>
    <div class="modal-container-shopping row">
        <div class="cart-inner col-12 col-sm-12 col-md-12 col-lg-9 col-xl-9">
            <h3 class="text-title">Giỏ hàng</h3>
            <div class="product-heading">
                <div class="row">
                    <div class="col-7 col-sm-7 col-md-5 col-lg-5 col-xl-5">
                        <label>
                            <%--                            <input type="checkbox" name="" id="">--%>
                            <span class="text-title" style="margin-left: 15px;">Tất cả sản phẩm</span>
                        </label>
                    </div>
                    <div class="col-0 col-sm-0 col-md-2 col-lg-2 col-xl-2 unit-price"><span class="text-title">Đơn giá</span></div>
                    <div class="col-2 col-sm-2 col-md-2 col-lg-2 col-xl-2"><span class="text-title">Số lượng</span></div>
                    <div class="col-2 col-sm-2 col-md-2 col-lg-2 col-xl-2"><span class="text-title">Thành tiền</span></div>
                    <div onclick="trashAllSwInCart()" style="cursor: pointer" id="trash-all" class="col-1 col-sm-1 col-md-1 col-lg-1 col-xl-1"><i class="fas fa-trash-alt"></i></div>
                </div>
            </div>
            <div id="product-content">

            </div>
        </div>
        <div class="cart-total-prices col-xs-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 col-xxl-3">
            <div class="cart-total-prices__inner">
                <div class="infor-customer">
                    <p class="text-title">Khách hàng</p>
                    <span class="input-customer name-customer">
<%--                        <input type="text" name="ht" placeholder='Họ tên'>--%>
                        <input type="text" name="ht" class="form-control" id="validationDefault01" placeholder="Họ tên" value="" required>
                    </span>
                    <span class="input-customer number-customer">
<%--                        <input type="text" name="sdt" placeholder='Số điện thoại'>--%>
                        <input type="text" name="sdt" class="form-control" id="validationDefault02" placeholder="Số điện thoại" value="" required>
                    </span>
                    <span class="input-customer address-customer">
<%--                        <input type="text" name="dc" placeholder='Địa chỉ'>--%>
                        <input type="text" name="dc" class="form-control" id="validationDefault03" placeholder="Địa chỉ" value="" required>
                    </span>
                    <span class="input-customer email-customer">
<%--                        <input type="email" name="email" placeholder='Email'>--%>
                        <input type="email" name="email" class="form-control" id="validationDefault04" placeholder="Email" value="" required>
                    </span>
                    <span class="input-customer node-customer">
<%--                        <input style="height: 56px" type="text" name="node" placeholder='Ghi chú'>--%>
                        <input style="height: 56px" type="text" name="node" class="form-control" id="validationDefault05" placeholder="Ghi chú" value="" required>
                    </span>
                </div>
                <div class="payment">


                </div>
                <button type="submit" class="btn buy-btn">Mua hàng</button>
            </div>
        </div>
    </div>
    <div class="related-product-title text-title">PHẦN MỀM LIÊN QUAN</div>
    <div class="r-product-container">

    </div>
</div>

</body>
</html>

