$(async function () {
    var listCourseGlobal = [];
    await ajaxCallGet("course/find-by-classify/false").then(rs => {
        listCourseGlobal = rs.data;
    })
    let ViewModelCoursSVAdmin = function (listCourse) {
        let self = this;
        self.listCourse = ko.observableArray(listCourse);
        self.itemCourse = ko.observable();
        console.log(self.listCourse())

        //    event
        self.clickShowSubWindows = function () {
            $('#block-edit-course').show('slow');
        }
        self.clickHideSubWindows = function () {
            $('#block-edit-course').hide('slow');
        }
        self.bindItemCourseToEdit = function (idCourse){
            $('#block-edit-course').show('slow');
            ajaxCallGet('course/find-by-id/'+idCourse).then(rs=>{
                console.log(rs)
                self.itemCourse(rs.data);
            })
        }
    }
    ko.applyBindings(new ViewModelCoursSVAdmin(listCourseGlobal));
})