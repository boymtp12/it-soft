package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.user.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Integer>, JpaSpecificationExecutor<User> {
    User findByEmailAndPassword(String email, String password);

    User findByIdAndDeletedTrue(int id);

    List<User> findByDeletedTrue();

}