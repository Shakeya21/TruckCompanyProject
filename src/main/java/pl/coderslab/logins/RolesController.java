package pl.coderslab.logins;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.roles.RoleRepository;
import pl.coderslab.zdatabase.Role;

@Controller
public class RolesController {
    private final RoleRepository roleRepository;

    public RolesController(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }
    @GetMapping("/create-roles")
    @ResponseBody
    public String createRoles() {
        if (roleRepository.findByRoleName("Admin") == null) {
            Role adminRole = new Role();
            adminRole.setRoleName("Admin");
            roleRepository.save(adminRole);
        }

        if (roleRepository.findByRoleName("Dispatch") == null) {
            Role dispatchRole = new Role();
            dispatchRole.setRoleName("Dispatch");
            roleRepository.save(dispatchRole);
        }

        if (roleRepository.findByRoleName("User") == null) {
            Role userRole = new Role();
            userRole.setRoleName("User");
            roleRepository.save(userRole);
        }

        return "Roles Added";
    }
}
