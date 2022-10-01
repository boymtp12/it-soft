package com.rdsic.nuce.custom_reponsitory;

import com.rdsic.nuce.entity.topic.Topic;
import org.springframework.data.jpa.domain.Specification;

import java.util.List;

public interface CustomTopicResponsitory {
    List<Topic> findByTopicLimit(int limit);
    Specification<Topic> findByTitleLike(String title);
    List<Topic> findByCourseIdOfTopic(int id);
    List<Topic> findByNameImageSubContentCreateDateLimit(int limit);
    List<Topic> findByNameImageSubContentCreateDate();
}
