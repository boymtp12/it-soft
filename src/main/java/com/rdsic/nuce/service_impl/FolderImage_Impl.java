package com.rdsic.nuce.service_impl;

import com.rdsic.nuce.entity.other.FolderImage;
import com.rdsic.nuce.responsitory.FolderImageRepository;
import com.rdsic.nuce.service.FolderImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
@Service
public class FolderImage_Impl implements FolderImageService {

    private static final Logger LOGGER = Logger.getLogger(FolderImage_Impl.class.getName());
    @Autowired
    private FolderImageRepository folderImageRepository;
    @Override
    public List<FolderImage> findByDeletedTrue() {
        try {
            return folderImageRepository.findByDeletedTrue();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public FolderImage findByValueAndDeletedTrue(String value) {
        try {
            return folderImageRepository.findByValueAndDeletedTrue(value);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByAll error", e.getMessage());
            return null;
        }
    }

    @Override
    public Boolean save(FolderImage folderImage) {
        try {
            folderImageRepository.save(folderImage);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByAll error", e.getMessage());
            return false;
        }
    }

    @Override
    public Boolean deleted(FolderImage folderImage) {
        try {
            folderImage.setDeleted(false);
            folderImageRepository.save(folderImage);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "findByAll error", e.getMessage());
            return false;
        }
    }
}
