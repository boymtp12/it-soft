package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.topic.Tag;
import org.springframework.data.domain.Example;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface TagRepository extends JpaRepository<Tag, Integer>, JpaSpecificationExecutor<Tag> {
    List<Tag> findByDeletedTrue();

    Tag findByIdAndDeletedTrue(int id);

    Tag findByNameAndDeletedTrue(String name);
}