package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.topic.Tag;
import com.rdsic.nuce.entity.topic.TopicHasTag;
import org.springframework.data.domain.Example;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface TopicHasTagRepository extends JpaRepository<TopicHasTag, Integer>, JpaSpecificationExecutor<TopicHasTag> {
    List<TopicHasTag> findByDeletedTrue();
    List<TopicHasTag> findById_TopicIdAndDeletedTrue(int id);
//    List<TopicHasTag> findById_TagIdAndDeletedTrue(int id);


    List<TopicHasTag> findByTagAndDeletedTrue(Tag tag);
    List<TopicHasTag> findById_TagIdAndTopic_DeletedTrueAndDeletedTrue(int id);
}