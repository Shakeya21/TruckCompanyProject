package pl.coderslab.dispatch;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.zdatabase.TransportOrder;

import java.util.List;

public interface TransportOrderRepository extends JpaRepository<TransportOrder, Long> {
    TransportOrder findTransportOrdersById(Long id);

    List<TransportOrder> findByStatus(String active);

    List<TransportOrder> findByStatusAndEmployeesId(String active, Long id);
}
