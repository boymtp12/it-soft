package com.rdsic.nuce.controller;

import com.rdsic.nuce.entity.json.JsonResult;
import com.rdsic.nuce.entity.other.FolderImage;
import com.rdsic.nuce.entity.other.Image;
import com.rdsic.nuce.entity.students.Students;
import com.rdsic.nuce.service.FolderImageService;
import com.rdsic.nuce.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.security.RolesAllowed;
import java.util.List;

@RestController
@RequestMapping("api/v1/public/image")
public class ImageController {

    @Autowired
    private ImageService homeImageService;
    @Autowired
    private FolderImageService folderImageService;

    @GetMapping("/find-by-name")
    public ResponseEntity<JsonResult> findByName(@RequestParam("name") String name) {
        try {
            Image homeImage = homeImageService.findByName(name);
            if (homeImage != null)
                return JsonResult.success(homeImage);
            return JsonResult.badRequest("Không có ảnh");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-by-id")
    public ResponseEntity<JsonResult> findById(@RequestParam("id") int id) {
        try {
            Image homeImage = homeImageService.findById(id);
            if (homeImage != null)
                return JsonResult.success(homeImage);
            return JsonResult.badRequest("Không có ảnh");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @GetMapping("/find-by-value-folder/{value}")
    public ResponseEntity<JsonResult> findByFolderImage_ValueAndStatusTrue(@PathVariable("value") String value) {
        try {
            List<Image>  homeImage = homeImageService.findByFolderImage_ValueAndStatusTrue(value);
            if (homeImage != null)
                return JsonResult.success(homeImage);
            return JsonResult.badRequest("Không có ảnh");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-all")
    public ResponseEntity<JsonResult> findAll() {
        try {
            List<Image> homeImages = homeImageService.findAll();
            if (homeImages != null) {
                return JsonResult.success(homeImages);
            } else {
                return JsonResult.badRequest("Không có ảnh");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("/save/{value}")
    public ResponseEntity<JsonResult> save(@RequestBody Image homeImage,
                                           @PathVariable("value") String value) {
        try {
            homeImage.setFolderImage(folderImageService.findByValueAndDeletedTrue(value));
            boolean result = homeImageService.save(homeImage);
            if (result)
                return JsonResult.success(homeImage);
            return JsonResult.badRequest("tải lên thất bại");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("/deleted/{id}")
    public ResponseEntity<JsonResult> deleted(@PathVariable("id") int id) {
        try {
            Image homeImage = homeImageService.findById(id);
            homeImage.setStatus(false);
            boolean result = homeImageService.deleted(homeImage);
            if (result)
                return JsonResult.success(homeImage);
            return JsonResult.badRequest("tải lên thất bại");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
}
