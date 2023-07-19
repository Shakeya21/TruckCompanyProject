package pl.coderslab.dispatch;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.zdatabase.Packages;

public interface PackagesRepository extends JpaRepository<Packages, Long> {
Packages findPackagesById(long id);
}
