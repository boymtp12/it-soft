$(function () {
})

/*đăng nhập thành công sẽ lưu thông tin vào local storage*/
function login() {
    let formLogin = {
        email: $("#emailLog").val(),
        password: $("#passwordLog").val()
    }
    console.log(formLogin)
    ajaxCallPost("user/login", formLogin).then(rs => {
        console.log(rs)
        setItemLocalStorage("user", rs);
        // setItemLocalStorage("user", rs);
        window.location.href = "admin-home";
    }).catch(err => {
        console.log(err);
        alertDanger("Tài khoản hoặc mật khẩu không đúng");
    })
}

/*check xem các trường điền vào form đăng ký có đúng định dạng không*/
function checkSignIn() {
    let checkMail = false;
    let name = $("#fullName >input").val();
    let phone = $("#phoneNumber >input").val();
    let address = $("#address >input").val();
    let email = $("#email >input").val();
    let password = $("#password >input").val();
    if (name == "") {
        $("#fullName >input").css({"border": "1px solid red"})
    } else {
        $("#fullName >input").css({"border": ""})
    }
    if (phone == "") {
        $("#phoneNumber >input").css({"border": "1px solid red"})
    } else {
        $("#phoneNumber >input").css({"border": ""})
    }
    if (address == "") {
        $("#address >input").css({"border": "1px solid red"})
    } else {
        $("#address >input").css({"border": ""})
    }
    if (email != "") {
        $("#email >input").css({"border": ""})
        checkMail = true;
    } else {
        checkMail = false;
        $("#email >input").css({"border": "1px solid red"})
    }
    if (password == "") {
        $("#password >input").css({"border": "1px solid red"})
    } else {
        $("#password >input").css({"border": ""})
    }
    if (name != "" && phone != "" && checkMail == true && address != "" && password != "") {
        sign(name, phone, address, email, password);
    } else {
        alertWarning("Bạn nhập thiếu thông tin");
    }

}

/*Đăng ký*/
function sign(name, phone, address, email, password) {
    let formSign = {
        "name": name,
        "phoneNumber": phone,
        "address": address,
        "email": email,
        "password": password,
        "deleted": true
    }
    console.log(formSign)
    ajaxCallPost("user/sign", formSign).then(rs => {
        console.log(rs)
        // xoa cai cu
        LocalStorage.removeItem("user");
        // localStorage.removeItem("user")
        // luu cai moi
        setItemLocalStorage("user", rs);
        // setItemLocalStorage("user", rs);

        window.location.href = "admin-home"
    })
}