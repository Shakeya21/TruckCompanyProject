package pl.coderslab.driver;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.xconfig.MyUserDetails;
import pl.coderslab.dispatch.TransportOrderRepository;
import pl.coderslab.zdatabase.OrderDetails;
import pl.coderslab.zdatabase.TransportOrder;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/driver")
public class DriverController {

    private final DriverRepository driverRepository;
    private final TransportOrderRepository transportOrderRepository;

    public DriverController(DriverRepository driverRepository, TransportOrderRepository transportOrderRepository) {
        this.driverRepository = driverRepository;
        this.transportOrderRepository = transportOrderRepository;
    }

    @GetMapping("/list/active")
    public String transportOrdersActive(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            List<TransportOrder> activeOrders = transportOrderRepository.findByStatusAndEmployeesId("active", ((MyUserDetails) authentication.getPrincipal()).getUserAcc().getId());
            model.addAttribute("ordersActive", activeOrders);
        return "/employee/listActive";
    }

    @GetMapping("/list/ended")
    public String transportOrdersEnded(Model model) {
//        List<TransportOrder> ordersEnded = transportOrderRepository.findByStatus("ended");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        List<TransportOrder> ordersEnded = transportOrderRepository.findByStatusAndEmployeesId("ended", ((MyUserDetails) authentication.getPrincipal()).getUserAcc().getId());
        model.addAttribute("ordersEnded", ordersEnded);
        return "/employee/listEnded";
    }

    @GetMapping("/list/details/{id}")
    public String transportOrderDetails(@PathVariable long id, Model model) {
        List<OrderDetails> orderDetails = driverRepository.findAllTransportDetailsByTransportOrderId(id);
        model.addAttribute("orderDetails", orderDetails);
        return "/employee/listDetails";
    }

    @GetMapping("list/add/{id}")
    public String addOrderDetail(@PathVariable long id, Model model) {
        model.addAttribute("orderDetails", new OrderDetails());
        return "/employee/add";
    }

    @PostMapping("list/add/{id}")
    public String saveOrderDetail(@PathVariable long id,
                                  @Valid OrderDetails orderDetails, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("orderDetails", orderDetails);
            return "/employee/add";
        }
        TransportOrder orderID = transportOrderRepository.findTransportOrdersById(id);
        orderDetails.setTransportOrder(orderID);
        driverRepository.save(orderDetails);
        return "redirect:/driver/list/details/{id}";
    }

    @GetMapping("list/end/{id}")
    public String endOrder(@PathVariable long id, Model model) {
        TransportOrder ordersActive = transportOrderRepository.findTransportOrdersById(id);
        model.addAttribute("ordersActive", ordersActive);
        return "/employee/end";
    }

    @PostMapping("list/end/{id}")
    public String endOrderPost(@PathVariable long id) {
        TransportOrder orderId = transportOrderRepository.findTransportOrdersById(id);
        orderId.setStatus("ended");
        transportOrderRepository.save(orderId);
        return "redirect:/driver/list/ended";
    }

    @GetMapping("/list/details/edit/{id}")
    public String editDetails(@PathVariable long id, Model model) {
        OrderDetails orderDetails = driverRepository.findAllTransportDetailsById(id);
        model.addAttribute("orderDetails", orderDetails);
        return "employee/add";
    }

    @PostMapping("/list/details/edit/{id}")
    public String saveEditedDetails(@PathVariable long id,
                                    @Valid OrderDetails orderDetails, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()){
            model.addAttribute("orderDetails", orderDetails);
            return "employee/add";
        }

        OrderDetails existing = driverRepository.findAllTransportDetailsById(id);
        existing.setMileage(orderDetails.getMileage());
        existing.setPlace(orderDetails.getPlace());
        existing.setState(orderDetails.getState());
        existing.setAction(orderDetails.getAction());
        existing.setQuantity(orderDetails.getQuantity());
        existing.setSum(orderDetails.getSum());
        driverRepository.save(existing);
        return "redirect:/driver/list/details/"+existing.getTransportOrder().getId();
    }

}
