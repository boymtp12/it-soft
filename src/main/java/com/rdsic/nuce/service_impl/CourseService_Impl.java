package com.rdsic.nuce.service_impl;

import com.rdsic.nuce.custom_reponsitory.CustomCourseResponsitory;
import com.rdsic.nuce.entity.course.Course;
import com.rdsic.nuce.entity.course.Theme;
import com.rdsic.nuce.responsitory.CourseRepository;
import com.rdsic.nuce.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class CourseService_Impl implements CourseService {
    private static final Logger LOGGER = Logger.getLogger(CourseService_Impl.class.getName());

    @Autowired
    private CourseRepository courseRepository;
    @Autowired
    private CustomCourseResponsitory customCourseResponsitory;

    @Override
    public Course findByIdAndDeletedTrue(int id) {
        try {
            return courseRepository.findByIdAndDeletedTrue(id);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findById error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Course> findByDeletedTrue() {
        try {
            return courseRepository.findByDeletedTrue();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public Course findByNameAndDeletedTrue(String name) {
        try {
            return courseRepository.findByNameAndDeletedTrue(name);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByName error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Course> findByObjStudentsAndDeletedTrue(String obj) {
        try {
            return courseRepository.findByObjStudentsAndDeletedTrue(obj);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Course> findByPromotionTrue() {
        try {
            return courseRepository.findByPromotionTrue();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Course> findByIdThemeAndDeletedTrue(Theme theme) {
        try {
            return courseRepository.findByIdThemeAndDeletedTrue(theme);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByIdTheme error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Course> findByDeletedTrueAndLimit(int limit) {
        try {
            return customCourseResponsitory.findByDeletedTrueAnhLimit(limit);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByLimit error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Course> findByDeletedTrueLikeName(String name) {
        try {
            return courseRepository.findByDeletedTrueLikeName(name);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByLimit error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Course> findByLimit_GetIdAndNameAndFeesAndImageUrlAndPromotionAndSubContent(int limit) {
        try {
            return customCourseResponsitory.findByLimit_GetIdAndNameAndFeesAndImageUrlAndPromotionAndSubContent(limit);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByLimit error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Course> findByClassify_GetIdAndNameAndUrlViewAndCreateDate(Boolean classify) {
        try {
            return customCourseResponsitory.findByClassify_GetIdAndNameAndUrlViewAndCreateDate(classify);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByLimit error", e.getMessage());
            return null;
        }
    }

    @Override
    public Boolean save(Course course) {
        try {
            course.setCreateDate(LocalDate.now());
            courseRepository.save(course);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "save error", e.getMessage());
            return false;
        }
    }

    @Override
    public Boolean deleted(Course course) {
        try {
            course.setDeleted(false);
            courseRepository.save(course);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "save error", e.getMessage());
            return false;
        }
    }
}
