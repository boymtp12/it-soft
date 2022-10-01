package com.rdsic.nuce.custom_responsitory_impl;

import com.rdsic.nuce.custom_reponsitory.CustomStudentRespository;
import com.rdsic.nuce.entity.students.Students;
import com.rdsic.nuce.entity.topic.Topic;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class CustomStudentRespository_Impl implements CustomStudentRespository {
    @PersistenceContext
    private EntityManager entityManager;

    /*
     * Tìm kiếm trong cột codegt xem có những code nào trùng với codePrivate của mỗi student
     * để kiểm tra xem sinh viên này đã giới thiệu được những ai chưa
     * @param: codePrivate - mã cá nhân của mỗi student
     * @result: kết quả là 1 list student mà sinh viên đó giới thiệu được, nếu không có
     * */
    @Override
    public List<Students> findByCodeGtGetIdAndName(String codeGt) {
        return entityManager.createQuery("select new com.rdsic.nuce.entity.students.Students(st.id,st.fullName,st.codeGt) from Students st where st.deleted=true and st.codeGt= ?1 order by st.id DESC ")
                .setParameter(1, codeGt).getResultList();
    }

    @Override
    public Students findByIdGetAllProperties(int id) {
        return (Students) entityManager.createQuery("select new com.rdsic.nuce.entity.students.Students(st.id,st.phoneNumber,st.fullName,st.email,st.address,st.dateOfBirth,st.addrOfBirth,st.jobCurrent,st.nameSchool,st.facultySchool,st.takeCertification,st.codePrivate,st.codeGt,st.userIdNum,st.groupStudentIdNum,st.courseIdNum ,st.signinDate,st.tuitionFeeOfStudent,st.checkOldStudent,st.sex) from Students st where st.deleted=true and st.id=?1 order by st.id DESC ")
                .setParameter(1, id).getSingleResult();
    }



    /*
     * Tìm kiếm trong cột codePrivate xem có sinh viên này trùng với code
     * để lấy ra thông tin của sinh viên đó
     * @param: codePrivate - mã private muốn tìm kiếm
     * @result: kết quả là 1 sinh viên có mã trùng với mã cần tìm kiếm
     * */
    @Override
    public Students findByCodePrivateAndDeletedTrue_GetIdAndFullNameAndCodeGt(String codePrivate) {
        return (Students) entityManager.createQuery("select new com.rdsic.nuce.entity.students.Students(st.id,st.fullName,st.codeGt) from Students st where st.deleted=true and st.codePrivate=?1 order by st.id DESC ")
                .setParameter(1, codePrivate).getSingleResult();
    }

    @Override
    public List<Students> findByCourse_IdAndCodeGtGetIdAndFullNameAndCodePrivateAndCodeGtAndUser_IdAndGroupSt_IdAndCourse_Id(int idCourse,String codeGt) {
        return  entityManager.createQuery("select new com.rdsic.nuce.entity.students.Students(st.id,st.fullName,st.codePrivate,st.codeGt,st.userIdNum,st.groupStudentIdNum,st.courseIdNum) from Students st where st.deleted=true and st.courseIdNum= ?1 and st.codeGt =?2 order by st.id DESC ")
                .setParameter(1, idCourse).setParameter(2,codeGt).getResultList();
    }

    @Override
    public List<Students> findByGroupStudentAndDeletedTrue_GetAllProperties(int idGroupStudent) {
        return entityManager.createQuery("select new com.rdsic.nuce.entity.students.Students(st.id,st.phoneNumber,st.fullName,st.email,st.address,st.dateOfBirth,st.addrOfBirth,st.jobCurrent,st.nameSchool,st.facultySchool,st.takeCertification,st.codePrivate,st.codeGt,st.userIdNum,st.groupStudentIdNum,st.courseIdNum ,st.signinDate,st.tuitionFeeOfStudent,st.checkOldStudent,st.sex) from Students st where st.deleted=true and st.groupStudentIdNum=?1 order by st.id DESC ")
                .setParameter(1, idGroupStudent).getResultList();
    }

}
