package com.rdsic.nuce.controller;

import com.rdsic.nuce.entity.course.Course;
import com.rdsic.nuce.entity.course.CourseHasTypeEducation;
import com.rdsic.nuce.entity.course.TypeEducation;
import com.rdsic.nuce.entity.json.JsonResult;
import com.rdsic.nuce.key.CourseTypeEducationKey;
import com.rdsic.nuce.service.CourseHasTypeEducationService;
import com.rdsic.nuce.service.CourseService;
import com.rdsic.nuce.service.TypeEducationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.logging.Level;

@RestController
@RequestMapping("api/v1/public/course-has-type-education/")
public class CourseHasTypeEducationController {
    @Autowired
    private CourseHasTypeEducationService courseHasTypeEducationService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private TypeEducationService typeEducationService;

    @GetMapping("find-all")
    public ResponseEntity<JsonResult> findByDeletedTrue() {
        try {
            List<CourseHasTypeEducation> list = courseHasTypeEducationService.findByDeletedTrue();

            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không có thông tin khóa học");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-idcourse/{idCourse}")
    public ResponseEntity<JsonResult> findByCourseAndDeletedTrue(@PathVariable("idCourse") int id) {
        try {
            List<CourseHasTypeEducation> list = courseHasTypeEducationService.findByCourseAndDeletedTrue(courseService.findByIdAndDeletedTrue(id));
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không có thông tin khóa học");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-type-education/{idTypeEducation}")
    public ResponseEntity<JsonResult> findByTypeEducationAndDeletedTrue(@PathVariable("idTypeEducation") int idTypeEducation) {
        try {
            List<CourseHasTypeEducation> list = courseHasTypeEducationService.findByTypeEducationAndDeletedTrue(typeEducationService.findByIdAndDeletedTrue(idTypeEducation));
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không có thông tin khóa học");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-type-education/{idCourse}/{idTypeEducation}")
    public ResponseEntity<JsonResult> findById_CourseIdAndId_TypeEducationIdAndDeletedTrue(@PathVariable("idCourse") int idCourse,
                                                                                           @PathVariable("idTypeEducation") int idTypeEducation) {
        try {
            CourseHasTypeEducation list = courseHasTypeEducationService.findById_CourseIdAndId_TypeEducationIdAndDeletedTrue(idCourse, idTypeEducation);
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không có thông tin khóa học");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("save/{idTypeEducation}/{idCourse}")
    public ResponseEntity<JsonResult> save(@PathVariable("idTypeEducation") int idTypeEducation,
                                           @PathVariable("idCourse") int idCourse) {
        try {

            // khoi tao key de lưu id
            CourseTypeEducationKey courseTypeEducationKey = new CourseTypeEducationKey(idCourse, idTypeEducation);
            // khoi tao doi tuong courseHasTypeEducation
            CourseHasTypeEducation courseHasTypeEducation = new CourseHasTypeEducation();
            // gán id
            courseHasTypeEducation.setId(courseTypeEducationKey);
            // gán data
            courseHasTypeEducation.setCourse(courseService.findByIdAndDeletedTrue(idCourse));
            courseHasTypeEducation.setTypeEducation(typeEducationService.findByIdAndDeletedTrue(idTypeEducation));
            courseHasTypeEducation.setDeleted(true);
            // save
            boolean result = courseHasTypeEducationService.save(courseHasTypeEducation);
            if (result)
                return JsonResult.success(courseHasTypeEducation);
            else return JsonResult.badRequest("Lưu courseHasTypeEducation thất bại");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("deleted/{idCourse}/{idTypeEducation}")
    public ResponseEntity<JsonResult> deleted(@PathVariable("idCourse") int idCourse,
                                              @PathVariable("idTypeEducation") int idTypeEducation) {
        try {
            CourseHasTypeEducation courseHasTypeEducation = courseHasTypeEducationService.findById_CourseIdAndId_TypeEducationIdAndDeletedTrue(idCourse,idTypeEducation);
            System.out.println(courseHasTypeEducation.toString());
            courseHasTypeEducation.setDeleted(false);
            boolean result=  courseHasTypeEducationService.deleted(courseHasTypeEducation);
            if(result)
                return JsonResult.success(courseHasTypeEducation);
            else return JsonResult.badRequest("Delete courseHasTypeEducation thất bại");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
}
