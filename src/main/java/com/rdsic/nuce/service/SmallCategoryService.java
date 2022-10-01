package com.rdsic.nuce.service;

import com.rdsic.nuce.entity.category.SmallCategory;

import java.util.List;

public interface SmallCategoryService {
    List<SmallCategory> findByDeletedTrue();
    SmallCategory findByIdsmallCategory(int id);
}
