package com.rdsic.nuce.service;

import com.rdsic.nuce.entity.course.Course;
import com.rdsic.nuce.entity.course.CourseHasTypeEducation;
import com.rdsic.nuce.entity.course.TypeEducation;

import java.util.List;

public interface CourseHasTypeEducationService {
    List<CourseHasTypeEducation> findByDeletedTrue();
    List<CourseHasTypeEducation> findByCourseAndDeletedTrue(Course course);
    List<CourseHasTypeEducation> findByTypeEducationAndDeletedTrue(TypeEducation typeEducation);
    CourseHasTypeEducation findById_CourseIdAndId_TypeEducationIdAndDeletedTrue(int idCourse, int idTypeEducation);
    Boolean save(CourseHasTypeEducation courseHasTypeEducation);
    Boolean deleted(CourseHasTypeEducation courseHasTypeEducation);
}
