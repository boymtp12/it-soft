package com.rdsic.nuce.service;

import com.rdsic.nuce.entity.company.Company;


import java.util.List;

public interface CompanyService {
    Company findById(int id);
    List<Company> findAll();
    Boolean save(Company company);
    Boolean deleted(Company company);
}
