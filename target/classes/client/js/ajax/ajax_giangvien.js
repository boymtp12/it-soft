$(function () {
    showTeachers()
})

function showTeachers() {
    let html = ``
    ajaxCallGet("teacher/find-all").then(rs => {
        console.log(rs)
        rs.data.map(items => {
            html += `

                    <li style="height: 304.337px;">
                        <div class="c-team-item row">
                            <div class="c-team-item__avatar col-5">
                                <figure><img style="width: 100%;height: 100%" src="${items.imageSrc}" alt="avatar">
                                </figure>
                            </div>
                            <div class="c-team-item__content col-7">
                                <p class="c-team-item__name" style="margin-bottom: 0">${items.name}</p>
                                <p class="c-team-item__name" style="margin-bottom: 0">${items.regency}</p> 
                            </div>
                        </div>
                    </li>

                    
            `
        })
        $("#showTeacher").html(html)
    })

}