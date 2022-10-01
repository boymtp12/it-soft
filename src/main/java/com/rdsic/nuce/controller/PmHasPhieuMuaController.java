package com.rdsic.nuce.controller;

import com.rdsic.nuce.entity.course.CourseHasStudent;
import com.rdsic.nuce.entity.json.JsonResult;
import com.rdsic.nuce.entity.phanmem.PhanMem;
import com.rdsic.nuce.entity.phanmem.PmHasPhieuMua;
import com.rdsic.nuce.key.PmHasPhieuMuaKey;
import com.rdsic.nuce.responsitory.PhanMemRepository;
import com.rdsic.nuce.responsitory.PhieuMuaPmRepository;
import com.rdsic.nuce.responsitory.PmHasPhieuMuaRepository;
import io.swagger.models.auth.In;
import io.swagger.v3.core.util.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/public/pm-has-phieu-mua/")
public class PmHasPhieuMuaController {
    @Autowired
    private PmHasPhieuMuaRepository pmHasPhieuMuaRepository;
    @Autowired
    private PhanMemRepository phanMemRepository;
    @Autowired
    private PhieuMuaPmRepository phieuMuaPmRepository;

    @GetMapping("find-by-phieu-mua-id/{idPhieuMua}")
    public ResponseEntity<JsonResult> findByIdCourse(@PathVariable("idPhieuMua") Integer idPhieuMua) {
        try {
            List<PmHasPhieuMua> list = pmHasPhieuMuaRepository.findByPhieuMuaPmId_Id(idPhieuMua);
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không có thông tin");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @PostMapping("delete/{pmId}/{phieuMuaId}")
    public ResponseEntity<JsonResult> findByIdCourse(@PathVariable("phieuMuaId") Integer phieuMuaId,
                                                     @PathVariable("pmId") Integer pmId) {
        try {
            pmHasPhieuMuaRepository.deleteAll(pmId,phieuMuaId);
            return JsonResult.success("Xóa ok");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("save/{idPhieuMua}/{idPhanMem}")
    public ResponseEntity<JsonResult> save(@PathVariable("idPhieuMua") Integer idPhieuMua,
                                           @PathVariable("idPhanMem") Integer idPhanMem,
                                           @RequestBody PmHasPhieuMua pmHasPhieuMua) {
        try {
            System.out.println(pmHasPhieuMua.toString());
            PhanMem phanMem = phanMemRepository.findById(idPhanMem).get();
            PmHasPhieuMuaKey pmHasPhieuMuaKey = new PmHasPhieuMuaKey();
            pmHasPhieuMuaKey.setPhieuMuaPmId(idPhieuMua);
            pmHasPhieuMuaKey.setPhanMemId(idPhanMem);
            pmHasPhieuMua.setId(pmHasPhieuMuaKey);
            pmHasPhieuMua.setPhanMemId(phanMem);
            pmHasPhieuMua.setPhieuMuaPmId(phieuMuaPmRepository.findById(idPhieuMua).get());
            pmHasPhieuMua.setGiaBan(phanMem.getGiaGiam());

            return JsonResult.success(pmHasPhieuMuaRepository.save(pmHasPhieuMua));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

}
