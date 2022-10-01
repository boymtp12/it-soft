package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.category.SmallCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface SmallCategoryRepository extends JpaRepository<SmallCategory, Integer>, JpaSpecificationExecutor<SmallCategory> {
    List<SmallCategory> findByDeletedTrue();
    SmallCategory findByIdsmallCategory(int id);
}