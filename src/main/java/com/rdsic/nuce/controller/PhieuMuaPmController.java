package com.rdsic.nuce.controller;

import com.rdsic.nuce.entity.json.JsonResult;
import com.rdsic.nuce.entity.phanmem.PhanMem;
import com.rdsic.nuce.entity.phanmem.PhieuMuaPm;
import com.rdsic.nuce.entity.phanmem.PmHasPhieuMua;
import com.rdsic.nuce.entity.user.User;
import com.rdsic.nuce.key.PmHasPhieuMuaKey;
import com.rdsic.nuce.responsitory.PhanMemRepository;
import com.rdsic.nuce.responsitory.PhieuMuaPmRepository;
import com.rdsic.nuce.responsitory.PmHasPhieuMuaRepository;
import com.rdsic.nuce.responsitory.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("api/v1/public/phieu-mua-pm/")
public class PhieuMuaPmController {
    @Autowired
    private PhieuMuaPmRepository phieuMuaPmRepository;
    @Autowired
    private PhanMemRepository phanMemRepository;
    @Autowired
    private PmHasPhieuMuaRepository pmHasPhieuMuaRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("find-all")
    public ResponseEntity<JsonResult> findByAndDeletedFalse() {
        try {
            List<PhieuMuaPm> list = phieuMuaPmRepository.findByDeletedFalseOrderByIdDesc();
            if (list != null) {
                return JsonResult.success(list);
            } else {
                return JsonResult.badRequest("Không có");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-id/{id}")
    public ResponseEntity<JsonResult> findById(@PathVariable("id") Integer id) {
        try {
            PhieuMuaPm phieuMuaPm = phieuMuaPmRepository.findById(id).get();
            if (phieuMuaPm != null) {
                return JsonResult.success(phieuMuaPm);
            } else {
                return JsonResult.badRequest("Không có");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-like-sdt/{sdt}")
    public ResponseEntity<JsonResult> findByLikeTen(@PathVariable("sdt") String sdt) {
        try {
            List<PhieuMuaPm> phanMem = phieuMuaPmRepository.findBySoDienThoaiLikeAndDeletedFalse("%" + sdt + "%");
            if (phanMem != null) {
                return JsonResult.success(phanMem);
            } else {
                return JsonResult.badRequest("Không có");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("save-new")
    public ResponseEntity<JsonResult> saveNew(@RequestBody PhieuMuaPm phieuMuaPm) {
        try {
            phieuMuaPm.setNgayTao(LocalDate.now());


            return JsonResult.success(phieuMuaPmRepository.save(phieuMuaPm));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("deleted/{idPhieuMua}")
    public ResponseEntity<JsonResult> update(@PathVariable("idPhieuMua") Integer idPhieuMua) {
        try {
            PhieuMuaPm phieuMuaPm = phieuMuaPmRepository.findById(idPhieuMua).get();
            phieuMuaPm.setDeleted(true);
            return JsonResult.success(phieuMuaPmRepository.save(phieuMuaPm));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

}
