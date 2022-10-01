package com.rdsic.nuce.controller_main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainControllerAdmin {
    @RequestMapping(value = {"admin", "admin-home"}, method = RequestMethod.GET)
    public String home(Model model) {
        return "admin-trang-chu";
    }

    @RequestMapping(value = {"admin-login"}, method = RequestMethod.GET)
    public String login(Model model) {
        return "admin-dang-nhap";
    }


    @RequestMapping(value = {"admin-list-student"}, method = RequestMethod.GET)
    public String listStudent(Model model) {
        return "admin-list-student";
    }

    @RequestMapping(value = {"admin-detail-student"}, method = RequestMethod.GET)
    public String detailStudent(Model model) {
        return "admin-detail-student";
    }

    @RequestMapping(value = {"admin-topic"}, method = RequestMethod.GET)
    public String addTopic(Model model) {
        return "admin-topic";
    }

    @RequestMapping(value = {"admin-upload-file"}, method = RequestMethod.GET)
    public String upLoadFile(Model model) {
        return "admin-upload-file";
    }

    @RequestMapping(value = {"admin-advisory-infor"}, method = RequestMethod.GET)
    public String advisoryInfor(Model model) {
        return "admin-advisory-infor";
    }

    @RequestMapping(value = {"admin-teacher"}, method = RequestMethod.GET)
    public String adminTeacher(Model model) {
        return "admin-teacher";
    }

    @RequestMapping(value = {"admin-phan-mem"}, method = RequestMethod.GET)
    public String adminPhanMem(Model model) {
        return "admin-phan-mem";
    }

    @RequestMapping(value = {"phieumua-admin"}, method = RequestMethod.GET)
    public String phieumuaAdmin(Model model) {
        return "phieumua-admin";
    }

    @RequestMapping(value = {"admin-course"}, method = RequestMethod.GET)
    public String adminCourse(Model model) {
        return "admin-course";
    }

    @RequestMapping(value = {"admin-course-college-student"}, method = RequestMethod.GET)
    public String adminAddCourseCollegeStudent(Model model) {
        return "admin-add-course-college-student";
    }
}
