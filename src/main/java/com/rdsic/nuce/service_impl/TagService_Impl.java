package com.rdsic.nuce.service_impl;

import com.rdsic.nuce.entity.topic.Tag;
import com.rdsic.nuce.responsitory.TagRepository;
import com.rdsic.nuce.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class TagService_Impl implements TagService {
    private static final Logger LOGGER = Logger.getLogger(TagService_Impl.class.getName());

    @Autowired
    private TagRepository tagRepository;

    @Override
    public List<Tag> findByDeletedTrue() {
        try {
            return tagRepository.findByDeletedTrue();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findAll error", e.getMessage());
            return null;
        }

    }

    @Override
    public Tag findByNameTagAndDeletedTrue(String name) {
        try {
            return tagRepository.findByNameAndDeletedTrue(name);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findName error", e.getMessage());
            return null;
        }
    }

    @Override
    public Tag findByIdAndDeletedTrue(int id) {
        try {
            return tagRepository.findByIdAndDeletedTrue(id);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findId error", e.getMessage());
            return null;
        }

    }

    @Override
    public Boolean save(Tag tag) {
        try {
            tagRepository.save(tag);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "save error", e.getMessage());
            return false;
        }
    }

    @Override
    public Boolean deleted(Tag tag) {
        try {
            tag.setDeleted(false);
            tagRepository.save(tag);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "save error", e.getMessage());
            return false;
        }
    }
}
