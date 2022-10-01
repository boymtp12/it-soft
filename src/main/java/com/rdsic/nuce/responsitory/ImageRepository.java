package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.other.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface ImageRepository extends JpaRepository<Image, Integer>, JpaSpecificationExecutor<Image> {
    Image findByIdimageAndStatusTrue(int id);

    List<Image> findByStatusTrue();

    Image findByName(String name);

    List<Image> findByFolderImage_ValueAndStatusTrue(String value);
}