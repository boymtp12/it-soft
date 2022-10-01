package com.rdsic.nuce.key;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CourseTypeEducationKey implements Serializable {
    private static final long serialVersionUID = 1L;
    @Column(name = "course_id")// key trong table db
    private int courseId;
    @Column(name = "type_education_id")
    private int typeEducationId;
}
