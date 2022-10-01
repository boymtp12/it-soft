package com.rdsic.nuce.service_impl;

import com.rdsic.nuce.entity.category.SmallCategory;
import com.rdsic.nuce.responsitory.SmallCategoryRepository;
import com.rdsic.nuce.service.SmallCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
@Service
public class SmallCategoryService_Impl implements SmallCategoryService {
    private static final Logger LOGGER = Logger.getLogger(CourseService_Impl.class.getName());
    @Autowired
    private SmallCategoryRepository smallCategoryRepository;
    @Override
    public List<SmallCategory> findByDeletedTrue() {
        try{
            return smallCategoryRepository.findByDeletedTrue();
        }catch (Exception e){
            LOGGER.log(Level.SEVERE, "findByAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public SmallCategory findByIdsmallCategory(int id) {
        try{
            return smallCategoryRepository.findByIdsmallCategory(id);
        }catch (Exception e){
            LOGGER.log(Level.SEVERE, "findByAll error", e.getMessage());
            return null;
        }
    }
}
