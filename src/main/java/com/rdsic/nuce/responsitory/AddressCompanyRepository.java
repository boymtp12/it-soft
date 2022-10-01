package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.company.AddressCompany;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface AddressCompanyRepository extends JpaRepository<AddressCompany, Integer>, JpaSpecificationExecutor<AddressCompany> {
    List<AddressCompany> findByDeletedTrue();
    AddressCompany findByIdAndDeletedTrue(int id);
}