package com.rdsic.nuce.service;

import com.rdsic.nuce.entity.course.TypeEducation;

import java.util.List;

public interface TypeEducationService {
    List<TypeEducation> findByDeletedTrue();

    TypeEducation findByIdAndDeletedTrue(int id);
}
