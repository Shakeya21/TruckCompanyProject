package pl.coderslab.driver;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.zdatabase.OrderDetails;
import pl.coderslab.zdatabase.TransportOrder;

import java.util.List;

public interface DriverRepository extends JpaRepository<OrderDetails, Long> {
    List<OrderDetails> findAllTransportDetailsByTransportOrderId(Long id);
    OrderDetails findAllTransportDetailsById(Long id);
}
