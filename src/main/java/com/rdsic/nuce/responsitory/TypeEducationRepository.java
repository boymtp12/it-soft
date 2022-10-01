package com.rdsic.nuce.responsitory;

import com.rdsic.nuce.entity.course.TypeEducation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface TypeEducationRepository extends JpaRepository<TypeEducation, Integer>, JpaSpecificationExecutor<TypeEducation> {
    List<TypeEducation> findByDeletedTrue();

    TypeEducation findByIdAndDeletedTrue(int id);
}