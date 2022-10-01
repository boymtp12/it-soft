package com.rdsic.nuce.entity.course;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
@Table(name = "type_education")
public class TypeEducation implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * Loại hình giáo dục(vd: online or offline)
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "sub_content", nullable = false)
    private String subContent;

    @Column(name = "deleted", nullable = false)
    private Boolean deleted;

}
