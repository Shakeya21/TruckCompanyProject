package pl.coderslab.dispatch;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.admin.AdminRepository;
import pl.coderslab.driver.DriverRepository;
import pl.coderslab.zdatabase.OrderDetails;
import pl.coderslab.zdatabase.TransportOrder;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/dispatch")
public class DispatchController {
    private TransportOrderRepository transportOrderRepository;
    private AdminRepository adminRepository;
    private ContractorsRepository contractorsRepository;
    private PackagesRepository packagesRepository;
    private DriverRepository driverRepository;

    public DispatchController(TransportOrderRepository transportOrderRepository, AdminRepository adminRepository, ContractorsRepository contractorsRepository, PackagesRepository packagesRepository, DriverRepository driverRepository) {
        this.transportOrderRepository = transportOrderRepository;
        this.adminRepository = adminRepository;
        this.contractorsRepository = contractorsRepository;
        this.packagesRepository = packagesRepository;
        this.driverRepository = driverRepository;
    }

    @GetMapping("/add")
    public String addOrder(Model model){
        model.addAttribute("transportOrder", new TransportOrder());
        model.addAttribute("employees", adminRepository.findAll());
        model.addAttribute("packages", packagesRepository.findAll());
        model.addAttribute("contractors",contractorsRepository.findAll());
        return "/dispatch/add";
    }

    @PostMapping("/add")
    public String saveOrder(@Valid TransportOrder transportOrder, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            model.addAttribute("transportOrder", transportOrder);
            model.addAttribute("employees", adminRepository.findAll());
            model.addAttribute("packages", packagesRepository.findAll());
            model.addAttribute("contractors",contractorsRepository.findAll());
            return "/dispatch/add";
        }
        transportOrder.setStatus("active");
        Date currentDate = Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant());
        transportOrder.setDate(currentDate);
        transportOrderRepository.save(transportOrder);
        return "redirect:/dispatch/list";
    }
    @GetMapping("/list")
    public String OrdersList(Model model){
        model.addAttribute("transportOrder", transportOrderRepository.findAll());
        return "/dispatch/list";
    }

    @GetMapping("/edit/{id}")
    public String editOrder(@PathVariable long id, Model model) {
        model.addAttribute("transportOrder", new TransportOrder());
        model.addAttribute("employees", adminRepository.findAll());
        model.addAttribute("packages", packagesRepository.findAll());
        model.addAttribute("contractors",contractorsRepository.findAll());
        return "/dispatch/add";
    }
    @PostMapping("/edit/{id}")
    public String editOrder(@PathVariable long id, @Valid TransportOrder transportOrder, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("employees", adminRepository.findAll());
            model.addAttribute("packages", packagesRepository.findAll());
            model.addAttribute("contractors", contractorsRepository.findAll());
            return "/dispatch/add";
        }
        transportOrder.setStatus("active");
        model.addAttribute("transportOrder", transportOrder);
        TransportOrder existing = transportOrderRepository.findTransportOrdersById(id);
        existing.setTrailerNum(transportOrder.getTrailerNum());
        existing.setDestCity(transportOrder.getDestCity());
        existing.setDestState(transportOrder.getDestState());
        existing.setContractors(transportOrder.getContractors());
        existing.setEmployees(transportOrder.getEmployees());
        existing.setPackages(transportOrder.getPackages());
        transportOrderRepository.save(existing);
        return "redirect:/dispatch/list";
    }


    @GetMapping("/delete/{id}")
    public String deleteOrder(@PathVariable long id, Model model) {
        TransportOrder transportOrder = transportOrderRepository.findTransportOrdersById(id);
        model.addAttribute("transportOrder", transportOrder);
        return "/dispatch/delete";
    }

    @PostMapping("/delete/{id}")
    public String deleteOrderPost(@PathVariable long id, Model model) {
        try {
            TransportOrder transportOrder = transportOrderRepository.findTransportOrdersById(id);
            transportOrderRepository.delete(transportOrder);
        }catch (DataIntegrityViolationException e) {
            return "/dispatch/error";
        }
        return "redirect:/dispatch/list";
    }

    @GetMapping("/details/{id}")
    public String transportOrderDetails(@PathVariable long id, Model model) {
        List<OrderDetails> orderDetails = driverRepository.findAllTransportDetailsByTransportOrderId(id);
        model.addAttribute("orderDetails", orderDetails);
        return "/dispatch/listDetails";
    }

}
