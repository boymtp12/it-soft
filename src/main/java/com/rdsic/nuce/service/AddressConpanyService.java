package com.rdsic.nuce.service;

import com.rdsic.nuce.entity.company.AddressCompany;

import java.util.List;

public interface AddressConpanyService {
    List<AddressCompany> findByDeletedTrue();
    AddressCompany findByIdAndDeletedTrue(int id);
    Boolean save(AddressCompany addressCompany);
    Boolean deleted(AddressCompany addressCompany);
}
