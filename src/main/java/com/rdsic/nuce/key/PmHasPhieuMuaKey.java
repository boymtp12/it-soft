package com.rdsic.nuce.key;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PmHasPhieuMuaKey  implements Serializable {
    private static final long serialVersionUID = 1L;
    @Column(name = "phan_mem_id")// key trong table db
    private int phanMemId;
    @Column(name = "phieu_mua_pm_id")
    private int phieuMuaPmId;
}
