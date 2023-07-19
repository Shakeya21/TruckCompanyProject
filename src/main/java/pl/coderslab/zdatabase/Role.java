package pl.coderslab.zdatabase;

import org.hibernate.annotations.ColumnDefault;
import pl.coderslab.domain.Roles;

import javax.persistence.*;
import java.util.Objects;


@Entity
//@Table(name = "user_roles")
public class Role {
    @Id
    @Column(name = "role_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false, columnDefinition="varchar(255) default 'User'")
    private String roleName;

    public Role() {
        this.roleName = Roles.USER.getRoleName();
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Role role = (Role) o;
        return Objects.equals(id, role.id) && Objects.equals(roleName, role.roleName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, roleName);
    }
}
