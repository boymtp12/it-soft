package com.rdsic.nuce.controller;


import com.rdsic.nuce.entity.json.JsonResult;
import com.rdsic.nuce.entity.topic.Topic;
import com.rdsic.nuce.entity.user.User;
import com.rdsic.nuce.service.CourseService;
import com.rdsic.nuce.service.TopicService;
import com.rdsic.nuce.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("api/v1/public/topic")
public class TopicController {

    @Autowired
    private TopicService topicService;

    @Autowired
    private UserService userService;
    @Autowired
    private CourseService courseService;

    @GetMapping("/find-all")
    public ResponseEntity<JsonResult> findAll() {
        try {
            List<Topic> list = topicService.findByDeletedTrue();
            list.sort((o1,o2)->{
                return o2.getId()-o1.getId();
            });
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không có bài viết");

        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-by-idtopic/{id}")
    public ResponseEntity<JsonResult> findByIdTopic(@PathVariable("id") int id) {
        try {
            Topic topic = topicService.findByIdAndDeletedTrue(id);
            if (topic != null)
                return JsonResult.success(topic);
            else return JsonResult.badRequest("không có bài viết");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @GetMapping("/find-by-limit/{limit}")
    public ResponseEntity<JsonResult> findByLimit(@PathVariable("limit") int limit) {
        try {
            List<Topic> topic = topicService.findByLimit(limit);
            if (topic != null)
                return JsonResult.success(topic);
            else return JsonResult.badRequest("không có bài viết");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @GetMapping("/find-by-title/{title}")
    public ResponseEntity<JsonResult> findByTitleTopic(@PathVariable("title") String title) {
        try {
            List<Topic> topic = topicService.findByTitleTopicAndDeletedTrue(title);
            if (topic != null)
                return JsonResult.success(topic);
            else return JsonResult.badRequest("không có bài viết");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-by-iduser/{id}")
    public ResponseEntity<JsonResult> findByIdUser(@PathVariable("id") int id) {
        try {
            List<Topic> list = topicService.findByIdUserAndDeletedTrue(id);
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không bài viết");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @GetMapping("/find-by-name-imagesrc-introduct-creatdate")
    public ResponseEntity<JsonResult> findByNameImageSubContentCreateDate() {
        try {
            List<Topic> list = topicService.findByNameImageSubContentCreateDate();
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không bài viết");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @GetMapping("/find-by-name-imagesrc-introduct-creatdate/{limit}")
    public ResponseEntity<JsonResult> findByNameImageSubContentCreateDateLimit(@PathVariable("limit") int limit) {
        try {
            List<Topic> list = topicService.findByNameImageSubContentCreateDateLimit(limit);
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không bài viết");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @GetMapping("/find-by-idcourse/{idCourse}")
    public ResponseEntity<JsonResult> findByCourseIdOfTopic(@PathVariable("idCourse") int idCourse) {
        try {
            List<Topic> list = topicService.findByCourseIdOfTopic(idCourse);
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không bài viết");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("/save/{id-user}/{id-course}")
    public ResponseEntity<JsonResult> save(@RequestBody Topic topic,
                                           @PathVariable("id-user") int idUser,
                                           @PathVariable("id-course") int idCourse) {

        try {
            topic.setCreateDate(LocalDate.now());
            topic.setIdCourse(courseService.findByIdAndDeletedTrue(idCourse));
            topic.setIdUser(userService.findById(idUser));
            System.out.println(userService.findById(idUser));
            // truyen id tag vao de xu ly luu luon ơ bang trung gian
            Boolean topic1 = topicService.save(topic);
            if (topic1 == true) {
                return JsonResult.success(topic);
            } else return JsonResult.badRequest("Lưu không thành công.");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("/delete/{id}")
    public ResponseEntity<JsonResult> delete(@PathVariable("id")int id) {
        Topic topic = topicService.findByIdAndDeletedTrue(id);
        topic.setDeleted(false);
        try {
            Boolean topic1 = topicService.delete(topic);
            if (topic1 == true) {
                return JsonResult.success(topic);
            } else return JsonResult.badRequest("Xóa không thành công.");

        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
}
