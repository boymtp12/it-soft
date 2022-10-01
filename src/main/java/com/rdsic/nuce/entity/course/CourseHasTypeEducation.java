package com.rdsic.nuce.entity.course;

import com.rdsic.nuce.entity.students.Students;
import com.rdsic.nuce.key.CourseTypeEducationKey;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "course_has_type_education")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class CourseHasTypeEducation implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    private CourseTypeEducationKey id;

    @ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    @MapsId("typeEducationId") // tên của khóa ngoại trong embeddedId
    @JoinColumn(name = "type_education_id")// khóa ngoại trong db
    private TypeEducation typeEducation;

    @ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    @MapsId("courseId") // tên của khóa ngoại trong embeddedId
    @JoinColumn(name = "course_id")// khóa ngoại
    private Course course;

    @Column(name = "deleted")
    private boolean deleted;
}
