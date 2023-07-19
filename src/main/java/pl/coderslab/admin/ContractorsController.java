package pl.coderslab.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.dispatch.ContractorsRepository;
import pl.coderslab.zdatabase.Contractors;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin/contractor")
public class ContractorsController {
    private final ContractorsRepository contractorsRepository;

    public ContractorsController(ContractorsRepository contractorsRepository) {
        this.contractorsRepository = contractorsRepository;
    }

    @GetMapping("/add")
    public String addContractor(Model model) {
        model.addAttribute("contractors", new Contractors());
        return "admin/addContractor";
    }

    @PostMapping("/add")
    public String saveContractor(@Valid Contractors contractors, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("contractors", contractors);
            return "/admin/addContractor";
        }
        contractorsRepository.save(contractors);
        return "redirect:/admin/contractor/list";
    }

    @GetMapping("/list")
    public String contractorList(Model model) {
        model.addAttribute("contractors", contractorsRepository.findAll());
        return "admin/listContractor";
    }

    @GetMapping("/edit/{id}")
    public String editEmployee(@PathVariable long id, Model model) {
        model.addAttribute("contractors", contractorsRepository.findById(id));
        return "admin/addContractor";
    }

    @PostMapping("/edit/{id}")
    public String saveEdited(@PathVariable long id,
                             @Valid Contractors contractors, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("contractors", contractors);
            return "admin/addContractor";
        }
        model.addAttribute("contractors", contractors);
        Contractors existing = contractorsRepository.findContractorsById(id);
        existing.setName(contractors.getName());
        existing.setNip(contractors.getNip());
        existing.setRegon(contractors.getRegon());
        contractorsRepository.save(existing);
        return "redirect:/admin/contractor/list";
    }
}
