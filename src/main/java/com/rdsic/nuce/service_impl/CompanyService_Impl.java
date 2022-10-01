package com.rdsic.nuce.service_impl;

import com.rdsic.nuce.entity.company.Company;
import com.rdsic.nuce.responsitory.CompanyRepository;
import com.rdsic.nuce.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
@Service
public class CompanyService_Impl implements CompanyService {
    private static final Logger LOGGER = Logger.getLogger(CompanyService_Impl.class.getName());

    @Autowired
    private CompanyRepository companyRepository;
    @Override
    public Company findById(int id) {
        try {
            return companyRepository.findByIdAndDeletedTrue(id);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findById error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Company> findAll() {
        try {
            return companyRepository.findByDeletedTrue();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public Boolean save(Company company) {
        try {
            companyRepository.save(company);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "save error", e.getMessage());
            return false;
        }
    }

    @Override
    public Boolean deleted(Company company) {
        try {
            company.setDeleted(false);
            companyRepository.save(company);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "deleted error", e.getMessage());
            return false;
        }
    }
}
