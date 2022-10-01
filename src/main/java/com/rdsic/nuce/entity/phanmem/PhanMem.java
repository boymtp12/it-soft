package com.rdsic.nuce.entity.phanmem;

import com.rdsic.nuce.entity.user.User;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;

@Data
@Entity
@Table(name = "phan_mem")
public class PhanMem implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "ten", nullable = false)
    private String ten;

    @ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id", nullable = false)
    private User userId;


    @Column(name = "anh", nullable = false)
    private String anh;
    @Column(name = "mo_ta_ngan")
    private String moTaNgan;
    @Column(name = "mo_ta_chi_tiet", nullable = false,columnDefinition = "MEDIUMTEXT")
    private String moTaChiTiet;
    @Column(name = "ngay_tao", nullable = false)
    private LocalDate ngayTao;
    @Column(name = "gia_ban", nullable = false)
    private Integer giaBan;
    @Column(name = "gia_giam", nullable = false)
    private Integer giaGiam;
    @Column(name = "meta_title", nullable = false)
    private String metaTitle;
    @Column(name = "slug", nullable = false)
    private String slug;
    @Column(name = "meta_keyword", nullable = false)
    private String metaKeyword;
    @Column(name = "meta_description", nullable = false)
    private String metaDescription;
    @Column(name = "meta_robot", nullable = false)
    private String metaRobot;
    @Column(name = "deleted", nullable = false)
    private Boolean deleted;


}
