package com.rdsic.nuce.service_impl;

import com.rdsic.nuce.entity.course.CourseHasStudent;
import com.rdsic.nuce.key.CourseStudentKey;
import com.rdsic.nuce.responsitory.CourseHasStudentRepository;
import com.rdsic.nuce.service.CourseHasStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class CourseHasStudentService_Impl implements CourseHasStudentService {
    private static final Logger LOGGER = Logger.getLogger(CourseHasStudentService_Impl.class.getName());
    @Autowired
    private CourseHasStudentRepository courseHasStudentRepository;

    @Override
    public List<CourseHasStudent> findByIdCourseAndDeletedTrue(int idCourse) {
        try {
            return courseHasStudentRepository.findById_CourseIdAndDeletedTrue(idCourse);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByIdCourse error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<CourseHasStudent> findByIdStudentAndDeletedTrue(int idStudent) {
        try {
            return courseHasStudentRepository.findById_StudentIdAndDeletedTrue(idStudent);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByIdStudent error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<CourseHasStudent> findByDeletedTrue() {
        try {
            return courseHasStudentRepository.findByDeletedTrue();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public CourseHasStudent findByIdAndDeletedTrue(CourseStudentKey courseStudentKey) {
        try {
            return courseHasStudentRepository.findByIdAndDeletedTrue(courseStudentKey);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public Boolean save(CourseHasStudent courseHasStudent) {
        try {
            courseHasStudentRepository.save(courseHasStudent);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "save error", e.getMessage());
            System.out.println(e.getMessage());
            return false;
        }
    }

    @Override
    public Boolean deleted(CourseHasStudent courseHasStudent) {
        try {
            courseHasStudent.setDeleted(false);
            courseHasStudentRepository.save(courseHasStudent);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findIdTopic error", e.getMessage());
            return false;
        }
    }
}
