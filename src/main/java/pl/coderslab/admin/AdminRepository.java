package pl.coderslab.admin;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.zdatabase.Employees;

public interface AdminRepository extends JpaRepository<Employees, Long> {
    Employees findEmployeesById(Long id);
}
