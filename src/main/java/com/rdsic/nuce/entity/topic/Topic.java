package com.rdsic.nuce.entity.topic;

import com.rdsic.nuce.entity.course.Course;
import com.rdsic.nuce.entity.user.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.hibernate.type.LongType;
import org.hibernate.type.descriptor.sql.LongVarcharTypeDescriptor;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

@Entity
@Data
@Accessors(chain = true)
@NoArgsConstructor
@Table(name = "topic")
public class Topic implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "title", nullable = false)
    private String title;

    @Column(name = "create_date", nullable = false)
    private LocalDate createDate;

    /**
     * lời giới thiệu
     */
    @Column(name = "introduct", nullable = false,columnDefinition = "MEDIUMTEXT")
    private String introduct;

    /**
     * nội dung bài viết
     */
    @Column(name="content",nullable = false,columnDefinition = "MEDIUMTEXT")
    private String content;

    /**
     * số lượt xem
     */
    @Column(name = "view", nullable = false)
    private Double view;

    @Column(name = "meta_html", nullable = false,columnDefinition = "MEDIUMTEXT")
    private String metaHtml;

    @ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    @JoinColumn(name = "id_user")
    private User idUser;

    @Column(name = "deleted", nullable = false)
    private Boolean deleted;

    @Column(name = "image_src", nullable = false)
    private String imageSrc;

    @ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    @JoinColumn(name = "course_id")
    private Course idCourse;

    @Column(name = "view_url", nullable = false)
    private String viewUrl;

    @Column(name = "meta_title", nullable = false)
    private String metaTitle;
    @Column(name = "meta_description", nullable = false,columnDefinition = "MEDIUMTEXT")
    private String metaDescription;
    @Column(name = "meta_keyword", nullable = false)
    private String metaKeyword;
    @Column(name = "meta_robot", nullable = false)
    private String metaRobot;


    public Topic(Integer id, String title, LocalDate createDate, String introduct, String content, Double view, String metaHtml, User idUser, Boolean deleted, String imageSrc, Course idCourse, String viewUrl, String metaTitle, String metaDescription, String metaKeyword, String metaRobot) {
        this.id = id;
        this.title = title;
        this.createDate = createDate;
        this.introduct = introduct;
        this.content = content;
        this.view = view;
        this.metaHtml = metaHtml;
        this.idUser = idUser;
        this.deleted = deleted;
        this.imageSrc = imageSrc;
        this.idCourse = idCourse;
        this.viewUrl = viewUrl;
        this.metaTitle = metaTitle;
        this.metaDescription = metaDescription;
        this.metaKeyword = metaKeyword;
        this.metaRobot = metaRobot;
    }

    public Topic(Integer id, String title, LocalDate createDate, String introduct, String imageSrc, String viewUrl) {
        this.id = id;
        this.title = title;
        this.createDate = createDate;
        this.introduct = introduct;
        this.imageSrc = imageSrc;
        this.viewUrl = viewUrl;
    }

}
