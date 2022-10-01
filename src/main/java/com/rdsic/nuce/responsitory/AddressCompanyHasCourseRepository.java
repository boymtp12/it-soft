package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.course.AddressCompanyHasCourse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface AddressCompanyHasCourseRepository extends JpaRepository<AddressCompanyHasCourse, Void>, JpaSpecificationExecutor<AddressCompanyHasCourse> {

}