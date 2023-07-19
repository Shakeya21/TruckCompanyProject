package pl.coderslab.admin;

import org.apache.catalina.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.coderslab.zdatabase.UserAcc;

public interface UserRepository extends JpaRepository<UserAcc, Long> {
    boolean existsByUsername(String username);

//    UserAcc findUserAccByEmployeesId(long id);

    UserAcc findByUsername(String username);

//    @Query("SELECT u FROM UserAcc u WHERE u.email = :email")
//    UserAcc findByEmail(@Param("email") String email);
}
