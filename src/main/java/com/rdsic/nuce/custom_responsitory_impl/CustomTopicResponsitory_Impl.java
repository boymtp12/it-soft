package com.rdsic.nuce.custom_responsitory_impl;

import com.rdsic.nuce.custom_reponsitory.CustomTopicResponsitory;
import com.rdsic.nuce.entity.course.Course;
import com.rdsic.nuce.entity.topic.Topic;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
public class CustomTopicResponsitory_Impl implements CustomTopicResponsitory {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Topic> findByTopicLimit(int limit) {
        return entityManager.createQuery("select topic from Topic topic where topic.deleted=true order by topic.id DESC ")
                .setMaxResults(limit).getResultList();
    }

    @Override
    public Specification<Topic> findByTitleLike(String title) {
//        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
//        CriteriaQuery<Topic> query = builder.createQuery(Topic.class);
//        Root<Topic> root = query.from(Topic.class);
//
//        Predicate predicateDeleted = builder.equal(root.get("deleted"),true);
//        Predicate predicate = builder.like(root.get("title"),"%"+title+"%");
//        Predicate finalPredicate = builder.and(predicateDeleted, predicate);
//
//        return query.select(root).where(finalPredicate);
        return (root, criteriaQuery, criteriaBuilder) -> criteriaBuilder.like(root.get("name"), '%' + title + '%');
    }

    @Override
    public List<Topic> findByCourseIdOfTopic(int id) {
        return entityManager.createQuery("select new com.rdsic.nuce.entity.topic.Topic(topic.id,topic.title,topic.createDate,topic.introduct,topic.imageSrc,topic.viewUrl) from Topic topic where topic.deleted=true and topic.idCourse.id=?1 order by topic.id DESC ")
               .setParameter(1,id).getResultList();
    }

    @Override
    public List<Topic> findByNameImageSubContentCreateDateLimit(int limit) {
        return entityManager.createQuery("select new com.rdsic.nuce.entity.topic.Topic(topic.id,topic.title,topic.createDate,topic.introduct,topic.imageSrc,topic.viewUrl) from Topic topic where topic.deleted=true order by topic.id DESC ")
                .setMaxResults(limit).getResultList();
    }
    @Override
    public List<Topic> findByNameImageSubContentCreateDate() {
//        return entityManager.createQuery("select topic.title,topic.imageSrc,topic.introduct,topic.createDate from Topic topic where topic.deleted=true order by topic.id DESC ").getResultList();
   return entityManager
           .createQuery("select new com.rdsic.nuce.entity.topic.Topic(topic.id,topic.title,topic.createDate,topic.introduct,topic.imageSrc,topic.viewUrl) from Topic topic where topic.deleted=true order by topic.id DESC")
           .getResultList();
    }
}
