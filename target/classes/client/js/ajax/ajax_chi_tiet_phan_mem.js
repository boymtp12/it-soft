$(function() {
    idSwToBuy();
})

function idSwToBuy() {
    let url = window.location.href.split("/")
    console.log(url[4])
    fetch('/api/v1/public/phan-mem/find-by-id' + '/' + url[4])
        .then(function(response) {
            return response.json();
        })
        .then(function (rs) {
            console.log(rs);
            console.log(rs.data);
            let html = `
                    <div class="block-course col-12 col-sm-6 col-md-6 col-lg-4 col-xl-4">
                    <div class="body-sw">
                        <div class="sp-price-sw">
                            ${priceFormatVnd(rs.data.giaBan)}đ
                        </div>
                        <div class="main-price-sw">
                           ${priceFormatVnd(rs.data.giaGiam)}đ
                        </div>
                        <a href="chi-tiet-phan-mem/${rs.data.id}" class="title-sw" title="${rs.data.ten}">

                        ${rs.data.ten}
                    </a>
                        <div class="description-sw">
                            ${rs.data.moTaNgan}
                        </div>
                        <div class="btn-sw">
                            <button onclick="handleLocalStorage(${rs.data.id},${rs.data.giaGiam}, ${rs.data.giaBan})" class="buy-sw add-sw">Thêm vào giỏ</button>
                            <button onclick="handleLocalStorage(${rs.data.id},${rs.data.giaGiam}, ${rs.data.giaBan}),toCartSw()" class="buy-sw">Mua ngay</button>
                        </div>
                    </div>
                </div>
                `

            $('#buy-now').html(html);
        })
}
function handleLocalStorage(id,giaGiam, giaBan) {
    let pm ={
        id: id,
        soLuong:1,
        giaGiam:giaGiam,
        giaBan: giaBan
    }
    let listId = getItemLocalStorage('idSw');
    if(listId == null) {
        let arr = [];

        arr.push(pm);
        setItemLocalStorage('idSw', arr);
        alertSuccess('Thêm phần mềm vào giỏ hàng thành công')
        handleGetAmountProduct();
    } else {
        let check = false;
        listId.forEach(function(item) {
            if(item.id == id) {
                check = true;
                alertInfo('Phần mềm đã có trong giỏ hàng!');
            }
        })

        if(!check) {
            listId.push(pm);
            setItemLocalStorage('idSw', listId);
            alertSuccess('Thêm phần mềm vào giỏ hàng thành công');
            handleGetAmountProduct();
        }
    }
}

function toCartSw() {
    window.location.href = 'cart-phanmem';
}
