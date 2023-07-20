package pl.coderslab.roles;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.zdatabase.UserAcc;

public interface UserAccRepository extends JpaRepository<UserAcc, Long> {
    UserAcc findByUsername(String username);
    UserAcc findUserAccById(long id);

    boolean existsByUsername(String name);
}
