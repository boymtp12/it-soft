package com.rdsic.nuce.custom_reponsitory;

import com.rdsic.nuce.entity.students.Students;

import java.util.List;

public interface CustomStudentRespository {
    Students findByIdGetAllProperties(int id);
    List<Students> findByCodeGtGetIdAndName(String codePrivate);
    Students findByCodePrivateAndDeletedTrue_GetIdAndFullNameAndCodeGt(String codePrivate);
    List<Students> findByCourse_IdAndCodeGtGetIdAndFullNameAndCodePrivateAndCodeGtAndUser_IdAndGroupSt_IdAndCourse_Id(int idCourse,String codeGt);
    List<Students> findByGroupStudentAndDeletedTrue_GetAllProperties(int idGroupStudent);
}
