package com.rdsic.nuce.key;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import java.io.Serializable;

@Embeddable
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CourseStudentKey implements Serializable {
    private static final long serialVersionUID = 1L;
    @Column(name = "id_course")// key trong table db
    private int courseId;
    @Column(name = "id_students")
    private int studentId;
}
