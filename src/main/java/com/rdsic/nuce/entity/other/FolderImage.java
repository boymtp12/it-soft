package com.rdsic.nuce.entity.other;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "folder_image")
@Data
public class FolderImage implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "value", nullable = false)
    private String value;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "deleted", nullable = false)
    private Boolean deleted;

}
