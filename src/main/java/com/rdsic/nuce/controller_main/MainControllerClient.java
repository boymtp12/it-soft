package com.rdsic.nuce.controller_main;


import io.swagger.models.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

@Controller
public class MainControllerClient {
    @RequestMapping(value = {"", "home"}, method = RequestMethod.GET)
    public String home(Model model) {
        return "trang-chu";
    }

    @RequestMapping(value = {"giangvien"}, method = RequestMethod.GET)
    public String giangvien(Model model) {
        return "giangvien";
    }

    @RequestMapping(value = {"xemthem"}, method = RequestMethod.GET)
    public String xemthem(Model model) {
        return "xemthem";
    }

    @RequestMapping(value = {"tintuc_java"}, method = RequestMethod.GET)
    public String tintuc_java(Model model) {
        return "tintuc_java";
    }

    @RequestMapping(value = {"tintuc"}, method = RequestMethod.GET)
    public String tintuc1(Model model, HttpServletRequest httpServletRequest) {
        return "tintuc";
    }

    @RequestMapping(value = {"detail-topic/*/*"}, method = RequestMethod.GET)
    public String tintuc(Model model) {
        return "tintuc_java";
    }

    @RequestMapping(value = {"khoa-hoc-spec/13/android-tutorial"}, method = RequestMethod.GET)
    public String reactnative(Model model) {
        return "react-native";
    }

    @RequestMapping(value = {"khoa-hoc-spec/21/khoa-hoc-lap-trinh-c-sharp"}, method = RequestMethod.GET)
    public String khoaHocC(Model model) {
        return "khoa-hoc-c#";
    }

    @RequestMapping(value = {"khoa-hoc-spec/24/khoa-hoc-c-sharp-nang-cao"}, method = RequestMethod.GET)
    public String khoaHocCNangCao(Model model) {
        return "khoa-hoc-c#-nang-cao";
    }

    @RequestMapping(value = {"khoa-hoc-spec/25/khoa-hoc-java-co-ban"}, method = RequestMethod.GET)
    public String khoaHocJavaCoBan(Model model) { return "khoa-hoc-java-co-ban"; }

    @RequestMapping(value = {"phanmem-xemthem"}, method = RequestMethod.GET)
    public String phanmem_xemthem(Model model) { return "phanmem-xemthem"; }
    @RequestMapping(value = {"chi-tiet-phan-mem/*"}, method = RequestMethod.GET)
    public String chiTietPhanMem(Model model) { return "chi-tiet-phan-mem"; }

    @RequestMapping(value = {"cart"}, method = RequestMethod.GET)
    public String cart_phanmem(Model model) { return "cart"; }

    @RequestMapping(value = {"detail-something"}, method = RequestMethod.GET)
    public String detail_something(Model model) { return "detail-something"; }


    @RequestMapping(value = {"khoa-hoc-spec/*/*"}, method = RequestMethod.GET)
    public String course(Model model) {
        String message = "Hello Spring Boot + JSP";

//        model.setDescription("message", message);
        return "course";
    }
}
