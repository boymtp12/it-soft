package com.rdsic.nuce.controller;

import com.rdsic.nuce.entity.course.CourseHasStudent;
import com.rdsic.nuce.entity.json.JsonResult;
import com.rdsic.nuce.entity.students.AdvisoryInfor;
import com.rdsic.nuce.key.CourseStudentKey;
import com.rdsic.nuce.service.CourseHasStudentService;
import com.rdsic.nuce.service.CourseService;
import com.rdsic.nuce.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("api/v1/public/course-has-student")
public class CourseHasStudentController {
    @Autowired
    private CourseHasStudentService courseHasStudentService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private StudentService studentService;

    @GetMapping("/find-all")
    public ResponseEntity<JsonResult> findAll() {
        try {
            List<CourseHasStudent> list = courseHasStudentService.findByDeletedTrue();
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không có thông tin");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-by-id-course/{idCourse}")
    public ResponseEntity<JsonResult> findByIdCourse(@PathVariable("idCourse") int idCourse) {
        try {
            List<CourseHasStudent> list = courseHasStudentService.findByIdCourseAndDeletedTrue(idCourse);
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không có thông tin");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-by-id-student/{idStudent}")
    public ResponseEntity<JsonResult> findIdStudent(@PathVariable("idStudent") int idStudent) {
        try {
            List<CourseHasStudent> list = courseHasStudentService.findByIdStudentAndDeletedTrue(idStudent);
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không có thông tin");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("/save/{idStudent}/{idCourse}")
    public ResponseEntity<JsonResult> save(@PathVariable("idStudent") int idStudent,
                                           @PathVariable("idCourse") int idCourse) {
        try {
            CourseStudentKey courseStudentKey = new CourseStudentKey(idCourse, idStudent);
            CourseHasStudent courseHasStudent = new CourseHasStudent();
            courseHasStudent.setCourse(courseService.findByIdAndDeletedTrue(idCourse));
            courseHasStudent.setStudents(studentService.findById(idStudent));
            courseHasStudent.setId(courseStudentKey);
            courseHasStudent.setDeleted(true);
            Boolean checkSave = courseHasStudentService.save(courseHasStudent);
            if (checkSave)
                return JsonResult.success(courseHasStudent);
            else return JsonResult.badRequest("Không có thông tin");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("/update/{idStudent}/{idCourseOld}/{idCourseNew}")
    public ResponseEntity<JsonResult> update(@PathVariable("idStudent") int idStudent,
                                             @PathVariable("idCourseOld") int idCourseOld,
                                             @PathVariable("idCourseNew") int idCourseNew) {
        try {
            // tìm kiếm đối tương course has student
            CourseStudentKey courseStudentKey = new CourseStudentKey(idCourseOld, idStudent);
            CourseHasStudent courseHasStudent = courseHasStudentService.findByIdAndDeletedTrue(courseStudentKey);

            CourseStudentKey courseStudentKeyNew = new CourseStudentKey(idCourseNew, idStudent);
            CourseHasStudent courseHasStudentNew = courseHasStudentService.findByIdAndDeletedTrue(courseStudentKeyNew);

            System.out.println(courseHasStudentNew);
            // nếu nhóm mới không tồn tại sẽ tạo nhóm mới, còn không chỉ cần set deleted true là đc
            if (courseHasStudentNew == null) {
                courseHasStudentNew = new CourseHasStudent();
                courseHasStudentNew.setCourse(courseService.findByIdAndDeletedTrue(idCourseNew));
                // lấy luôn student cũ, k cần phải query nhiều cho mệt người
                courseHasStudentNew.setStudents(courseHasStudent.getStudents());
                courseHasStudentNew.setId(courseStudentKeyNew);
                courseHasStudentNew.setDeleted(true);
            } else {
                courseHasStudentNew.setDeleted(true);
            }
            // set deleted cho nhóm cũ
            courseHasStudentService.deleted(courseHasStudent);
            // lưu lại nhóm mới
            Boolean checkSave = courseHasStudentService.save(courseHasStudentNew);
            if (checkSave)
                return JsonResult.success(courseHasStudentNew);
            else return JsonResult.badRequest("Không có thông tin");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("/deleted/{idStudent}/{idCourse}")
    public ResponseEntity<JsonResult> deleted(@PathVariable("idStudent") int idStudent,
                                              @PathVariable("idCourse") int idCourse) {
        try {

            CourseStudentKey courseStudentKey = new CourseStudentKey(idCourse, idStudent);
            CourseHasStudent courseHasStudent = new CourseHasStudent();
            courseHasStudent.setCourse(courseService.findByIdAndDeletedTrue(idCourse));
            courseHasStudent.setStudents(studentService.findById(idStudent));
            courseHasStudent.setId(courseStudentKey);
            Boolean checkSave = courseHasStudentService.deleted(courseHasStudent);
            if (checkSave)
                return JsonResult.success(courseHasStudent);
            else return JsonResult.badRequest("Không có thông tin");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
}

