package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.company.Company;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface CompanyRepository extends JpaRepository<Company, Integer>, JpaSpecificationExecutor<Company> {
    Company findByIdAndDeletedTrue(int id);
    List<Company> findByDeletedTrue();

}