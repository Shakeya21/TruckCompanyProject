package pl.coderslab.logins;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.admin.AdminRepository;
import pl.coderslab.roles.RoleRepository;
import pl.coderslab.roles.UserAccRepository;
import pl.coderslab.zdatabase.Employees;
import pl.coderslab.zdatabase.Role;
import pl.coderslab.zdatabase.UserAcc;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.Set;

@Controller
public class FirstUserController {
    private final AdminRepository adminRepository;
    private final UserAccRepository userAccRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public FirstUserController(AdminRepository adminRepository, UserAccRepository userAccRepository, RoleRepository roleRepository, BCryptPasswordEncoder passwordEncoder) {
        this.adminRepository = adminRepository;
        this.userAccRepository = userAccRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/create-user")
    @ResponseBody
    public String createUser() {
        if (userAccRepository.existsByUsername("admin")){
            return "Użytkownik już istnieje";
        }
        Employees employees = new Employees();
        employees.setFirstName("Admin");
        employees.setLastName("Admin");
        employees.setEmail("Admin@op.pl");
        employees.setLicenseNumber("unknown");
        employees.setDriverNumber("unknown");
        Date currentDate = Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant());
        employees.setDateOfBirth(currentDate);
        adminRepository.save(employees);

        UserAcc userAcc = new UserAcc();
        userAcc.setEmail(employees.getEmail());
        userAcc.setUsername("admin");
        userAcc.setPassword(passwordEncoder.encode("admin"));
        userAcc.setEmployees(employees);

        Role role = roleRepository.findByRoleName("Admin");
        if (role == null) {
            role = new Role();
            role.setRoleName("Admin");
            roleRepository.save(role);
        }
        userAcc.setRoles(Set.of(role));
        userAccRepository.save(userAcc);
        return "admin";
    }
}
