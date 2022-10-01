package com.rdsic.nuce.entity.course;

import com.rdsic.nuce.entity.category.SmallCategory;
import com.rdsic.nuce.entity.students.Teacher;
import com.rdsic.nuce.entity.user.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "course")
public class Course implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    /**
     * ten
     */
    @Column(name = "name", nullable = false)
    private String name;

    /**
     * giá sinh viên
     */
    @Column(name = "student_fees", nullable = false)
    private Double studentFees;

    /**
     * giá sau khi đã giảm = student_fees - student_fees / x%
     */
    @Column(name = "tuition_fee_after_reduction", nullable = false)
    private Double tuitionFeeAfterReduction;

    /**
     * anh dai dien khoa hoc
     */
    @Column(name = "image", nullable = false)
    private String image;


    @Column(name = "deleted", nullable = false)
    private Boolean deleted;


    /**
     * url view tương ứng với khóa học ( để dạng html cho dễ)
     */
    @Column(name = "url_view", nullable = false)
    private String urlView;

    /**
     * đối tượng hướng đến
     */
    @Column(name = "obj_students", nullable = false)
    private String objStudents;


    /**
     * Dang giam gia hay k giam
     */
    @Column(name = "promotion", nullable = false)
    private Boolean promotion;

    @Column(name = "sub_content", nullable = false)
    private String subContent;

    @Column(name = "create_date", nullable = false)
    private LocalDate createDate;

    @Column(name = "opening_day", nullable = false)
    private String openingDay;

    @Column(name = "study_time", nullable = false)
    private String studyTime;
    /**
     * do tuoi hoc sinh
     */
    @Column(name = "age", nullable = false)
    private String age;

    /**
     * so hoc sinh 1 lop
     */
    @Column(name = "number_of_student", nullable = false)
    private Integer numberOfStudent;


    /**
     * nội dung chính
     */
    @Column(name = "main_content", nullable = false, columnDefinition = "MEDIUMTEXT")
    private String mainContent;

    /**
     * Thời lượng học của 1 khóa
     */
    @Column(name = "duration_of_study", nullable = false)
    private String durationOfStudy;

    /**
     * Học phần
     */
    @Column(name = "section", nullable = false)
    private String section;
    @Column(name = "meta_title", nullable = false)
    private String metaTitle;
    @Column(name = "meta_description", nullable = false, columnDefinition = "MEDIUMTEXT")
    private String metaDescription;
    @Column(name = "meta_keyword", nullable = false)
    private String metaKeyword;
    @Column(name = "meta_robot", nullable = false)
    private String metaRobot;
    @Column(name = "percent_of_promotion", nullable = false)
    private Integer percentOfPromotion;
    //    true là khóa học cho trẻ em, false là khóa học cho sinh viên
    @Column(name = "classify", nullable = false)
    private Boolean classify;


    /**
     * Tài liệu của môn học
     */
    @Column(name = "document", nullable = false)
    private String document;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "id_small_category")
    private SmallCategory idSmallCategory;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "id_user")
    private User idUser;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "theme_id")
    private Theme idTheme;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "teacher_id")
    private Teacher idTeacher;

    public Course(Integer id, String name, Double studentFees, String image, String urlView, Boolean promotion, String subContent, LocalDate createDate, Integer percentOfPromotion, Double tuitionFeeAfterReduction) {
        this.id = id;
        this.name = name;
        this.studentFees = studentFees;
        this.image = image;
        this.urlView = urlView;
        this.promotion = promotion;
        this.subContent = subContent;
        this.createDate = createDate;
        this.percentOfPromotion = percentOfPromotion;
        this.tuitionFeeAfterReduction = tuitionFeeAfterReduction;
    }

    public Course(Integer id, String name, Double tuitionFeeAfterReduction, String urlView) {
        this.id = id;
        this.name = name;
        this.tuitionFeeAfterReduction = tuitionFeeAfterReduction;
        this.urlView = urlView;
    }

    public Course(Integer id, String name, String urlView, LocalDate createDate) {
        this.id = id;
        this.name = name;
        this.urlView = urlView;
        this.createDate = createDate;
    }

    public Course(Integer id, String name, String image, String urlView, String metaTitle, String metaDescription, String metaKeyword, String metaRobot) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.urlView = urlView;
        this.metaTitle = metaTitle;
        this.metaDescription = metaDescription;
        this.metaKeyword = metaKeyword;
        this.metaRobot = metaRobot;
    }
}
