package com.rdsic.nuce.service;

import com.rdsic.nuce.entity.course.Course;
import com.rdsic.nuce.entity.course.Theme;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CourseService {
    Course findByIdAndDeletedTrue(int id);

    List<Course> findByDeletedTrue();

    Course findByNameAndDeletedTrue(String name);

    //tìm theo đối tượng hướng đến
    List<Course> findByObjStudentsAndDeletedTrue(String obj);

    //tìm theo khuyến mãi
    List<Course> findByPromotionTrue();

    List<Course> findByIdThemeAndDeletedTrue(Theme theme);

    List<Course> findByDeletedTrueAndLimit(int limit);

    List<Course> findByDeletedTrueLikeName(String name);

    List<Course> findByLimit_GetIdAndNameAndFeesAndImageUrlAndPromotionAndSubContent(int limit);
    List<Course> findByClassify_GetIdAndNameAndUrlViewAndCreateDate(Boolean classify);

    Boolean save(Course course);

    Boolean deleted(Course course);
}
