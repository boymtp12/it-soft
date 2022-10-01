$(async function () {
    checkLogin();
    var listStudentGlobal = [];
    var listGroupStudentGlobal = [];
    var listUserSystemGlobal = [];
    var listCourseGlobal = [];
    // đối tượng chưa value của các option
    var optionOfList = function (valueT, dataT) {
        this.valueT = valueT;
        this.dataT = dataT;
    }
    await ajaxCallGet("group-student/find-all-true").then(rs => {
        listGroupStudentGlobal.push(new optionOfList(0,"Tất cả"));
        rs.data.map(item => {
            listGroupStudentGlobal.push(new optionOfList(item.id, item.name))
        })
    });
    await ajaxCallGet("user/find-all").then(rs => {
        rs.data.map(item => {
            listUserSystemGlobal.push(new optionOfList(item.id, item.name))
        })
    });
    //
    await ajaxCallGet("students/find-by-group-student/1").then(rs => {
        listStudentGlobal = rs.data;
    });
    await ajaxCallGet("course/find-by-name-image-subcontent-createdate/0").then(rs => {
        listCourseGlobal.push(new optionOfList(0,"Tất cả"));
        rs.data.map((item, index) => {
            listCourseGlobal.push(new optionOfList(item.id, item.name))
        })
    })
    let ViewMoDelListStudent = function (listStudent, listGroupStudent, listUserSystem, listCourse) {

        let self = this;
        self.listStudent = ko.observableArray(listStudent);
        self.listGroupStudent = ko.observableArray(listGroupStudent);
        self.listGroupStudentOfEachStudent = ko.observableArray(listGroupStudent.filter(item => item.valueT != 0));
        self.listCourse = ko.observableArray(listCourse);
        self.listUserSystem = ko.observableArray(listUserSystem);

        bindingListItem(self.listStudent());
        //id admin
        self.idAdmin = ko.observable(getItemLocalStorage("user").data.id);
        self.checkBindSelect = ko.observable(false);
        self.checkBindSelectOfListStudent = ko.observable(false);
        self.hideee = ko.observable(false);
        //  observable này để bind giá trị block lọc với tìm kiếm
        // self.btnShowBlockChucNangBindValue = ko.observable(false);
        // self.btnShowBlockIndex = ko.observable(true);

        // value sau khi select của các list trên
        self.selectedItemListCourse = ko.observable();
        self.selectedItemListGroupStudent = ko.observable();
        // value của select nút search
        self.selectedItemListSearch = ko.observable(1);

        // chứa giá trị của ô input tìm kiếm
        self.keywordSearch = ko.observable();

        // khai báo giá trị cần sử dụng
        // chứa id của student, thay đổi sau mỗi lần click vào thẻ <tr>
        self.editingStudentId = ko.observable(null);



        // event
        self.loading = function (link) {
            window.open(link, '_blank')
        }
        // click vào mỗi student sẽ gán id của student cho biến
        self.clickGetIdStudent = function (idStudent) {
            self.editingStudentId(idStudent);
            self.checkBindSelectOfListStudent(true)
        }
        self.exportExcell = function () {
            var table2excel = new Table2Excel({
                defaultFileName: "Dang-ky-hoc_" + new Date().getDate() + "-" + (new Date().getMonth() + 1) + "-" + new Date().getFullYear(),
            });
            table2excel.export(document.querySelectorAll("#idTable"));
        }
        // click vào select của khóa học hay nhóm học viên thì mới được gán true để call ajax để tìm kiếm học viên
        self.selectGr = function () {
            self.checkBindSelect(true);
        }
        //  func này gán giá trị true để hiện ra block chức năng
        // self.btnShowBlockChucNang = function () {
        //     if (self.btnShowBlockIndex()) {
        //         // show block
        //         self.btnShowBlockIndex(false);
        //         self.btnShowBlockChucNangBindValue(true);
        //     } else {
        //         // hide block
        //         self.btnShowBlockIndex(true)
        //         self.btnShowBlockChucNangBindValue(false);
        //     }
        // }
        self.btnFilterStudent = function () {

            if (self.selectedItemListCourse() == 0 && self.selectedItemListGroupStudent() != 0 && self.selectedItemListGroupStudent() != undefined || self.selectedItemListGroupStudent() != 0 && self.selectedItemListGroupStudent() != undefined && self.selectedItemListCourse() == undefined) {
                console.log(1)
                // thay đổi ở select list groupstudent
                if (self.checkBindSelect()) {
                    ajaxCallGet("students/find-by-group-student-id-num/" + self.selectedItemListGroupStudent()).then(rs => {
                        console.log(rs)

                        if (rs.data.length > 0) {
                            self.checkBindSelectOfListStudent(false)
                            bindingListItem(rs.data);
                            self.listStudent(rs.data);
                            self.listStudent().map((item, index) => {
                                findClassOfStudent(item.id).then(rs => {
                                    $(".classListStudent" + index).html(rs);
                                });
                            });
                        } else {
                            self.listStudent(rs.data);
                            alertInfo("Không có sinh viên");
                        }
                    })
                }
            } else if (self.selectedItemListCourse() != 0 && self.selectedItemListCourse() != undefined && self.selectedItemListGroupStudent() == 0 || self.selectedItemListCourse() != 0 && self.selectedItemListCourse() != undefined && self.selectedItemListGroupStudent() == undefined) {
                console.log(2)
                // thay đổi ở list course
                if (self.checkBindSelect()) {
                    ajaxCallGet("students/find-by-course-id-num/" + self.selectedItemListCourse()).then(rs => {
                        console.log(rs)
                        if (rs.data.length > 0) {
                            self.checkBindSelectOfListStudent(false)
                            bindingListItem(rs.data);
                            self.listStudent(rs.data)
                            self.listStudent().map((item, index) => {
                                findClassOfStudent(item.id).then(rs => {
                                    $(".classListStudent" + index).html(rs);
                                });
                            });
                        } else {
                            self.listStudent(rs.data);
                            alertInfo("Không có sinh viên");
                        }
                    })
                }
            } else if (self.selectedItemListCourse() != 0 && self.selectedItemListGroupStudent() != 0 && self.selectedItemListCourse() != undefined && self.selectedItemListGroupStudent() != undefined ) {
                console.log(3)
                if (self.checkBindSelect()) {
                    ajaxCallGet("students/find-by-grst-id-and-courseid-num/" + self.selectedItemListGroupStudent() + "/" + self.selectedItemListCourse()).then(rs => {
                        console.log(rs)
                        if (rs.data.length > 0) {
                            self.checkBindSelectOfListStudent(false)
                            bindingListItem(rs.data);
                            self.listStudent(rs.data)
                            self.listStudent().map((item, index) => {
                                findClassOfStudent(item.id).then(rs => {
                                    $(".classListStudent" + index).html(rs);
                                });
                            });
                        } else {
                            self.listStudent(rs.data);
                            alertInfo("Không có sinh viên");
                        }
                    })
                }
            }else{
                console.log(4)
                ajaxCallGet("students/find-all").then(rs => {
                    console.log(rs)
                    if (rs.data.length > 0) {
                        self.checkBindSelectOfListStudent(false)
                        bindingListItem(rs.data);
                        self.listStudent(rs.data)
                        self.listStudent().map((item, index) => {
                            findClassOfStudent(item.id).then(rs => {
                                $(".classListStudent" + index).html(rs);
                            });
                        });
                    } else {
                        self.listStudent(rs.data);
                        alertInfo("Không có sinh viên");
                    }
                })
            }
        }
        // bắt sự kiện thay đổi giá trị của selet, sau đó gán giá trị2
        self.selectedItemListCourse.subscribe(function (valueOption) {
            if (valueOption == undefined){
                valueOption=0;
            }
            self.selectedItemListCourse(valueOption);

        });
        self.selectedItemListGroupStudent.subscribe(function (valueOption) {
            if (valueOption == undefined){
                valueOption=0;
            }
            self.selectedItemListGroupStudent(valueOption);
        });
        self.selectedItemListSearch.subscribe(function(value){
            if (value == 5){
                $("#inputSearch").prop("type", "date");
            }else{
                $("#inputSearch").prop("type", "text");
            }
        })

        self.btnSearchNV = async function (keyword) {
            // false để không cho khởi tạo trong mỗi student, lúc nào click vào từng dòng student mới cho true
            self.checkBindSelectOfListStudent(false)
            if (self.keywordSearch() != "" && self.keywordSearch() != undefined) {
                let array = [];
                switch (parseInt(self.selectedItemListSearch())) {
                    case 1:
                        // search theo tên
                        await ajaxCallGet('students/find-by-like-name/' + self.keywordSearch()).then(rs => {
                            rs.data.map(item => {
                                array.push(item);
                            });
                        }).catch(err => {
                            alertDanger("Lỗi, tìm kiếm thất bại.")
                        })
                        break;

                    case 2:
                        // search theo số điện thoại
                        await ajaxCallGet('students/find-by-phone-number/' + self.keywordSearch()).then(rs => {
                            rs.data.map(item => {
                                array.push(item);
                            });
                        }).catch(err => {
                            alertDanger("Lỗi, tìm kiếm thất bại.")
                        })
                        break;

                    case 3:
                        // search theo mã cá nhân
                        await ajaxCallGet('students/find-by-code-private/' + self.keywordSearch()).then(rs => {
                            array.push(rs.data);
                        }).catch(err => {
                            alertDanger("Lỗi, tìm kiếm thất bại.")
                        })
                        break;

                    case 4:
                        // search theo mã giới thiêu
                        await ajaxCallGet('students/find-by-codegt/' + self.keywordSearch()).then(rs => {
                            rs.data.map(item => {
                                array.push(item);
                            });
                        }).catch(err => {
                            alertDanger("Lỗi, tìm kiếm thất bại.")
                        })
                        break;
                    case 5:

                        // search theo mã giới thiêu
                        await ajaxCallGet('students/find-by-sign-date/' + self.keywordSearch()).then(rs => {
                            rs.data.map(item => {
                                array.push(item);
                            });
                        }).catch(err => {
                            alertDanger("Lỗi, tìm kiếm thất bại.")
                        })
                        break;
                    default:
                        console.log('default');
                }
                if (array.length > 0) {
                    bindingListItem(array);
                    self.listStudent(array)
                    self.listStudent().map((item, index) => {
                        findClassOfStudent(item.id).then(rs => {
                            $(".classListStudent" + index).html(rs);
                        });
                    });
                } else {
                    self.listStudent(array);
                    alertDanger("Không có kết quả phù hợp với tìm kiếm của bạn.");
                }

            } else alertDanger("Vui lòng nhập thông tin.");

        }
        self.onEnter = async function (d, event) {
            // false để không cho khởi tạo trong mỗi student, lúc nào click vào từng dòng student mới cho true
            self.checkBindSelectOfListStudent(false)
            if (event.keyCode == 13) {
                if (self.keywordSearch() != "" && self.keywordSearch() != undefined) {
                    let array = [];
                    switch (parseInt(self.selectedItemListSearch())) {
                        case 1:
                            // search theo tên
                            await ajaxCallGet('students/find-by-like-name/' + self.keywordSearch()).then(rs => {
                                rs.data.map(item => {
                                    array.push(item);
                                });
                            }).catch(err => {
                                alertDanger("Lỗi, tìm kiếm thất bại.")
                            })
                            break;
                        case 2:
                            // search theo số điện thoại
                            await ajaxCallGet('students/find-by-phone-number/' + self.keywordSearch()).then(rs => {
                                rs.data.map(item => {
                                    array.push(item);
                                });
                            }).catch(err => {
                                alertDanger("Lỗi, tìm kiếm thất bại.")
                            })
                            break;
                        case 3:
                            // search theo mã cá nhân
                            await ajaxCallGet('students/find-by-code-private/' + self.keywordSearch()).then(rs => {
                                array.push(rs.data);
                            }).catch(err => {
                                alertDanger("Lỗi, tìm kiếm thất bại.")
                            })
                            break;
                        case 4:
                            // search theo mã giới thiêu
                            await ajaxCallGet('students/find-by-codegt/' + self.keywordSearch()).then(rs => {
                                rs.data.map(item => {
                                    array.push(item);
                                });
                            }).catch(err => {
                                alertDanger("Lỗi, tìm kiếm thất bại.")
                            })
                            break;
                        default:
                            console.log('default');
                    }
                    if (array.length > 0) {
                        bindingListItem(array);
                        self.listStudent(array)
                        self.listStudent().map((item, index) => {
                            findClassOfStudent(item.id).then(rs => {
                                $(".classListStudent" + index).html(rs);
                            });
                        });
                    } else {
                        self.listStudent(array);
                        alertDanger("Không có kết quả phù hợp với tìm kiếm của bạn.");
                    }

                } else alertDanger("Vui lòng nhập thông tin.");
            }
        }

        // funciton này khởi tạo các observable sau khi thay đổi giá trị của listStudent
        function bindingListItem(list) {
            console.log(list)
            list.forEach(student => {
                student.idGroupStudentOfEachStudent = ko.observable();
                student.idUserSystemOfEachStudent = ko.observable();
                // khởi tạo observable cho từng student trong list
                student.idGroupStudentOfEachStudent(student.groupStudentIdNum);
                student.idUserSystemOfEachStudent(student.userIdNum);

                // bắt sự kiện thay đổi của select
                student.idGroupStudentOfEachStudent.subscribe(value => {
                    if (self.checkBindSelectOfListStudent()) {
                        if (self.editingStudentId() !== null) {
                            ajaxCallPost("students/update-student-idgroup-student/" + self.editingStudentId()
                                + "/" + value).then(rs => {
                                alertSuccess("Dữ liệu đã đc cập nhật thành công.");
                                // nếu k phải là admin cao nhất, thì thay đổi group sẽ tự thay đổi ídUser
                                if (self.idAdmin() != 8) {
                                    student.idUserSystemOfEachStudent(self.idAdmin());
                                    self.checkBindSelectOfListStudent(false)
                                }
                            }).catch(err => {
                                console.log(err)
                            })
                        }
                    }
                });
                // bắt sự kiện thay đổi của select user admin
                student.idUserSystemOfEachStudent.subscribe(value => {
                    if (self.checkBindSelectOfListStudent()) {
                        if (self.editingStudentId() !== null) {
                            self.checkBindSelectOfListStudent(false);
                            ajaxCallPost("students/update-student-iduser/" + self.editingStudentId()
                                + "/" + value).then(rs => {
                                console.log(rs)
                                if (value == 8) {
                                    alertSuccess("Dữ liệu đã đc cập nhật thành công.")
                                }
                            }).catch(err => {
                                alertDanger("Dữ liệu cập nhật thất bại")
                            })
                        }
                    }
                })
            });
            // view các khóa học liên quan đến từng học viên
            self.listStudent().map((item, index) => {
                findClassOfStudent(item.id).then(rs => {
                    $(".classListStudent" + index).html(rs);
                });
            })
        }
    }
    ko.applyBindings(new ViewMoDelListStudent(listStudentGlobal, listGroupStudentGlobal, listUserSystemGlobal, listCourseGlobal));

});

// tìm kiếm lớp cho mỗi học viên rồi add vào bảng
async function findClassOfStudent(idStudent) {
    let html = ``;
    await ajaxCallGet("course-has-student/find-by-id-student/" + idStudent).then(rs => {
        if (rs.data.length > 0) {
            rs.data.map(item => {
                html += ` <p>${item.course.name}</p>`;
            });
        } else {
            html += `<p>Không có khóa học</p>`;
        }
    })
    return html;
}
