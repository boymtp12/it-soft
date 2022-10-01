package com.rdsic.nuce.service_impl;

import com.rdsic.nuce.entity.course.TypeEducation;
import com.rdsic.nuce.responsitory.TypeEducationRepository;
import com.rdsic.nuce.service.TypeEducationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
@Service
public class TypeEducationService_Impl implements TypeEducationService {
    private static final Logger LOGGER = Logger.getLogger(TypeEducationService_Impl.class.getName());
    @Autowired
    private TypeEducationRepository typeEducationRepository;

    @Override
    public List<TypeEducation> findByDeletedTrue() {
        try {
            return typeEducationRepository.findByDeletedTrue();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public TypeEducation findByIdAndDeletedTrue(int id) {
        try {
            return typeEducationRepository.findByIdAndDeletedTrue(id);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findAll error", e.getMessage());
            return null;
        }
    }
}
