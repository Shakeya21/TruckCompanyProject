package pl.coderslab.roles;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.zdatabase.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
    RoleRepository findRoleById(Long id);
    Role findByRoleName(String roleName);

}
