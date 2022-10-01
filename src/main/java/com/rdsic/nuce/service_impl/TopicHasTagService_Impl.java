package com.rdsic.nuce.service_impl;

import com.rdsic.nuce.entity.topic.Topic;
import com.rdsic.nuce.entity.topic.TopicHasTag;
import com.rdsic.nuce.responsitory.TopicHasTagRepository;
import com.rdsic.nuce.service.TopicHasTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class TopicHasTagService_Impl implements TopicHasTagService {
    private static final Logger LOGGER = Logger.getLogger(TagService_Impl.class.getName());

    @Autowired
    private TopicHasTagRepository topicHasTagRepository;

    @Override
    public List<TopicHasTag> findByDeletedTrue() {
        try {
            return topicHasTagRepository.findByDeletedTrue();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<TopicHasTag> findById_TagIdAndDeletedTrue(int id) {
        try {
            return topicHasTagRepository.findById_TagIdAndTopic_DeletedTrueAndDeletedTrue(id);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findIdTag error", e.getMessage());
            return null;
        }

    }

    @Override
    public List<TopicHasTag> findById_TopicIdAndDeletedTrue(int id) {
        try {
            return topicHasTagRepository.findById_TopicIdAndDeletedTrue(id);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findIdTopic error", e.getMessage());
            return null;
        }
    }

    @Override
    public Boolean save(TopicHasTag topicHasTag) {
        try {
            topicHasTagRepository.save(topicHasTag);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findIdTopic error", e.getMessage());
            return false;
        }
    }

    @Override
    public Boolean delete(TopicHasTag topicHasTag) {
        topicHasTag.setDeleted(false);
        try {
            topicHasTagRepository.save(topicHasTag);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findIdTopic error", e.getMessage());
            return false;
        }
    }
}
