package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.phanmem.PhanMem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface PhanMemRepository extends JpaRepository<PhanMem, Integer>, JpaSpecificationExecutor<PhanMem> {
    List<PhanMem> findByTenLike(String ten);


    List<PhanMem> findByAndDeletedFalseOrderByIdDesc();


}