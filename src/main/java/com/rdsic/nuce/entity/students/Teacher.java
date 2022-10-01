package com.rdsic.nuce.entity.students;

import lombok.Data;
import org.apache.tomcat.jni.Local;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;

@Entity
@Table(name = "teacher")
@Data
public class Teacher implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "date_of_birth", nullable = false)
    private Date dateOfBirth;

    /**
     * Chức vụ trong công ty
     */
    @Column(name = "regency", nullable = false, columnDefinition = "MEDIUMTEXT")
    private String regency;

    @Column(name = "add_of_birth", nullable = false)
    private String addOfBirth;
    @Column(name = "deleted", nullable = false)
    private Boolean deteted;
    /**
     * thong tin cua giang vien
     */
    @Column(name = "profile", nullable = false, columnDefinition = "MEDIUMTEXT")
    private String profile;

    @Column(name = "address", nullable = false)
    private String address;

    @Column(name = "image_src", nullable = false)
    private String imageSrc;

    @Column(name = "create_date", nullable = false)
    private LocalDate createDate;

    @Column(name = "image_slide", nullable = false)
    private String imageSlide;
}
