package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.course.Course;
import com.rdsic.nuce.entity.course.CourseHasTypeEducation;
import com.rdsic.nuce.entity.course.TypeEducation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface CourseHasTypeEducationRepository extends JpaRepository<CourseHasTypeEducation, Integer>, JpaSpecificationExecutor<CourseHasTypeEducation> {
    List<CourseHasTypeEducation> findByDeletedTrue();
    List<CourseHasTypeEducation> findByCourseAndDeletedTrue(Course course);
    List<CourseHasTypeEducation> findByTypeEducationAndDeletedTrue(TypeEducation typeEducation);
    CourseHasTypeEducation findById_CourseIdAndId_TypeEducationIdAndDeletedTrue(int idCourse, int idTypeEducation);
}