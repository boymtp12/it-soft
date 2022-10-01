package com.rdsic.nuce.controller;

import com.rdsic.nuce.entity.course.TypeEducation;
import com.rdsic.nuce.entity.json.JsonResult;
import com.rdsic.nuce.service.TypeEducationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.logging.Level;

@RestController
@RequestMapping("api/v1/public/type-education/")
public class TypeEducationController {
    @Autowired
    private TypeEducationService typeEducationService;
    @GetMapping("find-all")
    public ResponseEntity<JsonResult> findByDeletedTrue() {
        try {
            List<TypeEducation> list = typeEducationService.findByDeletedTrue();
            if(list!=null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không có thông tin kiểu đào tạo");
        } catch (Exception e) {
            return null;
        }
    }

    @GetMapping("find-by-id")
    public ResponseEntity<JsonResult> findByIdAndDeletedTrue(int id) {
        try {
          TypeEducation typeEducation = typeEducationService.findByIdAndDeletedTrue(id);
            if(typeEducation!=null)
                return JsonResult.success(typeEducation);
            else return JsonResult.badRequest("Không có thông tin kiểu đào tạo");
        } catch (Exception e) {
            return null;
        }
    }
}
