package com.rdsic.nuce.service_impl;

import com.rdsic.nuce.entity.students.AdvisoryInfor;
import com.rdsic.nuce.responsitory.AdvisoryInforRepository;
import com.rdsic.nuce.service.AdvisoryInforService;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
@Service
public class AdvisoryInforService_Impl implements AdvisoryInforService {
    private static final Logger LOGGER = Logger.getLogger(AdvisoryInforService_Impl.class.getName());

    @Autowired
    private AdvisoryInforRepository advisoryInforRepository;

    @Override
    public AdvisoryInfor findById(int id) {
        System.out.println(id);
        try {
            System.out.println(id);
            System.out.println("a");
            System.out.println( "a" + advisoryInforRepository.findByIdAndDeletedTrue(id));
            return advisoryInforRepository.findByIdAndDeletedTrue(id);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findById error", e.getMessage());
            return null;
        }

    }

    @Override
    public List<AdvisoryInfor> findAll() {
        try {
            return advisoryInforRepository.findByDeletedTrue();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public AdvisoryInfor findByPhoneNumber(String phone) {
        try {
            return advisoryInforRepository.findByPhoneNumberAndDeletedTrue(phone);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByPhone error", e.getMessage());
            return null;
        }
    }

    @Override
    public AdvisoryInfor findByNameStudent(String name) {
        try {
            return advisoryInforRepository.findByNameStudentAndDeletedTrue(name);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByName error", e.getMessage());
            return null;
        }
    }

    @Override
    public Boolean save(AdvisoryInfor advisoryInfor) {
        try {
            advisoryInforRepository.save(advisoryInfor);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "save error", e.getMessage());
            return null;
        }
    }

    @Override
    public Boolean deleted(AdvisoryInfor advisoryInfor) {
        try {
            advisoryInfor.setDeleted(false);
            advisoryInforRepository.save(advisoryInfor);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "deleted error", e.getMessage());
            return null;
        }
    }
}
