package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.phanmem.PhieuMuaPm;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface PhieuMuaPmRepository extends JpaRepository<PhieuMuaPm, Integer>, JpaSpecificationExecutor<PhieuMuaPm> {
    List<PhieuMuaPm> findByDeletedFalseOrderByIdDesc();

    List<PhieuMuaPm> findBySoDienThoaiLikeAndDeletedFalse(String sdt);
}