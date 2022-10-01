package com.rdsic.nuce.controller;

import com.rdsic.nuce.entity.phanmem.PhanMem;
import com.rdsic.nuce.entity.json.JsonResult;
import com.rdsic.nuce.entity.user.User;
import com.rdsic.nuce.responsitory.PhanMemRepository;
import com.rdsic.nuce.responsitory.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("api/v1/public/phan-mem/")
public class PhanMemController {
    @Autowired
    private PhanMemRepository phanMemRepository;
    @Autowired
    private UserRepository userRepository;

    @GetMapping("find-all")
    public ResponseEntity<JsonResult> findByAndDeletedFalse() {
        try {
            List<PhanMem> list = phanMemRepository.findByAndDeletedFalseOrderByIdDesc();
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
            PhanMem phanMem = phanMemRepository.findById(id).get();
            if (phanMem != null) {
                return JsonResult.success(phanMem);
            } else {
                return JsonResult.badRequest("Không có");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-like-ten/{ten}")
    public ResponseEntity<JsonResult> findByLikeTen(@PathVariable("ten") String ten) {
        try {
            List<PhanMem> phanMem = phanMemRepository.findByTenLike("%" + ten + "%");
            if (phanMem != null) {
                return JsonResult.success(phanMem);
            } else {
                return JsonResult.badRequest("Không có");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("save-new/{idUser}")
    public ResponseEntity<JsonResult> saveNew(@PathVariable("idUser") Integer idNhanVien,
                                              @RequestBody PhanMem phanMem) {
        try {
            User user = userRepository.findById(idNhanVien).get();
            phanMem.setDeleted(false);
            phanMem.setUserId(user);
            phanMem.setNgayTao(LocalDate.now());
            return JsonResult.success(phanMemRepository.save(phanMem));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("update/{idUser}")
    public ResponseEntity<JsonResult> update(@PathVariable("idUser") Integer idNhanVien,
                                             @RequestBody PhanMem phanMem) {
        try {
            phanMem.setDeleted(false);
            User user = userRepository.findById(idNhanVien).get();
            phanMem.setNgayTao(LocalDate.now());
            phanMem.setUserId(user);
            return JsonResult.success(phanMemRepository.save(phanMem));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("deleted/{idPhanMem}")
    public ResponseEntity<JsonResult> update(@PathVariable("idPhanMem") Integer idPhanMem) {
        try {
            PhanMem phanMem = phanMemRepository.findById(idPhanMem).get();
            phanMem.setDeleted(true);
            return JsonResult.success(phanMemRepository.save(phanMem));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

}
