package com.rdsic.nuce.entity.company;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDate;

@Table(name = "company")
@Entity
@Data
@Accessors(chain = true)
public class Company implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;

    /**
     * số đăng ký doanh nghiệp
     */
    @Column(name = "number_dkdn", nullable = false)
    private String numberDkdn;

    /**
     * ngày cấp
     */
    @Column(name = "date_range", nullable = false)
    private LocalDate dateRange;

    /**
     * nơi cấp
     */
    @Column(name = "noi_cap", nullable = false)
    private String noiCap;

    /**
     * ten nguoi dai dien
     */
    @Column(name = "name_representative", nullable = false)
    private String nameRepresentative;

    @Column(name = "deleted", nullable = false)
    private Boolean deleted;

}
