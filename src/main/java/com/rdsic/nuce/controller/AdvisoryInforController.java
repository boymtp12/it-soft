package com.rdsic.nuce.controller;

import com.rdsic.nuce.entity.json.JsonResult;
import com.rdsic.nuce.entity.students.AdvisoryInfor;
import com.rdsic.nuce.service.AddressConpanyService;
import com.rdsic.nuce.service.AdvisoryInforService;
import com.rdsic.nuce.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/public/advisory-infor")
public class AdvisoryInforController {
    @Autowired
    private AdvisoryInforService advisoryInforService;
    @Autowired
    private AddressConpanyService addressConpanyService;
    @Autowired
    private CourseService courseService;

    @GetMapping("/find-by-id/{id}")
    public ResponseEntity<JsonResult> findById(@PathVariable("id") int id) {

        try {
            AdvisoryInfor advisoryInfor = advisoryInforService.findById(id);
            if (advisoryInfor != null)
                return JsonResult.success(advisoryInfor);
            else return JsonResult.badRequest("Không có thông tin khách hàng");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-all")
    public ResponseEntity<JsonResult> findAll() {
        try {
            List<AdvisoryInfor> advisoryInfor = advisoryInforService.findAll();
            if (advisoryInfor != null)
                return JsonResult.success(advisoryInfor);
            else return JsonResult.badRequest("Không có thông tin khách hàng");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-by-phone")
    public ResponseEntity<JsonResult> findById(@RequestParam("phone") String phone) {
        try {
            AdvisoryInfor advisoryInfor = advisoryInforService.findByPhoneNumber(phone);
            if (advisoryInfor != null)
                return JsonResult.success(advisoryInfor);
            else return JsonResult.badRequest("Không có thông tin khách hàng");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("/find-by-name")
    public ResponseEntity<JsonResult> findNameStudent(@RequestParam("name") String name) {
        try {
            AdvisoryInfor advisoryInfor = advisoryInforService.findByNameStudent(name);
            if (advisoryInfor != null)
                return JsonResult.success(advisoryInfor);
            else return JsonResult.badRequest("Không có thông tin khách hàng");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("/save/{idCompany}/{idCourse}")
    public ResponseEntity<JsonResult> save(@RequestBody AdvisoryInfor advisoryInfor,
                                           @PathVariable("idCompany") int idCompany,
                                           @PathVariable("idCourse") int idCourse) {
        System.out.println(addressConpanyService.findByIdAndDeletedTrue(idCompany));
        System.out.println(courseService.findByIdAndDeletedTrue(idCourse));
        advisoryInfor.setIdAddressCompany(addressConpanyService.findByIdAndDeletedTrue(idCompany)) ;
        advisoryInfor.setIdCourse(courseService.findByIdAndDeletedTrue(idCourse));
        try {
            Boolean advisoryInfor1 = advisoryInforService.save(advisoryInfor);
            if (advisoryInfor1)
                return JsonResult.success(advisoryInfor);
            else return JsonResult.badRequest("Không có thông tin khách hàng");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("/deleted/{idCompany}/{idCourse}")
    public ResponseEntity<JsonResult> deleted(@RequestBody AdvisoryInfor advisoryInfor,
                                              @PathVariable("idCompany") int idCompany,
                                              @PathVariable("idCourse") int idCourse) {
        advisoryInfor.setIdAddressCompany(addressConpanyService.findByIdAndDeletedTrue(idCompany)) ;
        advisoryInfor.setIdCourse(courseService.findByIdAndDeletedTrue(idCourse));
        try {
            Boolean advisoryInfor1 = advisoryInforService.deleted(advisoryInfor);
            if (advisoryInfor1)
                return JsonResult.success(advisoryInfor);
            else return JsonResult.badRequest("Không có thông tin khách hàng");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

}
