package com.rdsic.nuce.entity.topic;

import com.rdsic.nuce.key.TopicTagKey;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.hibernate.annotations.Fetch;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "topic_has_tag")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class TopicHasTag implements Serializable {

    private static final long serialVersionUID = 1L;

    @EmbeddedId
    TopicTagKey id;

    @ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    @MapsId("tagId")
    @JoinColumn(name = "id_tag", nullable = false)
    private Tag tag;

    @ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    @MapsId("topicId")
    @JoinColumn(name = "id_topic", nullable = false)
    private Topic topic;

    @Column(name = "deleted", nullable = false)
    private Boolean deleted;


}
