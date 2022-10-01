package com.rdsic.nuce.controller;

import com.rdsic.nuce.entity.json.JsonResult;
import com.rdsic.nuce.entity.topic.Tag;
import com.rdsic.nuce.service.TagService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/public/tag")
public class TagController {

    @Autowired
    private TagService tagService;

    @GetMapping("/find-all")
    public ResponseEntity<JsonResult> findAll() {
        try {
            List<Tag> listTag = tagService.findByDeletedTrue();
            if (listTag != null)
                return JsonResult.success(listTag);
            else return JsonResult.badRequest("Không có tag");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-by-name")
    public ResponseEntity<JsonResult> findByName(@RequestParam("name") String name) {
        try {
            Tag tag = tagService.findByNameTagAndDeletedTrue(name);
            if (tag != null)
                return JsonResult.success(tag);
            else return  JsonResult.badRequest("Không có tag");
        } catch (Exception  e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-by-id")
    public ResponseEntity<JsonResult> findByIdTag(@RequestParam("id") int id) {
        try {
            Tag tag = tagService.findByIdAndDeletedTrue(id);
            if (tag != null)
                return JsonResult.success(tag);
            else return JsonResult.badRequest("Không có tag");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @PostMapping("/save")
    public ResponseEntity<JsonResult> save(@RequestBody Tag tag) {
        try {
            Boolean tag1 = tagService.save(tag);
            if (tag1 != false)
                return JsonResult.success(tag);
            else return JsonResult.badRequest("Không có tag");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @PostMapping("/deleted")
    public ResponseEntity<JsonResult> delete(@RequestBody Tag tag) {
        try {
            Boolean tag1 = tagService.deleted(tag);
            if (tag1 != false)
                return JsonResult.success(tag);
            else return JsonResult.badRequest("Không có tag");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }


}
