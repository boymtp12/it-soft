package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.topic.Topic;
import com.rdsic.nuce.entity.user.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TopicRepository extends JpaRepository<Topic, Integer>, JpaSpecificationExecutor<Topic> {
    Topic findByIdAndDeletedTrue(int id);

    List<Topic> findByIdUserAndDeletedTrue(User user);

    List<Topic> findByDeletedTrue();

    @Query("SELECT topic FROM Topic topic WHERE topic.title LIKE %?1% AND topic.deleted=true ")
    List<Topic> findTitleLikeAndDeletedTrue(String title);


}