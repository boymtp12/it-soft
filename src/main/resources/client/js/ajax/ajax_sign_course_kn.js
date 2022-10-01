$(function () {
    let ViewModelSignIn = function () {
        let self = this;
        self.showModal = ko.observable(false);
        self.checkValidateForm = ko.observable(false);
        self.phoneNumber = ko.observable("")
        self.fullName = ko.observable("")
        self.email = ko.observable("")
        self.address = ko.observable("")
        self.dateOfBirth = ko.observable("")
        self.addrOfBirth = ko.observable("")
        self.jobCurrent = ko.observable("")
        self.nameSchool = ko.observable("")
        self.facultySchool = ko.observable("")
        self.codeGt = ko.observable("")
        self.codePrivate = ko.observable("")
        self.takeCertification = ko.observable("")
        self.deleted = ko.observable(true)
        self.statusCall = ko.observable(false)
        self.sex = ko.observable(true)

        self.closeSubWinDow = function () {
            $('#myModal').modal('hide');
            self.showModal(false);
        }
        self.showSubWinDow = function () {
            $('#myModal').modal('show');
            self.showModal(true);
        }

        self.btnSaveNew = function () {
        }
        // validate
        $("#bootstrapForm").bind().submit(function (event) {
            var vForm = $(this);
            console.log(vForm[0])
            if (vForm[0].checkValidity() == false) {
                event.preventDefault();
                event.stopPropagation();
                self.checkValidateForm(false);
                alertDanger("Vui lòng kiểm tra lại form đăng ký.")
            } else {
                // validate form xong xem chạy vào đây
                // thay đổi trạng thái của check
                let result = confirm('Bạn có chắc chắn muốn đăng ký?', setTimeout(1000));
                if (result) {
                    // event.preventDefault()
                    // event.stopPropagation();
                    self.checkValidateForm(true);
                }
                else self.checkValidateForm(false);
                // kiểm tra, sau khi các trường đã đc validate thì giá trị của check sẽ thay đổi thành true
                // bắt sự kiện thay đổi giá trị lưu luôn đối tượng
            }
            // Add bootstrap 4 was-validated classes to trigger validation messages
            vForm.addClass('was-validated');
        })
        self.checkValidateForm.subscribe(function (valueCheck) {
            if (valueCheck) {
                let url = window.location.href.split("/");
                let idCourse = url[url.length - 2]
                let student = {
                    "phoneNumber": self.phoneNumber(),
                    "fullName": self.fullName(),
                    "email": self.email(),
                    "address": self.address(),
                    "dateOfBirth": self.dateOfBirth(),
                    "addrOfBirth": self.addrOfBirth(),
                    "jobCurrent": self.jobCurrent(),
                    "nameSchool": self.nameSchool(),
                    "facultySchool": self.facultySchool(),
                    "codeGt": self.codeGt(),
                    "codePrivate": self.codePrivate(),
                    "takeCertification": self.takeCertification() == "0" ? false : true,
                    "deleted": self.deleted(),
                    "statusCall": self.statusCall(),
                    "sex": self.sex() == "0" ? false : true,
                    "userIdNum": 8,
                    "groupStudentIdNum":1,
                    "courseIdNum": idCourse,
                    "tuitionFeeOfStudent":"",
                    "checkOldStudent": false,
                }
                console.log(student)
                /*
                // 1: là id địa chỉ học
                *1: là gr chưa gọi điện thoại
                * 8: tài khoản admin (mặc định) */
                ajaxCallPost("students/save/" + 1 + "/" + idCourse + "/" + 1 + "/" + 8, student).then(rs => {
                    console.log(rs)
                    if (rs.data != null) {
                        // trong api này back end đã lưu luôn dữ liệu trong bảng quan hệ rồi
                        // k cần phải gọi students -has - course nữa
                        alertSuccess("Chúc mừng bạn đã đăng ký thành công.")
                        // gán luôn bằng false để còn kiểm tra những thay đổi lần sau
                        self.checkValidateForm(false);
                        $('#myModal').modal('hide');
                        self.showModal(false);
                    }
                }).catch(err => {
                    alertDanger("Mã giới thiệu không đúng. Vui lòng kiểm tra lại mã giới thiệu.")
                    self.checkValidateForm(false);
                    // setTimeout(location.reload.bind(location), 2000)
                })
            }
        })
    }
    ko.applyBindings(new ViewModelSignIn());
})