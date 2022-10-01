package com.rdsic.nuce.key;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.SecondaryTable;
import java.io.Serializable;

@Embeddable
@Data
public class AddrCompanyCourseKey implements Serializable {
    private static final long serialVersionUID = 1L;
    @Column(name = "id_course")
    private int course_id;
    @Column(name = "id_addr")
    private int addr_id;
}
