package com.rdsic.nuce.controller;

import com.rdsic.nuce.entity.json.JsonResult;
import com.rdsic.nuce.entity.students.GroupStudent;
import com.rdsic.nuce.entity.students.Students;
import com.rdsic.nuce.service.GroupStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/v1/public/group-student/")
public class GroupStudentController {
    @Autowired
    private GroupStudentService groupStudentService;
    @GetMapping("find-all-true")
    public ResponseEntity<JsonResult> findAllAndDeletedTrue(){
        try {
            List<GroupStudent> list = groupStudentService.findByDeletedTrue();
            if (list != null) {
                return JsonResult.success(list);
            } else {
                return JsonResult.badRequest("Không có nhóm sinh viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @GetMapping("find-all-false")
    public ResponseEntity<JsonResult> findAllAndDeletedFalse(){
        try {
            List<GroupStudent> list = groupStudentService.findByDeletedFalse();
            if (list != null) {
                return JsonResult.success(list);
            } else {
                return JsonResult.badRequest("Không có nhóm sinh viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @GetMapping("find-by-id/{id}")
    public ResponseEntity<JsonResult> findByIdAndDeletedTrue(@PathVariable("id") int id){
        try {
            GroupStudent groupStudent = groupStudentService.findByIdAndDeletedTrue(id);
            if (groupStudent != null) {
                return JsonResult.success(groupStudent);
            } else {
                return JsonResult.badRequest("Không có nhóm sinh viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-name/{name}")
    public ResponseEntity<JsonResult> findNameAndDeletedTrue(@PathVariable("name") String name){
        try {
            GroupStudent groupStudent = groupStudentService.findByNameAndDeletedTrue(name);
            if (groupStudent != null) {
                return JsonResult.success(groupStudent);
            } else {
                return JsonResult.badRequest("Không có nhóm sinh viên");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
}
