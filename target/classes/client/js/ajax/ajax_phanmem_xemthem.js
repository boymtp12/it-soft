$(document).ready(function () {
    handleGetCourses(renderCourses);
    handleGetCourses(renderListSw);
})

async function handleGetCourses(callback) {
    var coursesApi = '/api/v1/public/phan-mem/find-all';
    fetch(coursesApi)
        .then(function (response) {
            return response.json();
        })
        .then(callback)
}

function renderListSw(sws) {
    var listPost = document.querySelector('#listNewsHome .list-sw')

    var htmls = sws.data.map(function(sw) {
        return `
            <li class="post-item"><a href="" class="post-link">${sw.ten}</a></li>
        `
    })
    console.log(htmls);

    listPost.innerHTML = htmls.join('');
}

function renderCourses(sws) {
    console.log(sws)
    var listCourses = document.querySelector('#content .left-content');
    var htmls = sws.data.map(function (sw) {
        return `
            <div class="block-course col-12 col-sm-6 col-md-6 col-lg-4 col-xl-4">
                    <div class="header-sw">
                        <img src="https://static.kaspersky.proguide.vn/image/2020/7/4/586_hot(1).gif" alt="" class="sale-header">
                        <a href="chi-tiet-phan-mem/${sw.id}">
                            <img src="${sw.anh}" alt="" class="img-sw">
                        </a>
                    </div>
                    <div class="body-sw">
                        <div class="sp-price-sw">
                            ${priceFormatVnd(sw.giaBan)}đ
                        </div>
                        <div class="main-price-sw">
                           ${priceFormatVnd(sw.giaGiam)}đ
                        </div>
                        <a href="chi-tiet-phan-mem/${sw.id}" class="title-sw" title="${sw.ten}">
    
                        ${sw.ten}
                    </a>
                        <div class="description-sw">
                            ${sw.moTaNgan}
                        </div>
                        <div class="btn-sw">
                            <button onclick="handleLocalStorage(${sw.id},${sw.giaGiam}, ${sw.giaBan})" class="buy-sw add-sw">Thêm vào giỏ</button>
                            <button onclick="handleLocalStorage(${sw.id},${sw.giaGiam}, ${sw.giaBan}),toCartSw()" class="buy-sw">Mua ngay</button>
                        </div>
                    </div>
                </div>
        `
    });

    listCourses.innerHTML = htmls.join('');
}

// function handleLocalStorage(id) {
//     let listId = getItemLocalStorage('idSw');
//     if (listId == null) {
//         let arr = []
//         arr.push(id)
//         setItemLocalStorage('idSw', arr);
//     } else {
//         let check = false;
//         listId.map(item => {
//             if (item == id) {
//                 check = true;
//             }
//         })
//
//         if (!check){
//             listId.push(id)
//             setItemLocalStorage('idSw', listId);
//         }
//     }
// }

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
function handleGetAmountProduct() {
    let swAllInCart = getItemLocalStorage('idSw');
    let amountCart = document.querySelector('.amount-cart');
    console.log(swAllInCart);
    let soLuong;
    soLuong = swAllInCart.length;
    amountCart.innerText = soLuong;
}

function toCartSw() {
    window.location.href = 'cart-phanmem';
}

