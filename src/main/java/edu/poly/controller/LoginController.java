package edu.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.poly.dao.AccountDAO;
import edu.poly.entity.Account;
import edu.poly.service.SessionService;

@Controller
public class LoginController {

    @Autowired
    AccountDAO dao;

    @Autowired
    SessionService session;

    @GetMapping("/sign-in")
    public String signin() {
        return "signin";
    }

    @PostMapping("/sign-in")
    public String signin_signin(
            RedirectAttributes redirectAttributes,
            @RequestParam("username") String username,
            @RequestParam("password") String password) {

        if (username.isEmpty()) {
            redirectAttributes.addFlashAttribute(
                    "error_signin_username",
                    "Username empty!");
            return "redirect:/sign-in";
        }

        if (password.isEmpty()) {
            redirectAttributes.addFlashAttribute(
                    "error_signin_password",
                    "Password empty!");
            redirectAttributes.addFlashAttribute(
                    "username",
                    username);
            return "redirect:/sign-in";
        }

        // Tìm theo username
        Account account = dao.findByUsername(username).orElse(null);

        if (account == null) {
            redirectAttributes.addFlashAttribute(
                    "error_signin_username",
                    "Username not exists!");
            redirectAttributes.addFlashAttribute(
                    "username",
                    username);
            return "redirect:/sign-in";
        }

        if (!account.getPassword().equals(password)) {
            redirectAttributes.addFlashAttribute(
                    "error_signin_password",
                    "Password invalid!");
            redirectAttributes.addFlashAttribute(
                    "username",
                    username);
            return "redirect:/sign-in";
        }

        // Lưu session
        session.set("user", account);

        return "redirect:/";
    }

    @GetMapping("/sign-up")
    public String signup(
            Model model,
            @ModelAttribute("account") Account account) {

        return "signup";
    }

    @PostMapping("/sign-up")
    public String signup_signup(
            Model model,
            @Validated @ModelAttribute("account") Account account,
            BindingResult result,
            @RequestParam("confirm") String confirm) {

        if (result.hasErrors()) {
            result.getAllErrors().forEach(
                    error -> System.out.println(
                            error.getDefaultMessage()));
            return "signup";
        }

        if (!account.getPassword().equals(confirm)) {
            model.addAttribute(
                    "error_signup_confirm",
                    "Confirm password invalid!");
            return "signup";
        }

        // Kiểm tra username đã tồn tại chưa
        if (dao.findByUsername(account.getUsername()) != null) {
            model.addAttribute(
                    "error_signup_username",
                    "Username already exists!");
            return "signup";
        }

        try {
            dao.save(account);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute(
                    "error_signup",
                    "Lỗi database: " + e.getMessage());
            return "signup";
        }

        return "signin";
    }
}