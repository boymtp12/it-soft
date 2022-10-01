package com.rdsic.nuce.controller;

import com.rdsic.nuce.entity.FormLogin;
import com.rdsic.nuce.entity.user.User;
import com.rdsic.nuce.entity.json.JsonResult;
import com.rdsic.nuce.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("api/v1/public/user")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/find-by-id/{id}")
    public ResponseEntity<JsonResult> findById(@PathVariable("id") int id) {
        try {
            User user = userService.findById(id);
            if (user != null)
                return JsonResult.success(user);
            else return JsonResult.badRequest("Không tồn tại tài khoản");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @GetMapping("/find-all")
    public ResponseEntity<JsonResult> findAll() {
        try {
            List<User> list = userService.findAll();
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không tồn tại tài khoản");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("/login")
    public ResponseEntity<JsonResult> login(@RequestBody FormLogin formLogin) {
        System.out.println(formLogin);
        if (formLogin.getEmail() !=null && formLogin.getPassword()!=null){
            try {
                User user = userService.findByUserAndPass(formLogin);
                if (user != null) {
                    return JsonResult.success(user);
                } else {
                    return JsonResult.badRequest("Tài khoản mật khẩu không đúng");
                }
            } catch (Exception e) {
                return JsonResult.error(e);
            }
        }else {
            return JsonResult.badRequest("Thieu thong tin");
        }
    }
    @PostMapping("/sign")
    public ResponseEntity<JsonResult> sign(@RequestBody User user){
        Boolean user1 = userService.save(user);
        System.out.println(user1);
        try {
            System.out.println(user1);
            if (user1 ==true) {
                return JsonResult.success(user);
            } else {
                return JsonResult.badRequest("Lưu thất bại");
            }
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
}
