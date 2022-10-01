package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.course.CourseHasStudent;
import com.rdsic.nuce.key.CourseStudentKey;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface CourseHasStudentRepository extends JpaRepository<CourseHasStudent, Integer>, JpaSpecificationExecutor<CourseHasStudent> {
    List<CourseHasStudent> findByDeletedTrue();
    List<CourseHasStudent> findById_CourseIdAndDeletedTrue(int idCourse);
    List<CourseHasStudent> findById_StudentIdAndDeletedTrue(int idStudent);
    // id chính là cái has key nên phải truyền cả đối tượng vô
    CourseHasStudent findByIdAndDeletedTrue(CourseStudentKey courseStudentKey);

}