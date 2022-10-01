package com.rdsic.nuce.service_impl;

import com.rdsic.nuce.entity.students.GroupStudent;
import com.rdsic.nuce.entity.students.Students;
import com.rdsic.nuce.responsitory.GroupStudentRepository;
import com.rdsic.nuce.service.GroupStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class GroupStudentService_Impl implements GroupStudentService {
        private static final Logger LOGGER = Logger.getLogger(GroupStudentService_Impl.class.getName());

    @Autowired
    private GroupStudentRepository groupStudentRepository;
    @Override
    public List<GroupStudent> findByDeletedTrue() {
        try {
            List<GroupStudent> list = groupStudentRepository.findByDeletedTrue();
            return list;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-all-error: {0}", e.getMessage());
            return null;
        }
    }

    @Override
    public GroupStudent findByIdAndDeletedTrue(int id) {
        try {
            GroupStudent groupStudent = groupStudentRepository.findByIdAndDeletedTrue(id);
            return groupStudent;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-id-error: {0}", e.getMessage());
            return null;
        }
    }

    @Override
    public GroupStudent findByNameAndDeletedTrue(String name) {
        try {
            GroupStudent groupStudent = groupStudentRepository.findByNameAndDeletedTrue(name);
            return groupStudent;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-name-error: {0}", e.getMessage());
            return null;
        }
    }

    @Override
    public List<GroupStudent> findByDeletedFalse() {
        try {
            List<GroupStudent> list = groupStudentRepository.findByDeletedFalse();

            return list;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-all-error: {0}", e.getMessage());
            return null;
        }
    }
}
