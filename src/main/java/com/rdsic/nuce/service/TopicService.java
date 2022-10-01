package com.rdsic.nuce.service;

import com.rdsic.nuce.entity.topic.Topic;

import java.util.List;

public interface TopicService {
    Topic findByIdAndDeletedTrue(int id);
    List<Topic> findByIdUserAndDeletedTrue(int id);
    List<Topic> findByDeletedTrue();
    List<Topic> findByTitleTopicAndDeletedTrue(String name);
    List<Topic> findByLimit(int limit);
    List<Topic> findByCourseIdOfTopic(int id);
    List<Topic> findByNameImageSubContentCreateDate();
    List<Topic> findByNameImageSubContentCreateDateLimit(int limit);
    Boolean save(Topic topic);
    Boolean delete(Topic topic);
}
