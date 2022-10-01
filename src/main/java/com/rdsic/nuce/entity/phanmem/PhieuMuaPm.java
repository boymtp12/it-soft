package com.rdsic.nuce.entity.phanmem;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;

@Data
@Entity
@Table(name = "phieu_mua_pm")
public class PhieuMuaPm implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "ho_ten", nullable = false)
    private String hoTen;
    @Column(name = "tong_tien", nullable = false)
    private Integer tongTien;
    @Column(name = "ngay_chuyen")
    private LocalDate ngayChuyen;
    @Column(name = "ngay_tao", nullable = false)
    private LocalDate ngayTao;
    @Column(name = "ghi_chu")
    private String ghiChu;
    @Column(name = "trang_thai")
    private String trangThai;
    @Column(name = "email")
    private String email;
    @Column(name = "so_dien_thoai", nullable = false)
    private String soDienThoai;
    @Column(name = "nhan_vien_cham_soc")
    private String nhanVienChamSoc;
    @Column(name = "deleted", nullable = false)
    private Boolean deleted;
    @Column(name = "giam_gia", nullable = false)
    private Integer giamGia;
    @Column(name = "luot_goi")
    private Integer luotGoi;
    @Column(name = "luot_ho_tro")
    private Integer luotHoTro;
    @Column(name = "ngay_kich_hoat")
    private LocalDate ngayKichHoat;
    @Column(name = "ngay_het_hang")
    private LocalDate ngayHetHang;
    @Column(name = "so_ma_cai")
    private Integer soMaCai;
    @Column(name = "so_ma_mua")
    private Integer soMaMua;
    @Column(name = "nguon")
    private String nguon;
    @Column(name = "ky_thuat_vien")
    private String kyThuatVien;


}
