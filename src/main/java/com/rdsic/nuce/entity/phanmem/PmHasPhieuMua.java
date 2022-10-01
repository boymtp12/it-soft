package com.rdsic.nuce.entity.phanmem;

import com.rdsic.nuce.key.CourseStudentKey;
import com.rdsic.nuce.key.PmHasPhieuMuaKey;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "pm_has_phieu_mua")
public class PmHasPhieuMua implements Serializable {

    private static final long serialVersionUID = 1L;

    @EmbeddedId
    private PmHasPhieuMuaKey id;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @MapsId("phieuMuaPmId") // tên của khóa ngoại trong embeddedId
    @JoinColumn(name = "phieu_mua_pm_id")// khóa ngoại trong db
    private PhieuMuaPm phieuMuaPmId;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @MapsId("phanMemId") // tên của khóa ngoại trong embeddedId
    @JoinColumn(name = "phan_mem_id")// khóa ngoại trong db
    private PhanMem phanMemId;

    @Column(name = "gia_ban", nullable = false)
    private Integer giaBan;
    @Column(name = "so_luong", nullable = false)
    private Integer soLuong;

}
