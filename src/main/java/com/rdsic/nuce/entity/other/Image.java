package com.rdsic.nuce.entity.other;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "image")
@Data
@Accessors(chain = true)
public class Image implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer idimage;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "src", nullable = false)
    private String src;

    @Column(name = "status", nullable = false)
    private Boolean status;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "folder_image_value")
    private FolderImage folderImage;

}
