package com.rdsic.nuce.service;

import com.rdsic.nuce.entity.topic.TopicHasTag;

import java.util.List;

public interface TopicHasTagService {
    List<TopicHasTag> findByDeletedTrue();
    List<TopicHasTag> findById_TopicIdAndDeletedTrue(int id);
    List<TopicHasTag> findById_TagIdAndDeletedTrue(int id);
    Boolean save(TopicHasTag topicHasTag);
    Boolean delete(TopicHasTag topicHasTag);
}
