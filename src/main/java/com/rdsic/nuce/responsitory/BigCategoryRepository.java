package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.category.BigCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface BigCategoryRepository extends JpaRepository<BigCategory, Integer>, JpaSpecificationExecutor<BigCategory> {

}