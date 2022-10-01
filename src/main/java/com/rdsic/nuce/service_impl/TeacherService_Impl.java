package com.rdsic.nuce.service_impl;

import com.rdsic.nuce.entity.students.Teacher;
import com.rdsic.nuce.responsitory.TeacherRepository;
import com.rdsic.nuce.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
@Service
public class TeacherService_Impl implements TeacherService {
    private static final Logger LOGGER = Logger.getLogger(TeacherService_Impl.class.getName());
    @Autowired
    private TeacherRepository teacherRepository;
    @Override
    public List<Teacher> findAll() {
        try {
            return teacherRepository.findByDetetedTrue();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public Teacher findById(int id) {
        try {
            return teacherRepository.findByIdAndDetetedTrue(id);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Teacher> findByLikeNameTeacherAndDeletedTrue(String name) {
        try {
            return teacherRepository.findByLikeNameTeacherAndDeletedTrue(name);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public Boolean save(Teacher teacher) {
        try {
            teacherRepository.save(teacher);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findAll error", e.getMessage());
            return false;
        }
    }

    @Override
    public Boolean deleted(Teacher teacher) {
        try {
            teacher.setDeteted(false);
            teacherRepository.save(teacher);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findAll error", e.getMessage());
            return false;
        }
    }
}
