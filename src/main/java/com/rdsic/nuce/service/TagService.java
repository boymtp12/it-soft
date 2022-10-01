package com.rdsic.nuce.service;

import com.rdsic.nuce.entity.topic.Tag;

import java.util.List;

public interface TagService {
    List<Tag> findByDeletedTrue();

    Tag findByNameTagAndDeletedTrue(String name);
    Tag findByIdAndDeletedTrue(int id);

    Boolean save(Tag tag);

    Boolean deleted(Tag tag);
}
