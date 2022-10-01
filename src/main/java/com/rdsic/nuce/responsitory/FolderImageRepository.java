package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.other.FolderImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface FolderImageRepository extends JpaRepository<FolderImage, String>, JpaSpecificationExecutor<FolderImage> {
    List<FolderImage> findByDeletedTrue();
    FolderImage findByValueAndDeletedTrue(String value);
}