package com.rdsic.nuce.service_impl;

import com.rdsic.nuce.entity.course.Theme;
import com.rdsic.nuce.responsitory.ThemeRepository;
import com.rdsic.nuce.service.ThemeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class ThemeService_Impl implements ThemeService {
    private static final Logger LOGGER = Logger.getLogger(CourseService_Impl.class.getName());
    @Autowired
    private ThemeRepository themeRepository;

    @Override
    public List<Theme> findByDeletedTrue() {
        try {
            return themeRepository.findByDeletedTrue();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public Theme findByNameAndDeletedTrue(String name) {
        try {
            return themeRepository.findByNameAndDeletedTrue(name);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByName error", e.getMessage());
            return null;
        }
    }

    @Override
    public Theme findByIdAndDeletedTrue(int id) {
        try {
            return themeRepository.findByIdAndDeletedTrue(id);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findById error", e.getMessage());
            return null;
        }
    }

    @Override
    public Boolean save(Theme theme) {
        try {
             themeRepository.save(theme);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "save error", e.getMessage());
            return false;
        }
    }

    @Override
    public Boolean deleted(Theme theme) {
        try {
            theme.setDeleted(false);
            themeRepository.save(theme);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "deleted error", e.getMessage());
            return false;
        }
    }
}
