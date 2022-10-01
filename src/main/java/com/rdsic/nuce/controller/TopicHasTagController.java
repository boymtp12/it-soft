package com.rdsic.nuce.controller;

import com.rdsic.nuce.entity.json.JsonResult;
import com.rdsic.nuce.entity.topic.Tag;
import com.rdsic.nuce.entity.topic.Topic;
import com.rdsic.nuce.entity.topic.TopicHasTag;

import com.rdsic.nuce.key.TopicTagKey;
import com.rdsic.nuce.service.TagService;
import com.rdsic.nuce.service.TopicHasTagService;
import com.rdsic.nuce.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/public/topic-has-tag")
public class TopicHasTagController {
    @Autowired
    private TopicHasTagService topicHasTagService;

    @Autowired
    private TopicService topicService;
    @Autowired
    private TagService tagService;

    @GetMapping("/find-all")
    public ResponseEntity<JsonResult> findAll() {
        try {
            List<TopicHasTag> topicHasTags = topicHasTagService.findByDeletedTrue();
            if (topicHasTags != null)
                return JsonResult.success(topicHasTags);
            else return JsonResult.badRequest("Không có dữ liệu");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-by-idtopic")
    public ResponseEntity<JsonResult> findByIdTopic(@RequestParam("id") int id) {
        try {
            List<TopicHasTag> topicHasTags = topicHasTagService.findById_TopicIdAndDeletedTrue(id);
            if (topicHasTags != null)
                return JsonResult.success(topicHasTags);
            else return JsonResult.badRequest("Không có dữ liệu");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-by-idtag")
    public ResponseEntity<JsonResult> findByIdTag(@RequestParam("id") int id) {
        try {
            List<TopicHasTag> topicHasTags = topicHasTagService.findById_TagIdAndDeletedTrue(id);
            if (topicHasTags != null)
                return JsonResult.success(topicHasTags);
            else return JsonResult.badRequest("Không có dữ liệu");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("/save/{idTopic}/{idTag}")
    public ResponseEntity<JsonResult> save(@PathVariable("idTopic") int idTopic, @PathVariable("idTag") int idTag) {
        try {
            TopicHasTag topicHasTags = new TopicHasTag();
            Tag tag = tagService.findByIdAndDeletedTrue(idTag);
            Topic topic = topicService.findByIdAndDeletedTrue(idTopic);
            if (tag != null && topic != null) {
                topicHasTags.setId(new TopicTagKey(idTopic, idTag));
                topicHasTags.setTopic(topic);
                topicHasTags.setTag(tag);
                topicHasTags.setDeleted(true);
                topicHasTagService.save(topicHasTags);
                return JsonResult.success(topicHasTags);
            } else {
              return JsonResult.badRequest("Không có topic or tag");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
}

