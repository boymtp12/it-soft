$(document).ready(function () {
    tinhTien()
    handePostCustomer();
    countUpDown();
    renderpriceSw();
    getPhanMemAll();
    getPhanmemByIdInStorage();
})


function getPhanmemByIdInStorage() {
    let listId = getItemLocalStorage('idSw');
    console.log(listId)
    if (listId == null) {
        alertDanger('Giỏ hàng đang trống!');
    } else {
        var listSw = document.querySelector('#product-content');
        var arr = [];
        listId.forEach(function (item) {
            var swApi = '/api/v1/public/phan-mem/find-by-id' + '/' + item.id;
            fetch(swApi)
                .then(function (response) {
                    return response.json();
                })
                .then(function (sw) {
                    console.log(sw);
                    arr.push(sw.data);
                    setItemLocalStorage('dataSw', arr);
                    renderSw();
                })
        })

    }

}

function renderSw() {
    let htmls = ``;
    let dataSw = getItemLocalStorage('dataSw');
    let listPhanmem = getItemLocalStorage('idSw');
    var listSw = document.querySelector('#product-content');
    htmls = dataSw.map(function (sw, index) {
        return `
            <div class="row">
                    <div class="col-12 col-sm-7 col-md-5 col-lg-5 col-xl-5">
                        <div class="row">
                            <a href="" class="col-4 product-img">
                                <img src="${sw.anh}" alt="">
                            </a>
                            <div class="col-8">
                                <a href="" class="product-name">
                                    ${sw.ten}
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-0 col-sm-0 col-md-2 col-lg-2 col-xl-2 text-price unit-price">${priceFormatVnd(sw.giaGiam)}đ</div>
                    <div class="col-5 col-sm-2 col-md-2 col-lg-2 col-xl-2">
                       <span onclick="minus_btn(${sw.id})" class="minus-btn"><i class="fas fa-minus"></i></span>
                        <input type="text" value="${listPhanmem.filter(item2 => item2.id == sw.id)[0].soLuong }" onchange="renderpriceSw(${sw.id},this.value)" class="text-count">
                        <span onclick="plus_btn(${sw.id})" class="plus-btn"><i class="fas fa-plus"></i></span>
                    </div>
                    <div class="col-5 col-sm-2 col-md-2 col-lg-2 col-xl-2 text-price">${priceFormatVnd(sw.giaGiam * listPhanmem.filter(item2 => item2.id == sw.id)[0].soLuong)}đ</div>
                    <div class="col-2 col-sm-1 col-md-1 col-lg-1 col-xl-1"><i onclick="handleDeleleProduct(${sw.id})" class="product-delete fas fa-trash-alt"></i></div>
                </div>
        `
    })
    console.log(htmls);
    listSw.innerHTML = htmls.join('');
}



function tinhTien() {
    let list = getItemLocalStorage('idSw')
    let discount = list.reduce(function (total, item) {
        return total + item.giaGiam * item.soLuong;
    }, 0)
    let totalM = list.reduce(function (total, item) {
        return total + item.giaBan * item.soLuong;
    }, 0)
    let KhuyenMai = totalM - discount;
}

function renderpriceSw(idPM, soLuong) {
    console.log(idPM)
    console.log(soLuong)
    let listIdPm = getItemLocalStorage('idSw')
    for (let i = 0; i < listIdPm.length; i++) {
        if (listIdPm[i].id == idPM) {
            listIdPm[i].soLuong = soLuong;
            break;
        }
    }
    setItemLocalStorage('idSw', listIdPm)
    tinhTien()
    if(getItemLocalStorage('dataSw')!= null) {
        renderSw()
    }
    let payment = document.querySelector('.payment');
    let htmls = ``;
    let discount = listIdPm.reduce(function (total, item) {
        return total + item.giaGiam * item.soLuong;
    }, 0)
    let totalM = listIdPm.reduce(function (total, item) {
        return total + item.giaBan * item.soLuong;
    }, 0)
    let KhuyenMai = totalM - discount;
    htmls = `<div class="price-item">
                        <div class="row">
                            <p class="col-9 col-sm-9 col-md-8 col-lg-8 col-xl-8 text"><span class="text-title">Tạm tính</span></p>
                            <p class="col-3 col-sm-3 col-md-4 col-lg-4 col-xl-4 m-text-center number-text text-price"><span style="font-family: Exo,sans-serif !important" class="">${priceFormatVnd(totalM)}đ</span></p>
                        </div>
                        <div class="row">
                            <p class="col-9 col-sm-9 col-md-8 col-lg-8 col-xl-8 text"><span class="text-title">Giảm giá</span></p>
                            <p class="col-3 col-sm-3 col-md-4 col-lg-4 col-xl-4 m-text-center number-text text-price"><span style="font-family: Exo,sans-serif !important">${priceFormatVnd(KhuyenMai)}đ</span></p>
                        </div>
                    </div>
                    <div class="price-total">
                        <div class="row">
                            <p class="col-9 col-sm-9 col-md-8 col-lg-8 col-xl-8 text">
                                <span class="text-title">Tổng tiền</span>
                            </p>
                            <p class="col-3 col-sm-3 col-md-4 col-lg-4 col-xl-4 m-text-center number-text text-price"><span style="font-family: Exo,sans-serif !important">${priceFormatVnd(discount)}đ</span></p>
                        </div>
                    </div>`

    payment.innerHTML = htmls;
}

function handePostCustomer() {
    let dataSw = getItemLocalStorage('dataSw');
    let phieuMuaApi = '/api/v1/public/phieu-mua-pm/save-new';
    let butBtn = document.querySelector('.cart-total-prices__inner .buy-btn');

    butBtn.onclick = async function () {
        let idSws = getItemLocalStorage('idSw');
        console.log(idSws);


        let discount = idSws.reduce(function (total, item) {
            return total + item.giaGiam * item.soLuong;
        }, 0)
        let totalM = idSws.reduce(function (total, item) {
            return total + item.giaBan * item.soLuong;
        }, 0)
        let KhuyenMai = totalM - discount;
        let dataCustomer = {
            "hoTen": $('.name-customer input').val(),
            "tongTien": totalM,
            "giamGia": discount,
            "ghiChu": $('.node-customer input').val(),
            "trangThai": "Đã thanh toán",
            "email": $('.email-customer input').val(),
            "soDienThoai": $('.number-customer input').val(),
            "deleted": false,
            "nhanVienChamSoc": "Hieu"
        }

        console.log(dataCustomer);
        let options = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
                // 'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: JSON.stringify(dataCustomer)
        }

        let phieuMua = await fetch(phieuMuaApi, options)
            .then(function (response) {
                return response.json();
            })
            .then(function (rs) {
                alertSuccess('Đặt hàng thành công, chúng tôi sẽ gọi lại cho bạn');
                clearDataCustomer();
                // renderSw();
                renderpriceSw();
                return rs.data;
            })
            .catch(function (er) {
                console.log(er);
                alertWarning('That bai');
            })
        console.log(phieuMua)
        console.log(phieuMua.id)
        // vieets tiep ow day
        // lay duowc id cua phieu mua
        // phai lay ca id cua phan mem, so luong phan mem, tong tien


        idSws.forEach(function (item) {
            let dataPm = {
                "giaBan": item.giaGiam * item.soLuong,
                "soLuong": item.soLuong
            }
            console.log(dataPm)
            let optionsPm = {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(dataPm)
            }
            fetch('/api/v1/public/pm-has-phieu-mua/save' + '/' + phieuMua.id + '/' + item.id, optionsPm)
                .then(function (response) {
                    return response.json();
                }).catch(err => {
                console.log(err)
            })

        })

    }

}


function countUpDown() {
    let quantity_input = document.getElementsByClassName("text-count");
    for (let i = 0; i < quantity_input.length; i++) {
        let input = quantity_input[i];
        input.addEventListener("change", function (event) {
            let input = event.target
            if (isNaN(input.value) || input.value <= 0) {
                input.value = 1;
            }
        })
    }
}

function getPhanMemAll() {
    let idPhanMem = [];
    fetch('/api/v1/public/phan-mem/find-all')
        .then(function (response) {
            return response.json();
        })
        .then(function (sws) {
            sws.data.forEach(function (sw) {
                if (idPhanMem.length < 3) {
                    idPhanMem.push(sw.id);
                    setItemLocalStorage('idPhanMemAll', idPhanMem);
                }
            })
            getPhanMemLienQuanById()
        })
}

async function getPhanMemLienQuanById() {
    let idPhanMemAll = getItemLocalStorage('idPhanMemAll');
    let blockPhanMemLienQuan = document.querySelector('.r-product-container');
    let html = ""
    console.log("akakak")
    for (let i in idPhanMemAll) {
        html += await fetch('/api/v1/public/phan-mem/find-by-id' + '/' + idPhanMemAll[i])
            .then(function (response) {
                return response.json();
            })
            .then(function (phanMemAll) {
                let phanMem = phanMemAll.data;

                let a =
                    `<div class="r-product-block">
            <div class="r-product-header">
                    <span class="r-product-image">
                        <img src="${phanMem.anh}" alt="">
                    </span>
                <div class="r-product-name-time">
                        <span class="r-product-name">
                            ${phanMem.ten}
                        </span>
                </div>
            </div>
            <div class="r-product-body">
                    <span>
                        ${phanMem.moTaNgan}
                    </span>
            </div>
            <div class="r-product-footer">
                <div class="r-product-price">
                    <span>${priceFormatVnd(phanMem.giaGiam)}đ</span>
                </div>
                <button onclick="handelPostPhanMemToStorage(${phanMem.id}, ${phanMem.giaGiam}, ${phanMem.giaBan})" class="r-product-btn">
                    MUA NGAY
                </button>
            </div>
        </div>`
                return a;
            })
    }
    console.log(html)
    $(".r-product-container").html(html)

}

async function handleDeleleProduct(idProduct) {
    console.log(idProduct);
    let dataSw = getItemLocalStorage('dataSw');
    let idSw = getItemLocalStorage('idSw');
    let text = 'Bạn có thực sự muốn xóa phần mềm?';
    console.log(dataSw);
    for (let i in dataSw) {
        if (dataSw[i].id == idProduct) {
            let confirm = await sweetAlert2(text)
            if (confirm) {
                dataSw.splice(i, 1);
                idSw.splice(i, 1);
                setItemLocalStorage('dataSw', dataSw);
                setItemLocalStorage('idSw', idSw);
                alertInfo('Xóa phần mềm thành công!');
                handleGetAmountProduct();
            } else {
                alertInfo('Cảm ơn bạn~')
            }
        }
    }
    console.log(dataSw);
    renderSw();
    renderpriceSw()
}

function handelPostPhanMemToStorage(id, giaGiam, giaBan) {
    let phanMem = {
        id: id,
        soLuong: 1,
        giaGiam: giaGiam,
        giaBan: giaBan
    }

    let listPhanmem = getItemLocalStorage('idSw');
    console.log(listPhanmem);
    if (listPhanmem == null) {
        let arr = [];
        arr.push(phanMem);
        setItemLocalStorage('idSw', phanMem);
        alertSuccess('Them phan mem vao gio hang thanh cong');
    } else {
        let check = false;
        for (let i in listPhanmem) {
            console.log(listPhanmem[i]);
            if (listPhanmem[i].id == id) {
                check = true;
                alertInfo('Phan mem da co trong gio hang');
            }
        }
        if (!check) {
            listPhanmem.push(phanMem);
            setItemLocalStorage('idSw', listPhanmem);
            alertSuccess('Them phan mem vao gio hang thanh cong');
        }

    }

    getPhanmemByIdInStorage();
    renderSw();
    renderpriceSw();
    handleGetAmountProduct();
}

function minus_btn(id) {

    let phanMem = getItemLocalStorage('idSw');

    for (let i = 0; i < phanMem.length; i++) {
        if (phanMem[i].id == id) {
            let quantity_input = document.getElementsByClassName("text-count"+id);
            console.log("Phan mem thu ", i, ": ", phanMem[i].id)
            phanMem[i].soLuong--;
            setItemLocalStorage('idSw', phanMem);
            console.log(phanMem[i].soLuong)
            quantity_input.value = phanMem[i].soLuong;
        }
    }
    renderSw();
    renderpriceSw();
}

function plus_btn(id) {



    let phanMem = getItemLocalStorage('idSw');

    for (let i = 0; i < phanMem.length; i++) {
        if (phanMem[i].id == id) {
            console.log(id)
            console.log(phanMem[i])
            let quantity_input = document.getElementsByClassName("text-count"+id);
            console.log("Phan mem thu ", i, ": ", phanMem[i].id)
            phanMem[i].soLuong++;
            setItemLocalStorage('idSw', phanMem);
            console.log(phanMem[i].soLuong)
            quantity_input.value = phanMem[i].soLuong;
        }
    }
    renderSw();
    renderpriceSw();
}

function handleGetAmountProduct() {
    let swAllInCart = getItemLocalStorage('idSw');
    let amountCart = document.querySelector('.amount-cart');
    console.log(swAllInCart);
    let soLuong;
    soLuong = swAllInCart.length;
    amountCart.innerText = soLuong;
}

function clearDataCustomer() {
    document.querySelector('.amount-cart').innerText = 0;
    setItemLocalStorage('idSw', []);
    setItemLocalStorage('dataSw', []);
    $('#validationDefault01').val('');
    $('#validationDefault02').val('');
    $('#validationDefault03').val('');
    $('#validationDefault04').val('');
    $('#validationDefault05').val('');
}

async function trashAllSwInCart() {
    let text = "Bạn có muốn xóa tất cả phần mềm đang có trong giỏ hàng!"
        let confirm = await sweetAlert2(text)
        if(confirm) {
            setItemLocalStorage('idSw', []);
            setItemLocalStorage('dataSw', []);
            renderSw();
            renderpriceSw();
            handleGetAmountProduct();

        } else {
            alertInfo('Cảm ơn bạn~')
        }
}