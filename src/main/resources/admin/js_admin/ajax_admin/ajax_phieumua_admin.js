var edit2 = TinyInit("#subContent", 100);
var edit1 = TinyInit('#mainContent', 500);
let mainContent = 'mainContent'
let subContent = 'subContent'

$(document).ready(function () {
    checkLogin();
    handleGetCoupons(renderCoupons);
    hideShowEditCoupons();
    $('#discountSw').keyup(function (event) {
        $('#discountSw').val(formatNumber(event.target.value.replaceAll(',', '').replaceAll('.', ''), ",", ","));
    })
    $('#priceSw').keyup(function (event) {
        $('#priceSw').val(formatNumber(event.target.value.replaceAll(',', '').replaceAll('.', ''), ",", ","));
    })

    handlePostCoupons();
    getAllPhanMem();

})

function hideShowEditCoupons() {
    $('.btn-hide-add-cp').click(function () {
        $('#block-edit-cp').hide('slow')
    })
    $('.btn-show-add-cp').click(function () {
        $('#block-edit-cp').show('slow')
    })
}

function handleGetCoupons(callback) {
    let couponsApi = '/api/v1/public/phieu-mua-pm/find-all';

    fetch(couponsApi)
        .then(function (response) {
            return response.json();
        })
        .then(callback)
}

async function handleDeleteCourse(id) {
    let text = 'Bạn có thực sự muốn phiếu này? ';
    let confirm = await sweetAlert2(text)
    if (confirm) {
        let options = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
                // 'Content-Type': 'application/x-www-form-urlencoded',
            }
        }
        fetch('/api/v1/public/phieu-mua-pm/deleted' + '/' + id, options)
            .then(function (response) {
                return response.json();
            })
            .then(function (datas) {
                console.log(datas);
                handleGetCoupons(renderCoupons);
                alertSuccess('Xoa phieu mua thanh cong');
            })
    } else {
        alertInfo('Thank you!')
    }
}


function renderCoupons(cps) {
    $("select").css("width: 100%");
    console.log("Danh sach: ", cps);
    let htmls = cps.data.map(function (cp, index) {



        return `
            <tr>
                    <td>${index + 1}</td>
                    <td>${cp.hoTen}</td>
                    <td>${cp.soDienThoai}</td>
                    <td>${cp.ghiChu} </td>
                    <td>${cp.email}</td>
                    <td>
                    <span style="display: block">${cp.trangThai}</span>
                    <td>${cp.luotGoi}</td>
                    <td>${cp.luotHoTro}</td>
                    <td><input onChange="handleEditCouponAtDate(${cp.id})" type="date" style="outline-color: #f77e32; border-radius: 4px" id="ngayKichHoatOnChange" value="${cp.ngayKichHoat}"></td>
                    <td><input onChange="handleEditCouponAtDate(${cp.id})" type="date" style="outline-color: #f77e32;  border-radius: 4px" id="ngayHetHanOnChange" value="${cp.ngayHetHang}"></td>
                    <td>${cp.soMaCai}</td>
                    <td>${cp.soMaMua}</td>
                    <td>
                    <span style=" display: block">${cp.nhanVienChamSoc}</span>
                    </td>
                    <td>
                    <span style=" display: block">${cp.nguon}</span>
                    </td>
                    <td>
                    <span style="display: block">${cp.kyThuatVien}</span
                    </td>                 
                    <td>
                        <div class="btn-group">
                            <button onClick="getInformationCoupon(${cp.id})" id="editCourse${index}" data-id="${cp.id}"
                                data-toggle="" title="Sửa" type="button"
                                                            class="btn btn-default btn-sm btn-show-add-cp">
                                                      <i class="fas fa-wrench"></i>
                                                     </button>
                            <button onclick="handleDeleteCourse(${cp.id})" title="Xóa" data-id="${cp.id}" type="button" class="btn btn-default btn-sm">
                                        <i class="far fa-trash-alt"></i>
                                    </button>
                        </div>
                    </td>
                </tr>
        `
    })
    $('#tableShowAllCoupons').html(htmls);
    hideShowEditCoupons();
}

function handlePostCoupons() {
    $('#postCourse').click(function () {
        let couponData = {
            "hoTen": $('#nameCr').val(),
            "tongTien": $('#priceSw').val() == "" ? 0 : $('#priceSw').val().replaceAll(',', ''),
            "giamGia": $('#discountSw').val() == "" ? 0 : $('#discountSw').val().replaceAll(',', ''),
            "ngayChuyen": $('#deliveryDate').val(),
            "ngayTao": $('#createDate').val(),
            "ghiChu": $('#noteCr').val(),
            "email": $('#mailCr').val(),
            "trangThai": $('#trangThai').val(),
            "deleted": false,
            "soDienThoai": $('#numberCr').val(),
            "nhanVienChamSoc": $('#staffCr').val(),
            "luotGoi": $('#luotGoi').val() == "" ? 0 : $('#luotGoi').val(),
            "luotHoTro": $('#luotHoTro').val() == "" ? 0 : $('#luotHoTro').val(),
            "ngayKichHoat": $('#activationDate').val(),
            "ngayHetHang": $('#expirationDate').val(),
            "soMaCai": $('#soMaCai').val() == "" ? 0 : $('#soMaCai').val(),
            "soMaMua": $('#soMaMua').val() == "" ? 0 : $('#soMaMua').val(),
            "nguon": $('#nguon').val(),
            "kyThuatVien": $('#kyThuatVien').val()
        }

        let options = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
                // 'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: JSON.stringify(couponData)
        }
        console.log(couponData);
        fetch('/api/v1/public/phieu-mua-pm/save-new', options)
            .then(function (response) {
                return response.json();
            })
            .then(function (rs) {
                console.log(rs);
                alertSuccess('Thêm phiếu mua thành công!');
                handleGetCoupons(renderCoupons);
                $('#checkboxes').css('display', 'none');
                document.getElementById("btn-hide-add-cp").click();
                return rs.data.id;
            })
            .then(function(idPhieuMua) {
                postPhanMemToPmHasPhieuMua(idPhieuMua);
            })


    })


}

function handleEditCoupon(id) {
    let couponData = {
        "id": id,
        "hoTen": $('#nameCr').val(),
        "tongTien": $('#priceSw').val() == "" ? 0 : $('#priceSw').val().replaceAll(',', ''),
        "giamGia": $('#discountSw').val() == "" ? 0 : $('#discountSw').val().replaceAll(',', ''),
        "ngayChuyen": $('#deliveryDate').val(),
        "ngayTao": $('#createDate').val(),
        "ghiChu": $('#noteCr').val(),
        "email": $('#mailCr').val(),
        "trangThai": $('#trangThai').val(),
        "deleted": false,
        "soDienThoai": $('#numberCr').val(),
        "nhanVienChamSoc": $('#staffCr').val(),
        "luotGoi": $('#luotGoi').val() == "" ? 0 : $('#luotGoi').val(),
        "luotHoTro": $('#luotHoTro').val() == "" ? 0 : $('#luotHoTro').val(),
        "ngayKichHoat": $('#activationDate').val(),
        "ngayHetHang": $('#expirationDate').val(),
        "soMaCai": $('#soMaCai').val() == "" ? 0 : $('#soMaCai').val(),
        "soMaMua": $('#soMaMua').val() == "" ? 0 : $('#soMaMua').val(),
        "nguon": $('#nguon').val(),
        "kyThuatVien": $('#kyThuatVien').val()
    }
    console.log(couponData);
    let options = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
            // 'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: JSON.stringify(couponData)
    }
    fetch('/api/v1/public/phieu-mua-pm/save-new', options)
        .then(function (response) {
            return response.json();
        })
        .then(function () {
            alertSuccess('Sửa phiếu mua thành công');
            handleGetCoupons(renderCoupons);
            $('#checkboxes').css('display', 'none');
            postPhanMemToPmHasPhieuMua(id);
            document.getElementById("btn-hide-add-cp").click();
        })
}


function handleEditCouponAtDate(idPhieuMua) {
    fetch('/api/v1/public/phieu-mua-pm/find-by-id' + '/' + idPhieuMua)
        .then(function(response) {
            return response.json();
        })
        .then(function(rs) {
            let couponData = {
                "id": idPhieuMua,
                "hoTen": rs.data.hoTen,
                "tongTien": rs.data.tongTien,
                "giamGia": rs.data.giamGia,
                "ngayChuyen": rs.data.ngayChuyen,
                "ngayTao": rs.data.ngayTao,
                "ghiChu": rs.data.ghiChu,
                "email": rs.data.email,
                "trangThai": rs.data.trangThai,
                "deleted": false,
                "soDienThoai": rs.data.soDienThoai,
                "nhanVienChamSoc": rs.data.nhanVienChamSoc,
                "luotGoi": rs.data.luotGoi,
                "luotHoTro": rs.data.luotHoTro,
                "ngayKichHoat": $('#ngayKichHoatOnChange').val(),
                "ngayHetHang": $('#ngayHetHanOnChange').val(),
                "soMaCai": rs.data.soMaCai,
                "soMaMua": rs.data.soMaMua,
                "nguon": rs.data.nguon,
                "kyThuatVien": rs.data.kyThuatVien
            }

            console.log(couponData);
            let options = {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                    // 'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: JSON.stringify(couponData)
            }
            fetch('/api/v1/public/phieu-mua-pm/save-new', options)
                .then(function (response) {
                    return response.json();
                })
                .then(function () {
                    alertSuccess('Sửa phiếu mua thành công');
                    handleGetCoupons(renderCoupons);
                    $('#checkboxes').css('display', 'none');
                    postPhanMemToPmHasPhieuMua(idPhieuMua);
                })
        })


}


function postPhanMemToPmHasPhieuMua(idPhieuMua) {
    let listPhanMemInLocal = getItemLocalStorage('swInPhieuMua');
    console.log(listPhanMemInLocal);

    // Sua phan mem tu checkbox
    listPhanMemInLocal.forEach(function(rs) {
        let dataSw = {
            soLuong: rs.soLuong
        }
        console.log(rs);
        let options = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
                // 'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: JSON.stringify(dataSw)
        }
        fetch('/api/v1/public/pm-has-phieu-mua/save' + '/' + idPhieuMua + '/' + rs.id, options)
            .then(function (response) {
                return response.json();
            })
            .then(function (rs) {
            })


    })
}

async function getInformationCoupon(idPhieuMua) {
    //lay thong tin khach hang, doi luon nut post thanh nut edit
    $('#btnEditCp').prop("disabled", false);
    $('#btnEditCp').css("display", "inline-block");
    $('#postCourse').prop("disabled", true);
    $('#postCourse').css("display", "none");
    $('#checkboxes').css('display', 'none');

    $(`input[type='checkbox']`).prop('checked', false);
    setItemLocalStorage('idPhieuMuaDelete', idPhieuMua);
    setItemLocalStorage('swInPhieuMua',[]);
    $('#btnEditCp').attr('onclick', `handleEditCoupon(${idPhieuMua})`)
    fetch('/api/v1/public/phieu-mua-pm/find-by-id' + '/' + idPhieuMua)
        .then(function (response) {
            return response.json();
        })
        .then(function (rs) {
            console.log(rs);
            $('#nameCr').val(rs.data.hoTen);
            $('#mailCr').val(rs.data.email);
            $('#priceSw').val(rs.data.tongTien);
            $('#discountSw').val(rs.data.giamGia);
            $('#deliveryDate').val(rs.data.ngayChuyen);
            $('#numberCr').val(rs.data.soDienThoai);
            $('#staffCr').val(rs.data.nhanVienChamSoc);
            $('#noteCr').val(rs.data.ghiChu);
            $('#createDate').val(rs.data.ngayTao);
            $('#luotGoi').val(rs.data.luotGoi);
            $('#luotHoTro').val(rs.data.luotHoTro);
            $('#activationDate').val(rs.data.ngayKichHoat);
            $('#expirationDate').val(rs.data.ngayHetHang);
            $('#soMaCai').val(rs.data.soMaCai);
            $('#soMaMua').val(rs.data.soMaMua);
            $('#nguon').val(rs.data.nguon);
        })

    await fetch('/api/v1/public/pm-has-phieu-mua/find-by-phieu-mua-id' + '/' + idPhieuMua)
        .then(function (response) {
            return response.json();
        })
        .then(function (rs) {
            console.log(rs.data);
            rs.data.forEach(function (item, index) {
                let dataToLocal = {
                    id: item.phanMemId.id,
                    giaBan: item.phieuMuaPmId.tongTien,
                    giaGiam: item.giaBan,
                    soLuong: item.soLuong
                }
                let swInLocal = getItemLocalStorage('swInPhieuMua');
                if(swInLocal == null) {
                    swInLocal.push(dataToLocal);
                    setItemLocalStorage('swInPhieuMua', swInLocal);
                } else {
                    let check =false;
                    for(let i in swInLocal) {
                        if(swInLocal[i].id == dataToLocal.id) {
                            check = true;
                        }
                    }
                    if(!check) {
                        swInLocal.push(dataToLocal);
                        setItemLocalStorage('swInPhieuMua', swInLocal);
                    }
                }
                console.log(item.phanMemId.id);
                console.log(item.phanMemId.ten);
                console.log($(`input[type='checkbox']`));
                getItemLocalStorage('swInPhieuMua').forEach(function(sw) {
                    $(`input[type='checkbox']#${sw.id}`).prop('checked', true);
                })

            })

            let htmls = rs.data.map(function(item, index) {
                return `
                    <tr style="text-align: center">
                        <td>${index+1}</td>
                        <td>${item.phanMemId.ten}</td>
                        <td>${item.soLuong}</td>
                        <td>${priceFormatVnd(item.giaBan)}đ</td>
                        <td>${priceFormatVnd(item.soLuong*item.giaBan)}đ</td>
                    </tr>
                `
            })
            $('#couponsDetailBody').html(htmls);



        })


}

function handlePostCr() {
    $('#btnEditCp').prop("disabled", true);
    $('#btnEditCp').css("display", "none");
    $('#postCourse').prop("disabled", false);
    $('#postCourse').css("display", "inline-block");
    $(`input[type='checkbox']`).prop('checked', false);
    setItemLocalStorage('swInPhieuMua',[]);
    $('#checkboxes').css('display', 'none');

    $('#couponsDetailBody').html("");



    $('#nameCr').val("");
    $('#mailCr').val("");
    $('#priceSw').val("");
    $('#discountSw').val("");
    $('#deliveryDate').val("");
    $('#numberCr').val("");
    $('#staffCr').val("");
    $('#noteCr').val("");
    $('#createDate').val("");
    $('#luotGoi').val("");
    $('#luotHoTro').val("")
    $('#activationDate').val("")
    $('#expirationDate').val("")
    $('#soMaCai').val("")
    $('#soMaMua').val("")
    $('#nguon').val("")

}

var expanded = true;

function showCheckboxes() {
    var checkboxes = document.getElementById("checkboxes");
    if (!expanded) {
        checkboxes.style.display = "block";
        expanded = true;
    } else {
        checkboxes.style.display = "none";
        expanded = false;
    }
}


function getAllPhanMem() {
    fetch('/api/v1/public/phan-mem/find-all')
        .then(function (response) {
            return response.json();
        })
        .then(function (rs) {
            console.log(rs);
            console.log(rs.data);
            let htmls = rs.data.map(function (sw) {
                return `
                    <label style="padding: 6px 0; margin: 0" for="${sw.id}">
                    <input onclick="handleCheckboxToLocal(${sw.id}, ${sw.giaBan}, ${sw.giaGiam})" type="checkbox" id="${sw.id}"/><span style="padding: 12px">${sw.ten}</span></label>
                `
            })
            $('#checkboxes').html(htmls);
        })

}

async function handleCheckboxToLocal(idPhanMem, giaBan, giaGiam) {
    let phanMem = {
        id: idPhanMem,
        giaBan: giaBan,
        giaGiam: giaGiam,
        soLuong: 1
    }
    let listPhanmem = getItemLocalStorage('swInPhieuMua');
    let idPhieuMua = getItemLocalStorage('idPhieuMuaDelete');

    if($(`input[type='checkbox']#${idPhanMem}`).is(':checked')) {
        if(listPhanmem == null) {
            let arr = [];
            arr.push(phanMem);
            setItemLocalStorage('swInPhieuMua', arr)
            console.log(listPhanmem);
        } else {
            let check = false;
            for(let i in listPhanmem) {
                if(listPhanmem[i].id == idPhanMem) {
                    check = true;
                }
            }
            if(!check) {
                console.log(listPhanmem);
                listPhanmem.push(phanMem);
                setItemLocalStorage('swInPhieuMua', listPhanmem);
            }
        }
        renderCouponsDetailInPost();

    } else {
        let new_listPhanmem = listPhanmem.filter(item => item.id !== idPhanMem);
        let idPhieuMua = getItemLocalStorage('idPhieuMuaDelete');
        console.log(idPhieuMua)
        console.log(new_listPhanmem);
        setItemLocalStorage('swInPhieuMua', new_listPhanmem);
        let optionsDelete = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
                // 'Content-Type': 'application/x-www-form-urlencoded',
            },
        }
        fetch('/api/v1/public/pm-has-phieu-mua/delete' + '/' + idPhanMem + '/' + idPhieuMua, optionsDelete)
            .then(function (response) {
                return response.json();
            })
            .then(function(rs) {
                console.log(rs);
                renderCouponsDetailInPost()
            })


    }

    console.log(getItemLocalStorage('swInPhieuMua'));
    // (3) [{…}, {…}, {…}]
    // 0: {id: 99, giaBan: 21421, giaGiam: 4342, soLuong: 1}
    // 1: {id: 98, giaBan: 214, giaGiam: 432, soLuong: 1}
    // 2: {id: 50, giaBan: 3700000, giaGiam: 3000000, soLuong: 1}]

    // start new
    // getItemLocalStorage('swInPhieuMua').forEach(function(eachSw) {
    //     let html = ``;
    //     console.log(eachSw);
    //     fetch('/api/v1/public/phan-mem/find-by-id' + '/' + eachSw.id)
    //         .then(function(response) {
    //             return response.json();
    //         })
    //         .then(function(rs) {
    //             console.log(rs);
    //              html+= `
    //                 <tr>
    //                     <td>1</td>
    //                     <td>${rs.data.ten}</td>
    //                     <td>${eachSw.soLuong}</td>
    //                     <td>${eachSw.giaBan}đ</td>
    //                     <td>${eachSw.soLuong*eachSw.giaBan}đ</td>
    //                 </tr>
    //             `
    //             console.log(html);
    //         })
    // })
    // $('#couponsDetailBody').html(html);
    // endnew;
    if(getItemLocalStorage('swInPhieuMua') != null) {
        let idPhieuMua = getItemLocalStorage('idPhieuMuaDelete');
        let discount = getItemLocalStorage('swInPhieuMua').reduce(function (total, item) {
            return total + item.giaGiam * item.soLuong;
        }, 0)
        let totalM = getItemLocalStorage('swInPhieuMua').reduce(function (total, item) {
            return total + item.giaBan * item.soLuong;
        }, 0)

        $('#priceSw').val(totalM);
        $('#discountSw').val(discount);

    } else {
        $('#priceSw').val(0);
        $('#discountSw').val(0);

    }
}

function renderCouponsDetailInPost() {
    console.log(getItemLocalStorage('swInPhieuMua'))
    let htmls = ``;

    if(getItemLocalStorage('swInPhieuMua').length > 0) {
        getItemLocalStorage('swInPhieuMua').forEach(function(item, index) {
            console.log(item);
            fetch('/api/v1/public/phan-mem/find-by-id' + '/' + item.id)
                .then(function(response) {
                    return response.json();
                })
                .then(function(rs) {
                    console.log(rs.data);
                    htmls += `
                    <tr style="text-align: center">
                        <td>${index+1}</td>
                        <td>${rs.data.ten}</td>
                        <td>${item.soLuong}</td>
                        <td>${priceFormatVnd(item.giaGiam)}đ</td>
                        <td>${priceFormatVnd(item.soLuong*item.giaBan)}đ</td>
                    </tr>
                `
                    console.log(htmls)
                    $('#couponsDetailBody').html(htmls);
                })
        })
    } else {
        $('#couponsDetailBody').html('');
    }
}


