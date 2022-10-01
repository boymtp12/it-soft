package com.rdsic.nuce.service_impl;

import com.rdsic.nuce.entity.FormLogin;
import com.rdsic.nuce.entity.user.User;
import com.rdsic.nuce.responsitory.UserRepository;
import com.rdsic.nuce.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class UserService_Impl implements UserService {
    private static final Logger LOGGER = Logger.getLogger(StudentService_Impl.class.getName());

    @Autowired
    private UserRepository userRepository;

    @Override
    public User findByUserAndPass(FormLogin formLogin) {
        try {
            return userRepository.findByEmailAndPassword(formLogin.getEmail(), formLogin.getPassword());
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByUser error", e.getMessage());
            return null;
        }
    }

    @Override
    public User findById(int id) {
        try {
            return userRepository.findByIdAndDeletedTrue(id);

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findById error", e.getMessage());
            return null;
        }
    }

    @Override
    public List<User> findAll() {
        try {
            return userRepository.findByDeletedTrue();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public boolean save(User user) {
        try {
            userRepository.save(user);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Save error", e.getMessage());
            return false;
        }
    }

    @Override
    public boolean deleted(User user) {
        user.setDeleted(false);
        try {
            userRepository.save(user);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Save error", e.getMessage());
            return false;
        }
    }
}
