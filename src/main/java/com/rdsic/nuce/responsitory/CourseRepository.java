package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.course.Course;
import com.rdsic.nuce.entity.course.Theme;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CourseRepository extends JpaRepository<Course, Integer>, JpaSpecificationExecutor<Course> {
    Course findByIdAndDeletedTrue(int id);

    List<Course> findByDeletedTrue();

    //tìm theo tên
    Course findByNameAndDeletedTrue(String name);

    //tìm theo đối tượng hướng đến
    List<Course> findByObjStudentsAndDeletedTrue(String obj);

    //tìm theo khuyến mãi
    List<Course> findByPromotionTrue();
    // findBy id theme
    List<Course> findByIdThemeAndDeletedTrue(Theme theme);

    @Query("select c from Course c where c.deleted=true and c.name like %?1%")
    List<Course> findByDeletedTrueLikeName( String name);
}