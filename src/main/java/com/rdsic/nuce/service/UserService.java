package com.rdsic.nuce.service;

import com.rdsic.nuce.entity.FormLogin;
import com.rdsic.nuce.entity.user.User;

import java.util.List;
import java.util.Optional;

public interface UserService {
    User findByUserAndPass(FormLogin formLogin);
    User findById(int id);
    List<User> findAll();
    boolean save(User user);
    boolean deleted (User user);
}
