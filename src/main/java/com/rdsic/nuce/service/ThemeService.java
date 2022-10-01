package com.rdsic.nuce.service;

import com.rdsic.nuce.entity.course.Theme;
import com.rdsic.nuce.responsitory.ThemeRepository;

import java.util.List;

public interface ThemeService {
    List<Theme> findByDeletedTrue();
    Theme findByNameAndDeletedTrue(String name);
    Theme findByIdAndDeletedTrue(int id);
    Boolean save(Theme theme);
    Boolean deleted(Theme theme);
}
