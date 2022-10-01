package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.students.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TeacherRepository extends JpaRepository<Teacher, Integer>, JpaSpecificationExecutor<Teacher> {
    List<Teacher> findByDetetedTrue();

    Teacher findByIdAndDetetedTrue(int id);

    @Query("select teacher from Teacher teacher where teacher.name like %?1% and teacher.deteted=true")
    List<Teacher> findByLikeNameTeacherAndDeletedTrue(String name);
}