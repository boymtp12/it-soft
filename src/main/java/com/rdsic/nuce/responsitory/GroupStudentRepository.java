package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.students.GroupStudent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface GroupStudentRepository extends JpaRepository<GroupStudent, Integer>, JpaSpecificationExecutor<GroupStudent> {
    List<GroupStudent> findByDeletedTrue();
    GroupStudent findByIdAndDeletedTrue(int id);
    GroupStudent findByNameAndDeletedTrue(String name);
    List<GroupStudent> findByDeletedFalse();
}