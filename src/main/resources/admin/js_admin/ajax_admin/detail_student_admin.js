$(async function () {
    checkLogin()
    let id = window.location.href.split("id=");
    const idSt = id[id.length - 1].replace("#","");
    var student = null;
    var listGroupStudentGlobal = [];
    var listUserSystemGlobal = [];
    var listCourseGlobal = [];
    var courseCurrent = null;
    // biến này lưu trữ giá trị code giới thiệu đầu tiên để kiếm tra xem sau đó nó có bị xóa hay không
    var codePrivateFirst = "";
    // đối tượng chưa value của các option
    var optionOfList = function (valueT, dataT) {
        this.valueT = valueT;
        this.dataT = dataT;
    }
    await ajaxCallGet('students/find-by-id-get-all-properties/' + idSt).then(rs => {
        console.log(rs)
        student = rs.data;
    })
    await ajaxCallGet("group-student/find-all-true").then(rs => {
        rs.data.map(item => {
            listGroupStudentGlobal.push(new optionOfList(item.id, item.name));
        })
    });
    await ajaxCallGet("user/find-all").then(rs => {
        rs.data.map(item => {
            listUserSystemGlobal.push(new optionOfList(item.id, item.name));
        })
    });
    await ajaxCallGet("course/find-by-name-image-subcontent-createdate/0").then(rs => {
        rs.data.map(item => {
            listCourseGlobal.push(new optionOfList(item.id, item.name, item.tuitionFeeOfStudent));
        })
    });
    await ajaxCallGet("course-has-student/find-by-id-student/" + idSt).then(rs => {
        courseCurrent = rs.data[0];
    })

    let ViewModelDetailStudent = function (student, listGroupStudent, listUserSystem, listCourse, courseCurrent) {
        let self = this;
        self.student = ko.observable(student);
        self.listGroupStudent = ko.observableArray(listGroupStudent);
        self.listUserSystem = ko.observableArray(listUserSystem);
        self.listCourse = ko.observableArray(listCourse);
        self.courseCurrent = ko.observable(courseCurrent);

        self.idAdmin = ko.observable(getItemLocalStorage("user").data.id);
        self.idCourseOld = ko.observable(self.courseCurrent().course.id);
        // biến này lưu trữ giá trị code giới thiệu đầu tiên để kiếm tra xem sau đó nó có bị xóa hay không
        codePrivateFirst = student.codeGt;

        // giá trị sau khi select của các list trên
        self.valueOfEachGroupStudent = ko.observable(self.student().groupStudentIdNum);
        self.valueOfEachUserSystem = ko.observable(self.student().userIdNum);
        self.valueOfEachCourse = ko.observable(self.courseCurrent().course.id);

        self.showModal = ko.observable(true);
        self.checkValidateForm = ko.observable(false);
        self.checkEdit = ko.observable(false);

        self.idStudent = ko.observable(self.student().id);
        self.phoneNumber = ko.observable(self.student().phoneNumber)
        self.fullName = ko.observable(self.student().fullName)
        self.email = ko.observable(self.student().email)
        self.address = ko.observable(self.student().address)
        self.dateOfBirth = ko.observable(self.student().dateOfBirth)
        self.addrOfBirth = ko.observable(self.student().addrOfBirth)
        self.jobCurrent = ko.observable(self.student().jobCurrent)
        self.nameSchool = ko.observable(self.student().nameSchool)
        self.facultySchool = ko.observable(self.student().facultySchool)
        self.codeGt = ko.observable(self.student().codeGt)
        self.codePrivate = ko.observable(self.student().codePrivate)
        self.takeCertification = ko.observable(self.student().takeCertification == true ? 1 : 0);
        self.deleted = ko.observable(true)
        self.statusCall = ko.observable(false)
        self.sex = ko.observable(self.student().sex == true ? 1 : 0)
        self.tuitionFeeOfStudent = ko.observable();
        self.tuitionFeeOfStudent(formatNumber(self.student().tuitionFeeOfStudent, ".", "."))
        console.log(self.student())
        console.log(student)
        console.log(self.codeGt())
        // list student đc sv hiện tại giới  thiệu
        self.listStudentGt = ko.observableArray();
        self.listStudentGtLength = ko.observable(0);
        self.lengthGroup = ko.observable(0);
        self.fullNameLeader = ko.observable("Không có");
        self.idLeader = ko.observable();
        self.listStudentGtLengthLike = ko.observable(0);
        findGtOfStudent(self.codePrivate()).then(rs => {
            self.listStudentGt(rs);
            self.listStudentGtLength(rs.length);
        })

        if (self.codeGt() !== undefined && self.codeGt() !== null && self.codeGt() !== "") {
            self.lengthGroup = ko.observable(1);
            findLeaderOfEachStudent(self.codeGt()).then(rs => {
                console.log(rs)
                if (rs != null) {
                    self.idLeader(rs.id);
                    self.fullNameLeader(rs.fullName);
                }
            })
            // tim kiếm những người có cùng mã giới thiệu giống mình
            findGtOfStudent(self.codeGt()).then(rs => {
                console.log(rs)
                if (rs != null) {
                    self.listStudentGtLengthLike(rs.length)
                }
            })
        }

        // event
        self.loading = function (link) {
            window.open(link, '_blank')
        }
        self.btnSaveNew = function () {

        }
        self.edittSingleClick = function (){
            self.checkEdit(true);
        }
        // validate
        $("#bootstrapForm").bind().submit(function (event) {
            var vForm = $(this);
            if (vForm[0].checkValidity() == false) {
                event.preventDefault();
                event.stopPropagation();
                alertDanger("Vui lòng kiểm tra lại form đăng ký.")
            } else {
                // validate form xong xem chạy vào đây
                // thay đổi trạng thái của check
                let result = confirm('Bạn có chắc chắn muốn đăng ký?', setTimeout(1000));
                // kiểm tra, sau khi các trường đã đc validate thì giá trị của check sẽ thay đổi thành true
                if (result) {
                    self.checkValidateForm(true);
                } else self.checkValidateForm(false);
            }
            // Add bootstrap 4 was-validated classes to trigger validation messages
            vForm.addClass('was-validated');
        })
        // bắt sự kiện thay đổi giá trị
        self.checkValidateForm.subscribe(function (value) {
            if (value) {
                // gán luôn bằng false để còn kiểm tra những thay đổi lần sau
                self.checkValidateForm(false);
                let studentUpdate = {
                    "id": self.idStudent(),
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
                    "userIdNum": self.valueOfEachUserSystem(),
                    "groupStudentIdNum": self.valueOfEachGroupStudent(),
                    "courseIdNum": self.valueOfEachCourse(),
                    "tuitionFeeOfStudent": " ",
                    "checkOldStudent": false,
                }
                // self.idAdmin() chính là id của người đang đăng nhập hiện tại, chỉ đc thay đổi khi tk có quyền cao nhất
                // là id =8
                if (self.idAdmin() !== 8) {
                    self.valueOfEachUserSystem(self.idAdmin())
                }
                console.log(self.valueOfEachGroupStudent());
                ajaxCallPost("students/save/" + 1 + "/" + self.valueOfEachCourse() + "/" + self.valueOfEachGroupStudent() + "/" + self.valueOfEachUserSystem(), studentUpdate).then(rs => {
                    alertSuccess("Cập nhật thông tin thành công")
                    self.student(rs.data)
                    addValueStudent(self.student());
                    window.location.reload();
                    console.log(self.student())
                }).catch(err => {
                    alertDanger("Cập nhật thông tin thất bại, Kiểm tra lại mã giới thiệu")
                })
            }
        });
        // sự kiện thay đổi khóa học
        self.valueOfEachCourse.subscribe(function (value) {
            self.valueOfEachCourse(value);
            ajaxCallPost('course-has-student/update/' + idSt + '/' + self.idCourseOld() + '/' + self.valueOfEachCourse()).then(rs => {
                self.courseCurrent(rs.data);
                // gán luôn id khóa học mới thay đổi
                self.idCourseOld(rs.data.id.courseId);
            }).catch(err => {
                alertDanger('Lỗi, thay đổi thực hiện thất bại.')
            })
        });

        // hàm này để gán lại giá trị mới
        function addValueStudent(student) {
            self.idStudent(student.id);
            self.phoneNumber(student.phoneNumber)
            self.fullName(student.fullName)
            self.email(student.email)
            self.address(student.address)
            self.dateOfBirth(student.dateOfBirth)
            self.addrOfBirth(student.addrOfBirth)
            self.jobCurrent(student.jobCurrent)
            self.nameSchool(student.nameSchool)
            self.facultySchool(student.facultySchool)
            self.codeGt(student.codeGt)
            self.codePrivate(student.codePrivate)
            self.takeCertification(student.takeCertification == true ? 1 : 0);
            self.deleted(true)
            self.statusCall(false)
            self.sex(student.sex == true ? 1 : 0)
            self.tuitionFeeOfStudent(formatNumber(student.tuitionFeeOfStudent, ".", "."))
            // biến này lưu trữ giá trị code giới thiệu đầu tiên để kiếm tra xem sau đó nó có bị xóa hay không
            codePrivateFirst = student.codeGt;
        }
    }
    ko.applyBindings(new ViewModelDetailStudent(student, listGroupStudentGlobal, listUserSystemGlobal, listCourseGlobal, courseCurrent))
})

// tìm kiếm xem học viên này đã giới thiệu được ai chưa
// có thể find theo code private or code gt vì liên quan đến nhau
async function findGtOfStudent(code) {
    let list = null;
    await ajaxCallGet('students/find-by-codegt-get-2infor/' + code).then(rs => {
        list = rs.data
    }).catch(err => {
        alertDanger("Lỗi, tìm kiếm thất bại.")
    })
    return list
}

// tìm trưởng nhóm
// param: đầu vào là codeGt của sinh viên hiện tại
// result: sinh viên có code private trùng với đầu vào
async function findLeaderOfEachStudent(codePrivate) {
    let result = null;
    await ajaxCallGet('students/find-by-codeprivate-get-3infor/' + codePrivate).then(rs => {
        result = rs.data;
    }).catch(err => {
        alertDanger("Lỗi, tìm kiếm thất bại.")
    })
    return result;
}
