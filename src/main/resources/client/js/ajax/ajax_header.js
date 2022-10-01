$(function (){
    let url = window.location.href.split("/")
    let urlHead = url[0] + "//" + url[2] + "/";
    addCourseHeader(urlHead)
    handleGetAmountProduct()
})
function addCourseHeader(url){
    let html=` `;
    ajaxCallGet("course/find-by-name-image-subcontent-createdate/0").then(rs=>{
        rs.data.map(item=>{
            if(item.urlView==="android-tutorial"){
                html +=`
            <li style="position: relative"><a class="dropdown-item" href="${URLHTTP+"khoa-hoc-spec/13/android-tutorial" } ">${item.name}</a></li>
            `;
            }else {
                html +=`
            <li style="position: relative"><a class="dropdown-item" href="${url+"khoa-hoc-spec/"+item.id+"/"+item.urlView }">${item.name}</a></li>
            `;
            }
        })
        $("#menuKhoaHocHeader").html(html)
        $("#menuKhoaHocHeader").append(`<li><a class="dropdown-item" href="${url+"xemthem" }">Xem thêm</a></li>`)
    })
}

function handleGetAmountProduct() {
    let swAllInCart = getItemLocalStorage('idSw');
    let amountCart = document.querySelector('.amount-cart');
    console.log(swAllInCart);
    let soLuong;
    soLuong = swAllInCart.length;
    amountCart.innerText = soLuong;
}