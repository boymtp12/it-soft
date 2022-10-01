package com.rdsic.nuce.entity.category;

import com.rdsic.nuce.entity.category.BigCategory;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "small_category")
@Data
@Accessors(chain = true)
public class SmallCategory implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer idsmallCategory;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "deleted", nullable = false)
    private Boolean deleted;

    @ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    @JoinColumn(name = "id_big_category", nullable = false)
    private BigCategory bigCategory;

}
