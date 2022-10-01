package com.rdsic.nuce.service_impl;

import com.rdsic.nuce.custom_reponsitory.CustomTopicResponsitory;
import com.rdsic.nuce.entity.topic.Tag;
import com.rdsic.nuce.entity.topic.Topic;
import com.rdsic.nuce.entity.topic.TopicHasTag;
import com.rdsic.nuce.entity.user.User;
import com.rdsic.nuce.key.TopicTagKey;
import com.rdsic.nuce.responsitory.TagRepository;
import com.rdsic.nuce.responsitory.TopicHasTagRepository;
import com.rdsic.nuce.responsitory.TopicRepository;
import com.rdsic.nuce.responsitory.UserRepository;
import com.rdsic.nuce.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class TopicService_Impl implements TopicService {
    private static final Logger LOGGER = Logger.getLogger(TopicService_Impl.class.getName());

    @Autowired
    private TopicRepository topicRepository;
    @Autowired
    private TopicHasTagRepository topicHasTagRepository;
    @Autowired
    private TagRepository tagRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CustomTopicResponsitory customTopicResponsitory;

    @Override
    public Topic findByIdAndDeletedTrue(int id) {
        try {
            return topicRepository.findByIdAndDeletedTrue(id);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findId error", e.getMessage());
            return null;
        }

    }

    @Override
    public List<Topic> findByIdUserAndDeletedTrue(int idUser) {
        try {
            return topicRepository.findByIdUserAndDeletedTrue(userRepository.findByIdAndDeletedTrue(idUser));
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findTopic error", e.getMessage());
            return null;
        }

    }

    @Override
    public List<Topic> findByDeletedTrue() {
        try {
            return topicRepository.findByDeletedTrue();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Topic> findByTitleTopicAndDeletedTrue(String title) {
        try {
            return topicRepository.findTitleLikeAndDeletedTrue(title);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findTopic error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Topic> findByLimit(int limit) {
        try {
            return customTopicResponsitory.findByTopicLimit(limit);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findTopic error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Topic> findByCourseIdOfTopic(int id) {
        try {
            return customTopicResponsitory.findByCourseIdOfTopic(id);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findTopic error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Topic> findByNameImageSubContentCreateDate() {
        try {
            return customTopicResponsitory.findByNameImageSubContentCreateDate();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findTopic error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Topic> findByNameImageSubContentCreateDateLimit(int limit) {

        try {
            return customTopicResponsitory.findByNameImageSubContentCreateDateLimit(limit);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findTopic error", e.getMessage());
            return null;
        }
    }

    // lưu luôn ở bảng trung gian để đỡ phải gọi nhiều api
    @Override
    public Boolean save(Topic topic) {
        try {
            // lưu topic trước
            topicRepository.save(topic);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "save error", e.getMessage());
            return false;
        }
    }

    @Override
    public Boolean delete(Topic topic) {
        try {
            topic.setDeleted(false);
            topicRepository.save(topic);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "delete error", e.getMessage());
            return false;
        }
    }
}
