package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.students.Students;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDate;
import java.util.List;

public interface StudentsRepository extends JpaRepository<Students, Integer>, JpaSpecificationExecutor<Students> {
    // find all = deleted = true
    List<Students> findByDeletedTrue();

    Students findByIdAndDeletedTrue(int id);

    List<Students> findByFullNameLikeAndDeletedTrue(String name);

    List<Students> findByPhoneNumberAndDeletedTrue(String phone);

    Students findByCodePrivateAndDeletedTrue(String codePrivate);

    List<Students> findByIdGroupStudent_IdAndDeletedTrue(int idGroupStudent);

    List<Students> findByCodeGtAndDeletedTrue(String codeGt);

    List<Students> findByCourseIdNumAndCodeGtAndDeletedTrue(int idCourse, String codeGt);

    List<Students> findByCourseIdNumAndDeletedTrue(int courseId);

    List<Students> findByGroupStudentIdNumAndDeletedTrue(int idGroupStudent);

    List<Students> findBySigninDateLikeAndDeletedTrue(LocalDate date);

    List<Students> findByGroupStudentIdNumAndCourseIdNumAndDeletedTrue(int idGroupStudent, int idCourse);
}