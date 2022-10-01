$(function () {
    checkLogin()
    // ajaxGet("students/findAll").then(rs => {
    //     console.log(rs)
    // })

    getAllAdvisory()


})
function getAllAdvisory(){
    ajaxCallGet("advisory-infor/find-all").then(rs => {
        console.log(rs)
        let html = ``;
        let a = 0;
        rs.data.map(item => {
            console.log(item);
            a++;
            html += `
            <tr>
                        <td>${a}</td>
                        <td>${item.nameParents}</a> </td>
                        <td>${item.email}</td>
                        <td><span class="tag tag-success">${item.phoneNumber}</span></td>
                        <td><span>${item.nameStudent}</span></td>
                        <td><span>${item.dateOfBirthStudent}</span></td>                
                        <td><span>${item.idCourse.name}</span></td>
                        <td><span>${item.idAddressCompany.addressSchool}</span> </td>
                        <td class="d-flex justify-content-around"><input  onclick="saveAdvisory(${item.idAddressCompany.id},${item.idCourse.id},${item.id})"
                         type="checkbox" name="" value="${item.id}"></td>                                          
                    </tr>
            `
        });
        $("#list-student").html(html);
    });
}
function saveAdvisory( idCompany,  idCourse, id) {
    let advisory=null;
    ajaxCallGet("advisory-infor/find-by-id/"+id).then(rs=>{
        advisory=rs.data;
        ajaxCallPost("advisory-infor/deleted/"+idCompany+"/"+ idCourse,advisory).then(rs1=>{
            console.log(rs1);
            alertSuccess("Bạn đã tư vấn thành công.")
            setTimeout(2000,function (){
                window.location.reload(true);
            })
        }).catch(err=>{
            alertDanger("lỗi chức năng")
        })
    })

}