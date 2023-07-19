package pl.coderslab.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.dispatch.PackagesRepository;
import pl.coderslab.zdatabase.Packages;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin/packages")
public class PackagesController {
    private final PackagesRepository packagesRepository;

    public PackagesController(PackagesRepository packagesRepository) {
        this.packagesRepository = packagesRepository;
    }

    @GetMapping("/add")
    public String addPackage(Model model) {
        model.addAttribute("packages", new Packages());
        return "admin/addPackage";
    }

    @PostMapping("/add")
    public String savePackage(@Valid Packages packages, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("packages", packages);
            return "/admin/addPackage";
        }
        packagesRepository.save(packages);
        return "redirect:/admin/packages/list";
    }

    @GetMapping("/list")
    public String contractorList(Model model) {
        model.addAttribute("packages", packagesRepository.findAll());
        return "admin/listPackage";
    }

    @GetMapping("/edit/{id}")
    public String editEmployee(@PathVariable long id, Model model) {
        model.addAttribute("packages", packagesRepository.findById(id));
        return "admin/addPackage";
    }

    @PostMapping("/edit/{id}")
    public String saveEdited(@PathVariable long id,
                             @Valid Packages packages, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("packages", packages);
            return "admin/addPackage";
        }
        model.addAttribute("packages", packages);
        Packages existing = packagesRepository.findPackagesById(id);
        existing.setLoadType(packages.getLoadType());
        existing.setTrailerType(packages.getTrailerType());
        packagesRepository.save(existing);
        return "redirect:/admin/packages/list";
    }
}