package com.rdsic.nuce.entity.students;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
@Table(name = "group_student")
public class GroupStudent implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * Nhom hoc vien dang ky khoa hoc
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "deleted", nullable = false)
    private Boolean deleted;

    /**
     * Thứ tự ưu tiên
     */
    @Column(name = "priority", nullable = false)
    private Integer priority;

    /**
     * mac dinh hay khong: 1 la có 0 là không
     */
    @Column(name = "default_order", nullable = false)
    private Boolean defaultOrder;

}
