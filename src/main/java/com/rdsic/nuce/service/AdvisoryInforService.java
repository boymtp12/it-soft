package com.rdsic.nuce.service;

import com.rdsic.nuce.entity.students.AdvisoryInfor;

import java.util.List;

public interface AdvisoryInforService {
    AdvisoryInfor findById(int id);
    List<AdvisoryInfor> findAll();
    AdvisoryInfor findByPhoneNumber(String phone);
    AdvisoryInfor findByNameStudent(String name);
    Boolean save(AdvisoryInfor advisoryInfor);
    Boolean deleted(AdvisoryInfor advisoryInfor);
}
