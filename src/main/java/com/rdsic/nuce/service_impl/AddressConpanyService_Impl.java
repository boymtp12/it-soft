package com.rdsic.nuce.service_impl;

import com.rdsic.nuce.entity.company.AddressCompany;
import com.rdsic.nuce.responsitory.AddressCompanyRepository;
import com.rdsic.nuce.responsitory.CompanyRepository;
import com.rdsic.nuce.service.AddressConpanyService;
import com.rdsic.nuce.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class AddressConpanyService_Impl implements AddressConpanyService {
    private static final Logger LOGGER = Logger.getLogger(AddressConpanyService_Impl.class.getName());

    @Autowired
    private AddressCompanyRepository addressCompanyRepository;

    @Override
    public List<AddressCompany> findByDeletedTrue() {
        try {
            return addressCompanyRepository.findByDeletedTrue();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public AddressCompany findByIdAndDeletedTrue(int id) {
        try {
            return addressCompanyRepository.findByIdAndDeletedTrue(id);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findBy error", e.getMessage());
            return null;
        }
    }

    @Override
    public Boolean save(AddressCompany addressCompany) {
        try {
            addressCompanyRepository.save(addressCompany);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findBy error", e.getMessage());
            return false;
        }
    }

    @Override
    public Boolean deleted(AddressCompany addressCompany) {
        try {
            addressCompany.setDeleted(false);
            addressCompanyRepository.save(addressCompany);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findBy error", e.getMessage());
            return false;
        }
    }
}
