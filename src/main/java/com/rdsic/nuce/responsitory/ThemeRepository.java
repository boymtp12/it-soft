package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.course.Theme;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface ThemeRepository extends JpaRepository<Theme, Integer>, JpaSpecificationExecutor<Theme> {
    List<Theme> findByDeletedTrue();
    Theme findByNameAndDeletedTrue(String name);
    Theme findByIdAndDeletedTrue(int id);
}