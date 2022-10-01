package com.rdsic.nuce.controller;

import com.rdsic.nuce.entity.json.JsonResult;

import com.rdsic.nuce.entity.students.Teacher;
import com.rdsic.nuce.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("api/v1/public/teacher/")
public class TeacherController {
    @Autowired
    private TeacherService teacherService;
    @GetMapping("find-all")
    public ResponseEntity<JsonResult> findAll(){
        try {
            List<Teacher> teacherList = teacherService.findAll();
            teacherList.sort((o1,o2)->{
                return o2.getId()-o1.getId();
            });
            if (teacherList != null) {
                return JsonResult.success(teacherList);
            } else {
                return JsonResult.badRequest("Không có giảng viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @GetMapping("find-by-id/{id}")
    public ResponseEntity<JsonResult> findById(@PathVariable("id") int id){
        try {
            Teacher teacher = teacherService.findById(id);
            if (teacher != null) {
                return JsonResult.success(teacher);
            } else {
                return JsonResult.badRequest("Không có giảng viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @GetMapping("find-by-like-name/{name}")
    public ResponseEntity<JsonResult> findByLikeNameTeacherAndDeletedTrue(@PathVariable("name") String name){
        try {
            List<Teacher> list = teacherService.findByLikeNameTeacherAndDeletedTrue(name);
            if (list != null) {
                return JsonResult.success(list);
            } else {
                return JsonResult.badRequest("Không có giảng viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @PostMapping("save")
    public ResponseEntity<JsonResult> save(@RequestBody Teacher teacher){
        try {
            teacher.setCreateDate(LocalDate.now());
            Boolean teacher1 = teacherService.save(teacher);
            if (teacher1) return JsonResult.success(teacher);
             else return JsonResult.badRequest("Không có giảng viên");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @PostMapping("deleted/{id}")
    public ResponseEntity<JsonResult> deleted(@PathVariable("id") int id){
        try {
            Teacher teacher= teacherService.findById(id);
            teacher.setDeteted(false);
            Boolean teacher1 = teacherService.save(teacher);
            if (teacher1) return JsonResult.success(teacher);
            else return JsonResult.badRequest("Không có giảng viên");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
}
