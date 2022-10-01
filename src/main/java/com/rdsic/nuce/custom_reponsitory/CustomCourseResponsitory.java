package com.rdsic.nuce.custom_reponsitory;

import com.rdsic.nuce.entity.course.Course;
import com.rdsic.nuce.entity.topic.Topic;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface CustomCourseResponsitory {
     List<Course> findByDeletedTrueAnhLimit(int limit);

    List<Course> findByLimit_GetIdAndNameAndFeesAndImageUrlAndPromotionAndSubContent(int limit);

    List<Course> findByClassify_GetIdAndNameAndUrlViewAndCreateDate(Boolean classify);

    Course findByIdGetIdAndNameAndTuitionFeeAndUrlView(int id);

    Course findByIdGetIdAndNameAndImageAndUrlViewAndAllMeta(int id);
}
