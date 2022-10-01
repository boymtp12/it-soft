package com.rdsic.nuce.service;

import com.rdsic.nuce.entity.other.Image;

import java.util.List;

public interface ImageService {
    Image findById(int id);

    Image findByName(String name);

    List<Image> findAll();

    List<Image> findByFolderImage_ValueAndStatusTrue(String value);

    boolean save(Image image);

    boolean deleted(Image image);
}
