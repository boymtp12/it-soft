package com.rdsic.nuce.custom_responsitory_impl;

import com.rdsic.nuce.custom_reponsitory.CustomCourseResponsitory;
import com.rdsic.nuce.entity.course.Course;
import lombok.Data;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;
import java.util.List;

@Repository
public class CustomCourseResponsitory_Impl implements CustomCourseResponsitory {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Course> findByDeletedTrueAnhLimit(int limit) {
        return entityManager.createQuery("select course from Course course where course.deleted=true ")
                .setMaxResults(limit).getResultList();
    }

    @Override
    public List<Course> findByLimit_GetIdAndNameAndFeesAndImageUrlAndPromotionAndSubContent(int limit) {
        if (limit != 0)
            return entityManager.createQuery("select new com.rdsic.nuce.entity.course.Course(c.id, c.name, c.studentFees, c.image, c.urlView, c.promotion, c.subContent,c.createDate,c.percentOfPromotion,c.tuitionFeeAfterReduction) from Course c where c.deleted=true order by c.id desc ").setMaxResults(limit).getResultList();
        else return entityManager
                .createQuery("select new com.rdsic.nuce.entity.course.Course(c.id, c.name, c.studentFees, c.image, c.urlView, c.promotion, c.subContent,c.createDate,c.percentOfPromotion,c.tuitionFeeAfterReduction) from Course c where c.deleted=true order by c.id desc").getResultList();

    }

    @Override
    public List<Course> findByClassify_GetIdAndNameAndUrlViewAndCreateDate(Boolean classify) {
        return entityManager.createQuery("select new com.rdsic.nuce.entity.course.Course(c.id,c.name,c.urlView,c.createDate) from Course c where c.deleted=true and c.classify=?1 order by c.id desc")
                .setParameter(1,classify).getResultList();
    }

    @Override
    public Course findByIdGetIdAndNameAndTuitionFeeAndUrlView(int id) {
        return (Course) entityManager.createQuery("select new com.rdsic.nuce.entity.course.Course(c.id,c.name,c.tuitionFeeAfterReduction,c.urlView) from Course c where c.deleted=true and c.id= ?1 ")
                .setParameter(1, id).getSingleResult();
    }

    @Override
    public Course findByIdGetIdAndNameAndImageAndUrlViewAndAllMeta(int id) {
        System.out.println(id);
        return (Course) entityManager.createQuery("select new com.rdsic.nuce.entity.course.Course(c.id,c.name,c.image,c.urlView,c.metaTitle,c.metaDescription,c.metaKeyword,c.metaRobot) from Course c where c.deleted=true and c.id= ?1 ")
                .setParameter(1, id).getSingleResult();
    }

}
