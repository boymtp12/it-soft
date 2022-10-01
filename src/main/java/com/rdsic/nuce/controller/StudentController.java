package com.rdsic.nuce.controller;

import com.rdsic.nuce.entity.company.AddressCompany;
import com.rdsic.nuce.entity.json.JsonResult;
import com.rdsic.nuce.entity.students.GroupStudent;
import com.rdsic.nuce.entity.students.Students;
import com.rdsic.nuce.entity.user.User;
import com.rdsic.nuce.service.*;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

@RestController
@RequestMapping("api/v1/public/students")
public class StudentController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private AddressConpanyService addressConpanyService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private TeacherService teacherService;

    @Autowired
    private UserService userService;
    @Autowired
    private GroupStudentService groupStudentService;

    @GetMapping("/find-all")
    public ResponseEntity<JsonResult> findAll() {
        try {
            List<Students> studentsList = studentService.findAll();
            if (studentsList != null) {
                return JsonResult.success(studentsList);
            } else {
                return JsonResult.badRequest("Không có sinh viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-by-id")
    public ResponseEntity<JsonResult> findById(@RequestParam("id") int id) {
        try {
            Students students = studentService.findById(id);
            if (students != null) {
                return JsonResult.success(students);
            } else {
                return JsonResult.badRequest("Không có sinh viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-by-code-private/{code}")
    public ResponseEntity<JsonResult> findByCodePrivateAndDeletedTrue(@PathVariable("code") String codeD) {
        try {
            System.out.println(codeD);
            Students students = studentService.findByCodePrivateAndDeletedTrue(codeD);
            if (students != null) {
                return JsonResult.success(students);
            } else {
                return JsonResult.badRequest("Không có sinh viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }


    @GetMapping("/find-by-like-name/{name}")
    public ResponseEntity<JsonResult> findByFullNameLikeAndDeletedTrue(@PathVariable("name") String name) {
        try {
            List<Students> studentsList = studentService.findByFullNameLikeAndDeletedTrue(name);
            if (studentsList != null) {
                return JsonResult.success(studentsList);
            } else {
                return JsonResult.badRequest("Không có sinh viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }


    @GetMapping("/find-by-course-id-num/{courseId}")
    public ResponseEntity<JsonResult> findByCourseIdNumAndDeletedTrue(@PathVariable("courseId") int courseId) {
        try {
            List<Students> studentsList = studentService.findByCourseIdNumAndDeletedTrue(courseId);
            if (studentsList != null) {
                return JsonResult.success(studentsList);
            } else {
                return JsonResult.badRequest("Không có sinh viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @GetMapping("/find-by-sign-date/{date}")
    public ResponseEntity<JsonResult> findBySigninDateLikeAndDeletedTrue(@PathVariable("date") String date) {
        try {
            List<Students> studentsList = studentService.findBySigninDateLikeAndDeletedTrue(LocalDate.parse(date));
            if (studentsList != null) {
                return JsonResult.success(studentsList);
            } else {
                return JsonResult.badRequest("Không có sinh viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-by-group-student-id-num/{idGroupStudent}")
    public ResponseEntity<JsonResult> findByGroupStudentIdNumAndDeletedTrue(@PathVariable("idGroupStudent") int idGroupStudent) {
        try {
            List<Students> studentsList = studentService.findByGroupStudentIdNumAndDeletedTrue(idGroupStudent);
            if (studentsList != null) {
                return JsonResult.success(studentsList);
            } else {
                return JsonResult.badRequest("Không có sinh viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-by-grst-id-and-courseid-num/{idGroupStudent}/{idCourse}")
    public ResponseEntity<JsonResult> findByFullNameLikeAndDeletedTrue(@PathVariable("idGroupStudent") int idGroupStudent,
                                                                       @PathVariable("idCourse") int idCourse) {
        try {
            List<Students> studentsList = studentService.findByGroupStudentIdNumAndCourseIdNumAndDeletedTrue(idGroupStudent, idCourse);
            if (studentsList != null) {
                return JsonResult.success(studentsList);
            } else {
                return JsonResult.badRequest("Không có sinh viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }


    @GetMapping("/find-by-phone-number/{phone}")
    public ResponseEntity<JsonResult> findByPhoneNumberAndDeletedTrue(@PathVariable("phone") String phone) {
        try {
            List<Students> studentsList = studentService.findByPhoneNumberAndDeletedTrue(phone);
            if (studentsList != null) {
                return JsonResult.success(studentsList);
            } else {
                return JsonResult.badRequest("Không có sinh viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-by-codegt/{code}")
    public ResponseEntity<JsonResult> findByCodeGtAndDeletedTrueGetAllProperties(@PathVariable("code") String code) {
        try {
            List<Students> studentsList = studentService.findByCodeGtAndDeletedTrueGetAllProperties(code);
            if (studentsList != null) {
                return JsonResult.success(studentsList);
            } else {
                return JsonResult.badRequest("Không có sinh viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    /*
     * Api của respository custom
     * */
    @GetMapping("/find-by-group-student/{idGroupStudent}")
    public ResponseEntity<JsonResult> findByIdGroupStudent_IdAndDeletedTrue(@PathVariable("idGroupStudent") int idGroupStudent) {
        try {
            List<Students> studentsList = studentService.findByIdGroupStudent_IdAndDeletedTrue_Custom(idGroupStudent);
            if (studentsList != null) {
                return JsonResult.success(studentsList);
            } else {
                return JsonResult.badRequest("Không có sinh viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-by-id-get-all-properties/{id}")
    public ResponseEntity<JsonResult> findByIdGetAllProperties_Custom(@PathVariable("id") int id) {
        try {
            Students students = studentService.findByIdGetAllProperties_Custom(id);
            if (students != null) {
                return JsonResult.success(students);
            } else {
                return JsonResult.badRequest("Không có sinh viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-by-codegt-get-2infor/{codeGT}")
    public ResponseEntity<JsonResult> findByCodeGtGetIdAndName_Custom(@PathVariable("codeGT") String codeGt) {
        try {
            List<Students> studentsList = studentService.findByCodeGtGetIdAndName_Custom(codeGt);
            if (studentsList != null) {
                return JsonResult.success(studentsList);
            } else {
                return JsonResult.badRequest("Không có sinh viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-by-codeprivate-get-3infor/{codePrivate}")
    public ResponseEntity<JsonResult> findByCodePrivateAndDeletedTrue_GetIdAndFullNameAndCodeGt_Custom(@PathVariable("codePrivate") String codePrivate) {
        try {
            Students students = studentService.findByCodePrivateAndDeletedTrue_GetIdAndFullNameAndCodeGt_Custom(codePrivate);
            if (students != null) {
                return JsonResult.success(students);
            } else {
                return JsonResult.badRequest("Không có sinh viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    /*
     * end Api của respository custom
     * */
    @PostMapping("/deleted/{id}")
    public ResponseEntity<JsonResult> deleted(@PathVariable("id") int idStudent) {
        try {
            Students students = studentService.findById(idStudent);
            Boolean check = studentService.deleted(students);
            if (check)
                return JsonResult.success(students);
            else
                return JsonResult.badRequest("Sai thông tin sinh viên");

        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("/save/{id-address}/{id-course}/{id-groupStudent}/{idUser}")
    public ResponseEntity<JsonResult> saveNewStudent(@RequestBody Students students,
                                                     @PathVariable("id-address") int idAdd,
                                                     @PathVariable("id-course") int idCourse,
                                                     @PathVariable("id-groupStudent") int idGroupStudent,
                                                     @PathVariable("idUser") int idUser) {
        System.out.println(students.toString());
        try {
            // set bằng id của 2 object
            students.setUserIdNum(idUser);
            students.setGroupStudentIdNum(idGroupStudent);
            students.setCourseIdNum(idCourse);
            students.setSigninDate(LocalDate.now());
            System.out.println(students.toString());
            // find address và course để lưu thông tin student đã đăng ký
            Boolean check = studentService.
                    saveNewStudent(students, courseService.findByIdAndDeletedTrue(idCourse),
                            addressConpanyService.findByIdAndDeletedTrue(idAdd),
                            groupStudentService.findByIdAndDeletedTrue(idGroupStudent), userService.findById(idUser));
            if (check) {
                if (students.getCodePrivate() == "") {
                    students.setCodePrivate(students.getId() + String.valueOf(ThreadLocalRandom.current().nextInt(1000, 9999)));
                    studentService.update(students);
                }
                return JsonResult.success(students);
            } else
                return JsonResult.badRequest("Sai thông tin sinh viên");

        } catch (Exception e) {
            System.out.println("djdjdjd");
            e.printStackTrace();
            return JsonResult.error(e);
        }
    }

    @PostMapping("/update-student-iduser/{idStudent}/{idUser}")
    public ResponseEntity<JsonResult> updateIdUser(@PathVariable("idStudent") int idStudent,
                                                   @PathVariable("idUser") int idUser) {
        try {
            Students students = studentService.findById(idStudent);
            User user = userService.findById(idUser);
            students.setIdUser(user);
            // set bằng id của 2 object
            students.setUserIdNum(idUser);
            Boolean students1 = studentService.update(students);
            if (students1)
                return JsonResult.success(students);
            else
                return JsonResult.badRequest("Sai thông tin sinh viên");

        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("/update-infor-student/{idUser}/{idGroupStudent}/{idAddress}")
    public ResponseEntity<JsonResult> updateInforStudent(@PathVariable("idUser") int idUser,
                                                         @PathVariable("idGroupStudent") int idGroupStudent,
                                                         @PathVariable("idAddress") int idAddress,
                                                         @RequestBody Students students) {
        try {

            User user = userService.findById(idUser);
            students.setIdUser(user);

            GroupStudent groupStudent = groupStudentService.findByIdAndDeletedTrue(idGroupStudent);
            students.setIdGroupStudent(groupStudent);

            AddressCompany addressCompany = addressConpanyService.findByIdAndDeletedTrue(idAddress);
            students.setAddressCompany(addressCompany);
            // set bằng id của 2 object
            students.setUserIdNum(idUser);
            students.setGroupStudentIdNum(idGroupStudent);
            Boolean students1 = studentService.update(students);
            if (students1)
                return JsonResult.success(students);
            else
                return JsonResult.badRequest("Sai thông tin sinh viên");

        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("/update-student-idgroup-student/{idStudent}/{idUGroupStudent}")
    public ResponseEntity<JsonResult> updateIdGroupStudent(@PathVariable("idStudent") int idStudent,
                                                           @PathVariable("idUGroupStudent") int idUGroupStudent) {
        try {
            Students students = studentService.findById(idStudent);
            GroupStudent groupStudent = groupStudentService.findByIdAndDeletedTrue(idUGroupStudent);
            students.setIdGroupStudent(groupStudent);
            students.setGroupStudentIdNum(idUGroupStudent);

            Boolean students1 = studentService.update(students);
            if (students1)
                return JsonResult.success(students);
            else
                return JsonResult.badRequest("Sai thông tin sinh viên");

        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("/deleted/{id-student}/{id-course}")
    public ResponseEntity<JsonResult> deleted(@PathVariable("id-student") int idStudent,
                                              @PathVariable("id-course") int idCourse) {
//        try {
//            students.setDeleted(true);
//            // find address và course để lưu thông tin student đã đăng ký
//            Boolean students1 = studentService.
//                    save(students,courseService.findByIdAndDeletedTrue(idCourse),
//                            addressConpanyService.findByIdAndDeletedTrue(idAdd));
//            if (students1)
//                return JsonResult.success(students);
//            else
//                return JsonResult.badRequest("Sai thông tin sinh viên");
//
//        } catch (Exception e) {
//            return JsonResult.error(e);
//        }
        return JsonResult.success("akaka");
    }
}
