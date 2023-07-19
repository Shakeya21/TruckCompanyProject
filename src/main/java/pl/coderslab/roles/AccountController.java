package pl.coderslab.roles;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.admin.AdminRepository;
import pl.coderslab.zdatabase.Employees;
import pl.coderslab.zdatabase.Role;
import pl.coderslab.zdatabase.UserAcc;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.HashSet;

@Controller
@RequestMapping("/admin/account")
public class AccountController {
    private final RoleRepository roleRepository;
    private final UserAccRepository userAccRepository;
    private final AdminRepository adminRepository;
    private final BCryptPasswordEncoder passwordEncoder;


    public AccountController(RoleRepository roleRepository, UserAccRepository userAccRepository, AdminRepository adminRepository, BCryptPasswordEncoder passwordEncoder) {
        this.roleRepository = roleRepository;
        this.userAccRepository = userAccRepository;
        this.adminRepository = adminRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/edit/{id}")
    public String editAcc(@PathVariable long id, Model model) {
        UserAcc userAcc = userAccRepository.findUserAccById(id);
        userAcc.setPassword("");
        model.addAttribute("userAcc", userAcc);
        model.addAttribute("role", roleRepository.findAll());
        return "roles/edit";
    }

    @PostMapping("/edit/{id}")
    public String saveEdited(@PathVariable long id,
                             @Valid UserAcc userAcc, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("userAcc", userAcc);
            model.addAttribute("roles", roleRepository.findAll());
            return "/roles/edit";
        }
        model.addAttribute("roles", roleRepository.findAll());
        model.addAttribute("userAcc", userAcc);
        UserAcc existing = userAccRepository.findUserAccById(id);
        existing.setUsername(userAcc.getUsername());
        if (!userAcc.getPassword().isEmpty()) {
            existing.setPassword(passwordEncoder.encode(userAcc.getPassword()));
        }
        existing.setEmail(userAcc.getEmail());
        existing.setRoles(userAcc.getRoles());

        Employees employeesById = adminRepository.findEmployeesById(existing.getId());
        employeesById.setEmail(existing.getEmail());

        userAccRepository.save(existing);
        adminRepository.save(employeesById);
        return "redirect:/admin/list";

    }

    @GetMapping("/create-user")
    @ResponseBody
    public String createUser() {
        UserAcc user = new UserAcc();
        user.setUsername("admin");
        user.setPassword(passwordEncoder.encode("admin"));

        Role userRole = roleRepository.findByRoleName("ROLE_USER");
        user.setRoles(new HashSet<>(Arrays.asList(userRole)));
        userAccRepository.save(user);
        return "admin";
    }
}
