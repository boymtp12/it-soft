package com.rdsic.nuce.entity.course;

import com.rdsic.nuce.entity.company.AddressCompany;
import com.rdsic.nuce.key.AddrCompanyCourseKey;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;

@Entity
@Table(name = "address_company_has_course")
@Data
@Accessors(chain = true)
public class AddressCompanyHasCourse implements Serializable {

    private static final long serialVersionUID = 1L;

    @EmbeddedId
    private AddrCompanyCourseKey id;

    @ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    @MapsId("course_id") // tên của khóa ngoại trong embeddedId
    @JoinColumn(name = "id_course")// khóa ngoại trong db
    private Course course;

    @ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    @MapsId("addr_id") // tên của khóa ngoại trong embeddedId
    @JoinColumn(name = "id_addr")// khóa ngoại
    private AddressCompany addressCompany;

    /**
     * ngày khai giảng
     */
    @Column(name = "openning_day", nullable = false)
    private LocalDate openningDay;

    /**
     * thời gian học
     */
    @Column(name = "study_time", nullable = false)
    private String studyTime;
    @Column(name = "code_study", nullable = false)
    private String codeStudy;
    @Column(name = "deleted", nullable = false)
    private Boolean deleted;
}
