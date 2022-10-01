package com.rdsic.nuce.service_impl;

import com.rdsic.nuce.entity.other.Image;
import com.rdsic.nuce.responsitory.ImageRepository;
import com.rdsic.nuce.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class ImageService_Impl implements ImageService {
    private static final Logger LOGGER = Logger.getLogger(ImageService_Impl.class.getName());
    @Autowired
    private ImageRepository ImageRepo;

    @Override
    public Image findById(int id) {
        try {
            return ImageRepo.findByIdimageAndStatusTrue(id);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-by-id-error: {0}", e.getMessage());
            return null;
        }
    }

    @Override
    public Image findByName(String name) {
        try {
            return ImageRepo.findByName(name);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-by-name-error: {0}", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Image> findAll() {
        try {
            return ImageRepo.findByStatusTrue();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-by-all-error: {0}", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Image>  findByFolderImage_ValueAndStatusTrue(String value) {
        try {
            return ImageRepo.findByFolderImage_ValueAndStatusTrue(value);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-by-value-error: {0}", e.getMessage());
            return null;
        }
    }


    @Override
    public boolean save(Image image) {
        try {
            ImageRepo.save(image);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "save-error: {0}", e.getMessage());
            return false;
        }
    }

    @Override
    public boolean deleted(Image image) {
        try {
            System.out.println(image);
            image.setStatus(false);
            System.out.println(image);
            ImageRepo.save(image);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "save-error: {0}", e.getMessage());
            return false;
        }
    }
}
