package com.rdsic.nuce.key;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TopicTagKey  implements Serializable {
    @Column(name = "id_topic")
    private int topicId;

    @Column(name = "id_tag")
    private int tagId;
}
