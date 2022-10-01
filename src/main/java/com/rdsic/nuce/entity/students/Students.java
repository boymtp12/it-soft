package com.rdsic.nuce.entity.students;

import com.rdsic.nuce.entity.company.AddressCompany;
import com.rdsic.nuce.entity.user.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;

@Entity
@Table(name = "students")
@Data
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
public class Students implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "phone_number", nullable = false)
    private String phoneNumber;

    @Column(name = "full_name", nullable = false)
    private String fullName;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "address", nullable = false)
    private String address;

    @Column(name = "date_of_birth", nullable = false)
    private LocalDate dateOfBirth;

    @Column(name = "addr_of_birth", nullable = false)
    private String addrOfBirth;

    /**
     * công việc hiện tại
     */
    @Column(name = "job_current", nullable = false)
    private String jobCurrent;

    /**
     * tên trường
     */
    @Column(name = "name_school", nullable = false)
    private String nameSchool;

    /**
     * tên khoa
     */
    @Column(name = "faculty_school", nullable = false)
    private String facultySchool;

    /**
     * nhan chung chi tai dau, yes: tai trung tam, no: gui chuyen phat nhanh ve nha
     */
    @Column(name = "take_certification", nullable = false)
    private Boolean takeCertification;

    @Column(name = "deleted", nullable = false)
    private Boolean deleted;

    @Column(name = "status_call")
    private boolean statusCall;

    @Column(name = "code_private", nullable = false)
    private String codePrivate;

    @Column(name = "code_gt", nullable = false)
    private String codeGt;

    @Column(name = "user_id_num", nullable = false)
    private int userIdNum;
    @Column(name = "group_student_id_num", nullable = false)
    private int groupStudentIdNum;
    @Column(name = "course_id_num", nullable = false)
    private int courseIdNum;

    @Column(name = "signin_date", nullable = false)
    private LocalDate signinDate;

    @Column(name = "tuition_fee_of_student", nullable = false)
    private double tuitionFeeOfStudent;

    @Column(name = "check_old_student", nullable = false)
    private boolean checkOldStudent;

    @Column(name = "sex")
    private boolean sex;
    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "id_address", nullable = false)
    private AddressCompany addressCompany;
    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    private User idUser;
    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "group_student_id")
    private GroupStudent idGroupStudent;

    public Students(Integer id, String fullName, String codeGt) {
        this.id = id;
        this.fullName = fullName;
        this.codeGt = codeGt;
    }

    public Students(Integer id, String phoneNumber, String fullName, String email, String address, LocalDate dateOfBirth, String addrOfBirth, String jobCurrent, String nameSchool, String facultySchool, Boolean takeCertification,  String codePrivate, String codeGt, int userIdNum, int groupStudentIdNum, int courseIdNum, LocalDate signinDate, double tuitionFeeOfStudent, boolean checkOldStudent, boolean sex) {
        this.id = id;
        this.phoneNumber = phoneNumber;
        this.fullName = fullName;
        this.email = email;
        this.address = address;
        this.dateOfBirth = dateOfBirth;
        this.addrOfBirth = addrOfBirth;
        this.jobCurrent = jobCurrent;
        this.nameSchool = nameSchool;
        this.facultySchool = facultySchool;
        this.takeCertification = takeCertification;
        this.codePrivate = codePrivate;
        this.codeGt = codeGt;
        this.userIdNum = userIdNum;
        this.groupStudentIdNum = groupStudentIdNum;
        this.courseIdNum = courseIdNum;
        this.signinDate = signinDate;
        this.tuitionFeeOfStudent = tuitionFeeOfStudent;
        this.checkOldStudent = checkOldStudent;
        this.sex = sex;
    }

    public Students(Integer id, String fullName, String codePrivate, String codeGt, int userIdNum, int groupStudentIdNum, int courseId) {
        this.id = id;
        this.fullName = fullName;
        this.codePrivate = codePrivate;
        this.codeGt = codeGt;
        this.userIdNum = userIdNum;
        this.groupStudentIdNum = groupStudentIdNum;
        this.courseIdNum = courseId;
    }
}
