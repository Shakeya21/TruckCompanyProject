package pl.coderslab.dispatch;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.zdatabase.Contractors;

public interface ContractorsRepository extends JpaRepository<Contractors, Long> {
    Contractors findContractorsById(long id);
}
