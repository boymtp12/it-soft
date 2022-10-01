package com.rdsic.nuce.service;

import com.rdsic.nuce.entity.other.FolderImage;
import com.rdsic.nuce.responsitory.FolderImageRepository;

import java.util.List;

public interface FolderImageService {
    List<FolderImage> findByDeletedTrue();
    FolderImage findByValueAndDeletedTrue(String value);
    Boolean save(FolderImage folderImage);
    Boolean deleted(FolderImage folderImage);
}
