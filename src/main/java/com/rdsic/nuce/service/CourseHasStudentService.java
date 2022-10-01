package com.rdsic.nuce.service;

import com.rdsic.nuce.entity.course.CourseHasStudent;
import com.rdsic.nuce.key.CourseStudentKey;

import java.util.List;

public interface CourseHasStudentService {
    List<CourseHasStudent> findByIdCourseAndDeletedTrue(int idCourse);
    List<CourseHasStudent> findByIdStudentAndDeletedTrue(int idStudent);
    List<CourseHasStudent> findByDeletedTrue();
    // id chính là cái has key nên phải truyền cả đối tượng vô
    CourseHasStudent findByIdAndDeletedTrue(CourseStudentKey courseStudentKey);

    Boolean save(CourseHasStudent courseHasStudent);
    Boolean deleted(CourseHasStudent courseHasStudent);
}
