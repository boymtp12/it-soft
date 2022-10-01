package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.students.AdvisoryInfor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;


import java.util.List;

public interface AdvisoryInforRepository extends JpaRepository<AdvisoryInfor, Integer>, JpaSpecificationExecutor<AdvisoryInfor> {
    AdvisoryInfor findByIdAndDeletedTrue(int id);
    List<AdvisoryInfor> findByDeletedTrue();
    AdvisoryInfor findByPhoneNumberAndDeletedTrue(String phone);
    AdvisoryInfor findByNameStudentAndDeletedTrue(String name);
}