package com.rdsic.nuce.controller;

import com.rdsic.nuce.entity.course.Course;
import com.rdsic.nuce.entity.course.Theme;
import com.rdsic.nuce.entity.json.JsonResult;
import com.rdsic.nuce.service.ThemeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/public/theme/")
public class ThemController {
    @Autowired
    private ThemeService themeService;

    @GetMapping("find-all")
    public ResponseEntity<JsonResult> findAll() {
        try {
            List<Theme> list = themeService.findByDeletedTrue();
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không có thông tin chủ đề");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-name/{name}")
    public ResponseEntity<JsonResult> findByName(@PathVariable("name") String name) {
        try {
            Theme theme = themeService.findByNameAndDeletedTrue(name);
            if (theme != null)
                return JsonResult.success(theme);
            else return JsonResult.badRequest("Không có thông tin chủ đề");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-id/{id}")
    public ResponseEntity<JsonResult> findByName(@PathVariable("id") int id) {
        try {
            Theme theme = themeService.findByIdAndDeletedTrue(id);
            if (theme != null)
                return JsonResult.success(theme);
            else return JsonResult.badRequest("Không có thông tin chủ đề");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("save")
    public ResponseEntity<JsonResult> save(@RequestBody Theme theme) {
        try {
            Boolean theme1 = themeService.save(theme);
            if (theme1)
                return JsonResult.success(theme1);
            else return JsonResult.badRequest("Lưu thất bại");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("deleted")
    public ResponseEntity<JsonResult> deleted(@RequestBody Theme theme) {
        try {
            Boolean theme1 = themeService.deleted(theme);
            if (theme1)
                return JsonResult.success(theme1);
            else return JsonResult.badRequest("Lưu thất bại");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
}
