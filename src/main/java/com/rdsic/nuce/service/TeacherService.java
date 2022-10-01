package com.rdsic.nuce.service;

import com.rdsic.nuce.entity.students.Teacher;

import java.util.List;

public interface TeacherService {
    List<Teacher> findAll();
    Teacher findById(int id);
    List<Teacher> findByLikeNameTeacherAndDeletedTrue(String name);
    Boolean save(Teacher teacher);
    Boolean deleted(Teacher teacher);
}
