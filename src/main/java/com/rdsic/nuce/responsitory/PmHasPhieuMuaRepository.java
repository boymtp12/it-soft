package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.phanmem.PmHasPhieuMua;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface PmHasPhieuMuaRepository extends JpaRepository<PmHasPhieuMua, Integer>, JpaSpecificationExecutor<PmHasPhieuMua> {
    List<PmHasPhieuMua> findByPhieuMuaPmId_Id(Integer id);
    @Modifying
    @Transactional
    @Query("delete  from PmHasPhieuMua as h where h.phanMemId.id = :pmId and h.phieuMuaPmId.id = :phieuMuaId ")
    void deleteAll(@Param("pmId") Integer pmId, @Param("phieuMuaId") Integer phieuMuaId);
}