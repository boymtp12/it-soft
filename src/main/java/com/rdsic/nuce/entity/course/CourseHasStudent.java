package com.rdsic.nuce.entity.course;

import com.rdsic.nuce.entity.students.Students;
import com.rdsic.nuce.key.CourseStudentKey;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "course_has_student")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class CourseHasStudent implements Serializable {
    private static final long serialVersionUID = 1L;

    @EmbeddedId
    private CourseStudentKey id;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @MapsId("studentId") // tên của khóa ngoại trong embeddedId
    @JoinColumn(name = "id_students")// khóa ngoại trong db
    private Students students;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @MapsId("courseId") // tên của khóa ngoại trong embeddedId
    @JoinColumn(name = "id_course")// khóa ngoại
    private Course course;

    @Column(name = "deleted")
    private boolean deleted;


}
