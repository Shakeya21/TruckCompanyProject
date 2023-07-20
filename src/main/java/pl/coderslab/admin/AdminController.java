package pl.coderslab.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.roles.RoleRepository;
import pl.coderslab.zdatabase.Employees;
import pl.coderslab.zdatabase.Role;
import pl.coderslab.zdatabase.UserAcc;

import javax.validation.Valid;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private final AdminRepository adminRepository;
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public AdminController(AdminRepository adminRepository, UserRepository userRepository, RoleRepository roleRepository) {
        this.adminRepository = adminRepository;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    @GetMapping("/add")
    public String addEmployee(Model model) {
        model.addAttribute("employees", new Employees());
        List<Role> roles = roleRepository.findAll();
        model.addAttribute("roles", roles);
        return "admin/add";
    }

    @PostMapping("/add")
    public String saveEmployee(@Valid Employees employees, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("employees", employees);
            List<Role> roles = roleRepository.findAll();
            model.addAttribute("roles", roles);
            return "/admin/add";
        }

        UserAcc user = new UserAcc();
        Role defaultRole = roleRepository.findByRoleName("User");
        user.setRoles(Set.of(defaultRole));
        String login = generateUniqueLogin(employees.getFirstName(), employees.getLastName());
        user.setUsername(login);
        user.setEmail(employees.getEmail());
        user.setEmployees(employees);
//        user.setPassword(generateRandomPassword());
//        user.setUserAccs(Set.of(user));
//        user.setRoles(Set.of(new Role()));
        userRepository.save(user);
        adminRepository.save(employees);
        return "redirect:/admin/list";
    }

    @GetMapping("/list")
    public String employeeList(Model model) {
        model.addAttribute("employees", adminRepository.findAll());
        return "admin/list";
    }

    @GetMapping("/edit/{id}")
    public String editEmployee(@PathVariable long id, Model model) {
        model.addAttribute("employees", adminRepository.findById(id));
        return "admin/add";
    }

    @PostMapping("/edit/{id}")
    public String saveEdited(@PathVariable long id,
                             @Valid Employees employees, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("employees", employees);
            return "admin/add";
        }
        model.addAttribute("employees", employees);
        Employees existing = adminRepository.findEmployeesById(id);
        existing.setFirstName(employees.getFirstName());
        existing.setLastName(employees.getLastName());
        existing.setEmail(employees.getEmail());
        existing.setDriverNumber(employees.getDriverNumber());
        existing.setDateOfBirth(employees.getDateOfBirth());
        existing.setLicenseNumber(employees.getLicenseNumber());

        UserAcc userAcc = userRepository.findUserAccByEmployeesId(existing.getId());
        userAcc.setEmail(existing.getEmail());

        userRepository.save(userAcc);
        adminRepository.save(existing);
        return "redirect:/admin/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteEmployee(@PathVariable long id, Model model) {
        Employees employees = adminRepository.findEmployeesById(id);
        model.addAttribute("employees", employees);
        return "admin/delete";
    }

    @PostMapping("/delete/{id}")
    public String deleteEmployeePost(@PathVariable long id, Model model) {
        Employees employees = adminRepository.findEmployeesById(id);
        UserAcc userAcc = userRepository.findUserAccByEmployeesId(employees.getId());
        userAcc.getRoles().clear();
        userRepository.delete(userAcc);
        adminRepository.delete(employees);
        return "redirect:/admin/list";
    }


    private String generateLogin(String firstName, String lastName) {
        String login = "";
        if (StringUtils.hasText(firstName)) {
            login += firstName.substring(0, 1);
        }
        if (StringUtils.hasText(lastName)) {
            login += StringUtils.capitalize(lastName.substring
                    (0, Math.min(lastName.length(), 5)).replaceAll("\\s+", ""));
        }
        return login;
    }

    private String generateUniqueLogin(String firstName, String lastName) {
        String baseLogin = generateLogin(firstName, lastName);
        String login = baseLogin;
        int counter = 1;

        while (userRepository.existsByUsername(login)) {
            login = baseLogin + counter;
            counter++;
            if (counter > 1000) {
                throw new IllegalStateException("Nie można wygenerować unikalnego loginu. Przekroczono zakres.");
            }
        }
        return login;
    }

//    private String generateRandomPassword() {
//        String randomPasswd = UUID.randomUUID().toString().substring(0, 8);
//        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//        String hashedPasswd = passwordEncoder.encode(randomPasswd);
//        return hashedPasswd;
//    }
}
