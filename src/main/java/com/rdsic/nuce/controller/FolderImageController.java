package com.rdsic.nuce.controller;

import com.rdsic.nuce.entity.course.Course;
import com.rdsic.nuce.entity.json.JsonResult;
import com.rdsic.nuce.entity.other.FolderImage;
import com.rdsic.nuce.service.FolderImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.jar.JarEntry;

@RestController
@RequestMapping("api/v1/public/folder-image/")
public class FolderImageController {
    @Autowired
    private FolderImageService folderImageService;

    @GetMapping("find-all")
    public ResponseEntity<JsonResult> findAll() {
        try {
            List<FolderImage> list = folderImageService.findByDeletedTrue();
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không có thông tin folder");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @GetMapping("find-by-value/{value}")
    public ResponseEntity<JsonResult> findByValueAndDeletedTrue(@PathVariable("value") String value) {
        try {
            FolderImage folderImage = folderImageService.findByValueAndDeletedTrue(value);
            if (folderImage != null)
                return JsonResult.success(folderImage);
            else return JsonResult.badRequest("Không có thông tin folder");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @PostMapping("save")
    public ResponseEntity<JsonResult> save(@RequestBody FolderImage folderImage) {
        try {
            Boolean result = folderImageService.save(folderImage);
            if (result )
                return JsonResult.success(folderImage);
            else return JsonResult.badRequest("Không có thông tin folder");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @PostMapping("deleted/{value}")
    public ResponseEntity<JsonResult> deleted(@PathVariable("value") String value ) {
        try {
            FolderImage folderImage = folderImageService.findByValueAndDeletedTrue(value);
            Boolean result = folderImageService.deleted(folderImage);
            if (result )
                return JsonResult.success(folderImage);
            else return JsonResult.badRequest("Không có thông tin folder");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
}
