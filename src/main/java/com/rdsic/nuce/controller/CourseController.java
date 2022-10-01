package com.rdsic.nuce.controller;

import com.rdsic.nuce.entity.category.SmallCategory;
import com.rdsic.nuce.entity.course.Course;
import com.rdsic.nuce.entity.course.Theme;
import com.rdsic.nuce.entity.json.JsonResult;
import com.rdsic.nuce.entity.students.Teacher;
import com.rdsic.nuce.entity.user.User;
import com.rdsic.nuce.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;

@RestController
@RequestMapping("api/v1/public/course/")
public class CourseController {
    @Autowired
    private CourseService courseService;

    @Autowired
    private UserService userService;
    @Autowired
    private ThemeService themeService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private SmallCategoryService smallCategoryService;

    @GetMapping("find-all")
    public ResponseEntity<JsonResult> findAll() {
        try {
            List<Course> list = courseService.findByDeletedTrue();
            list.sort((o1, o2) -> {
                return o2.getId() - o1.getId();
            });
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không có thông tin khóa học");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-limit/{limit}")
    public ResponseEntity<JsonResult> findLimit(@PathVariable("limit") int limit) {
        try {
            List<Course> list = courseService.findByDeletedTrueAndLimit(limit);
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không có thông tin khóa học");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-like-name/{name}")
    public ResponseEntity<JsonResult> findByDeletedTrueAndLikeName(@PathVariable("name") String name) {
        try {
            List<Course> list = courseService.findByDeletedTrueLikeName(name);
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không có thông tin khóa học");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-id/{id}")
    public ResponseEntity<JsonResult> findById(@PathVariable("id") int id) {
        try {
            Course course = courseService.findByIdAndDeletedTrue(id);
            if (course != null)
                return JsonResult.success(course);
            else return JsonResult.badRequest("Không có thông tin khóa học");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-name-object/{name}")
    public ResponseEntity<JsonResult> findByObjStudentsAndDeletedTrue(@PathVariable("name") String name) {
        try {
            List<Course> course = courseService.findByObjStudentsAndDeletedTrue(name);
            if (course != null)
                return JsonResult.success(course);
            else return JsonResult.badRequest("Không có thông tin khóa học");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @GetMapping("find-by-classify/{classify}")
    public ResponseEntity<JsonResult> findByClassify_GetIdAndNameAndUrlViewAndCreateDate_Custom(@PathVariable("classify") Boolean classify) {
        try {
            List<Course> course = courseService.findByClassify_GetIdAndNameAndUrlViewAndCreateDate(classify);
            if (course != null)
                return JsonResult.success(course);
            else return JsonResult.badRequest("Không có thông tin khóa học");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-promotion")
    public ResponseEntity<JsonResult> findByPromotionTrue() {
        try {
            List<Course> course = courseService.findByPromotionTrue();
            if (course != null)
                return JsonResult.success(course);
            else return JsonResult.badRequest("Không có thông tin khóa học");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-name/{name}")
    public ResponseEntity<JsonResult> findByName(@PathVariable("name") String name) {
        try {
            Course course = courseService.findByNameAndDeletedTrue(name);
            if (course != null)
                return JsonResult.success(course);
            else return JsonResult.badRequest("Không có thông tin khóa học");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-name-image-subcontent-createdate/{limit}")
    public ResponseEntity<JsonResult> findByNameImageSubContentCreateDate(@PathVariable("limit") int limit) {
        try {
            List<Course> list = courseService.findByLimit_GetIdAndNameAndFeesAndImageUrlAndPromotionAndSubContent(limit);
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không có thông tin khóa học");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-idtheme/{idTheme}")
    public ResponseEntity<JsonResult> findByIdThemeAndDeletedTrue(@PathVariable("idTheme") int id) {
        try {
            Theme theme = themeService.findByIdAndDeletedTrue(id);
            List<Course> course = courseService.findByIdThemeAndDeletedTrue(theme);
            if (course != null)
                return JsonResult.success(course);
            else return JsonResult.badRequest("Không có thông tin khóa học");
        } catch (Exception e) {
            return null;
        }
    }

    @PostMapping("/save/{idSmallCategory}/{idUser}/{idTheme}/{idTeacher}")
    public ResponseEntity<JsonResult> save(@PathVariable("idSmallCategory") int idSmall,
                                           @PathVariable("idUser") int idUser,
                                           @PathVariable("idTheme") int idThemme,
                                           @PathVariable("idTeacher") int idTeacher,
                                           @RequestBody Course course) {
        try {
            Teacher teacher = teacherService.findById(idTeacher);
            Theme theme = themeService.findByIdAndDeletedTrue(idThemme);
            User user = userService.findById(idUser);
            SmallCategory smallCategory = smallCategoryService.findByIdsmallCategory(idSmall);
            course.setIdTeacher(teacher);
            course.setIdTheme(theme);
            course.setIdUser(user);
            course.setIdSmallCategory(smallCategory);
            course.setCreateDate(LocalDate.now());
            course.setTuitionFeeAfterReduction(course.getStudentFees()-(course.getStudentFees()/100*course.getPercentOfPromotion()));
            Boolean value = courseService.save(course);
            if (value)
                return JsonResult.success(course);
            else return JsonResult.badRequest("Lưu thông tin thất bại");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("deleted/{idCourse}")
    public ResponseEntity<JsonResult> deleted(@PathVariable("idCourse") int idCourse) {
        try {
            Course course = courseService.findByIdAndDeletedTrue(idCourse);
            course.setDeleted(false);
            Boolean value = courseService.save(course);
            if (value)
                return JsonResult.success(course);
            else return JsonResult.badRequest("Xóa thông tin thất bại");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
}



