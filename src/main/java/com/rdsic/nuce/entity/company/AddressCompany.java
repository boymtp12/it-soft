package com.rdsic.nuce.entity.company;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
@Table(name = "address_company")
@Accessors(chain = true)
public class AddressCompany implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "address_school", nullable = false)
    private String addressSchool;

    @ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    @JoinColumn(name = "id_company", nullable = false)
    private Company idCompany;

    @Column(name = "deleted", nullable = false)
    private Boolean deleted;
}
