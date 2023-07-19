package pl.coderslab.logins;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {
    @GetMapping("/login")
    public String login() {
        return "pages/login";
    }

//    @PostMapping("/login")
//    public String loginPost() {
//        return "redirect:/";
//    }

    @GetMapping("/logout")
    public String logout() {
        return "pages/logout";
    }
//    @PostMapping("/logout")
//    public String logoutPost(){
//        return "redirect:/";
//    }
    @GetMapping("/403")
    public String accesDenied(){
        return "pages/403";
    }
}
