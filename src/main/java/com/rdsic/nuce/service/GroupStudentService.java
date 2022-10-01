package com.rdsic.nuce.service;

import com.rdsic.nuce.entity.students.GroupStudent;

import java.util.List;

public interface GroupStudentService {
    List<GroupStudent> findByDeletedTrue();
    GroupStudent findByIdAndDeletedTrue(int id);
    GroupStudent findByNameAndDeletedTrue(String name);
    List<GroupStudent> findByDeletedFalse();
}
