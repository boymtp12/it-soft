package com.rdsic.nuce.entity.students;

import com.rdsic.nuce.entity.company.AddressCompany;
import com.rdsic.nuce.entity.course.Course;
import com.rdsic.nuce.entity.user.User;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;

@Entity
@Table(name = "advisory_infor")
@Data
@Accessors(chain = true)
public class AdvisoryInfor implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * bang nhan thong tin yeu cau tu van cua phu huynh
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    /**
     * ten phu huynh can tu van
     */
    @Column(name = "name_parents", nullable = false)
    private String nameParents;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "phone_number", nullable = false)
    private String phoneNumber;

    /**
     * ten hoc sinh
     */
    @Column(name = "name_student", nullable = false)
    private String nameStudent;

    @Column(name = "date_of_birth_student", nullable = false)
    private LocalDate dateOfBirthStudent;

    @ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    @JoinColumn(name = "id_course", nullable = false)
    private Course idCourse;

    @ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    @JoinColumn(name = "id_address_company", nullable = false)
    private AddressCompany idAddressCompany;

    @Column(name = "deleted",nullable = false)
    private Boolean deleted;

    @Column(name = "check_advi",nullable = false)
    private Boolean checkAdvisory;
}
