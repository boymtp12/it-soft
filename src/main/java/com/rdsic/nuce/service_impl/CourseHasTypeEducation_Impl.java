package com.rdsic.nuce.service_impl;

import com.rdsic.nuce.entity.course.Course;
import com.rdsic.nuce.entity.course.CourseHasTypeEducation;
import com.rdsic.nuce.entity.course.TypeEducation;
import com.rdsic.nuce.responsitory.CourseHasTypeEducationRepository;
import com.rdsic.nuce.service.CourseHasTypeEducationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class CourseHasTypeEducation_Impl implements CourseHasTypeEducationService {
    private static final Logger LOGGER = Logger.getLogger(CourseHasTypeEducation_Impl.class.getName());

    @Autowired
    private CourseHasTypeEducationRepository courseHasTypeEducationRepository;

    @Override
    public List<CourseHasTypeEducation> findByDeletedTrue() {
        try {
            return courseHasTypeEducationRepository.findByDeletedTrue();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<CourseHasTypeEducation> findByCourseAndDeletedTrue(Course course) {
        try {
            return courseHasTypeEducationRepository.findByCourseAndDeletedTrue(course);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<CourseHasTypeEducation> findByTypeEducationAndDeletedTrue(TypeEducation typeEducation) {
        try {
            return courseHasTypeEducationRepository.findByTypeEducationAndDeletedTrue(typeEducation);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public CourseHasTypeEducation findById_CourseIdAndId_TypeEducationIdAndDeletedTrue(int idCourse, int idTypeEducation) {
        try {
            return courseHasTypeEducationRepository.findById_CourseIdAndId_TypeEducationIdAndDeletedTrue(idCourse,idTypeEducation);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public Boolean save(CourseHasTypeEducation courseHasTypeEducation) {
        try {
            courseHasTypeEducationRepository.save(courseHasTypeEducation);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "save error", e.getMessage());
            return false;
        }
    }

    @Override
    public Boolean deleted(CourseHasTypeEducation courseHasTypeEducation) {
        try {
            courseHasTypeEducation.setDeleted(false);
            courseHasTypeEducationRepository.save(courseHasTypeEducation);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "save error", e.getMessage());
            return false;
        }
    }
}
