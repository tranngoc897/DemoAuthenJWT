package vn.com.ibss.au.entity;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import jakarta.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "permission")
@Getter
@Setter
@NoArgsConstructor
public class Permission implements Serializable {

    @Id
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;


}
