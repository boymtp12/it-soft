package com.rdsic.nuce.entity.course;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Data
@Accessors(chain = true)
@Table(name = "theme")
public class Theme implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * chu de cua khoa hoc
     */
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "deleted", nullable = false)
    private Boolean deleted;

}
