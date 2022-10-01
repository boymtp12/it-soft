package com.rdsic.nuce.service;

import com.rdsic.nuce.entity.company.AddressCompany;
import com.rdsic.nuce.entity.course.Course;
import com.rdsic.nuce.entity.students.GroupStudent;
import com.rdsic.nuce.entity.students.Students;
import com.rdsic.nuce.entity.user.User;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface StudentService {
    // làm màu thôi. chính vẫn là responsitory
    Students findById(int id);

    List<Students> findAll();

    boolean saveNewStudent(Students students, Course course, AddressCompany addressCompany, GroupStudent groupStudent, User user);

    List<Students> findByIdGroupStudent_IdAndDeletedTrue_Custom(int idGroupStudent);

    List<Students> findByCodeGtAndDeletedTrueGetAllProperties(String codeGt);

    List<Students> findByFullNameLikeAndDeletedTrue(String name);

    List<Students> findByPhoneNumberAndDeletedTrue(String phone);

    Students findByCodePrivateAndDeletedTrue(String codePrivate);

    List<Students> findByCourseIdNumAndDeletedTrue(int courseId);

    List<Students> findByGroupStudentIdNumAndDeletedTrue(int idGroupStudent);

    List<Students> findByGroupStudentIdNumAndCourseIdNumAndDeletedTrue(int idGroupStudent, int idCourse);

    List<Students> findByCodeGtGetIdAndName_Custom(String code);

    Students findByIdGetAllProperties_Custom(int id);


    List<Students> findBySigninDateLikeAndDeletedTrue(LocalDate date);

    Students findByCodePrivateAndDeletedTrue_GetIdAndFullNameAndCodeGt_Custom(String codePrivate);

    boolean update(Students students);

    boolean deleted(Students students);
}
