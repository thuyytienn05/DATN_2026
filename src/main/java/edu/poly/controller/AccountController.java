package edu.poly.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import edu.poly.dao.OrderDAO;
import edu.poly.entity.Order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.dao.OrderDetailDAO;
import edu.poly.dao.AccountDAO;
import edu.poly.entity.Account;
import edu.poly.mail.MailerServiceImpl;
import edu.poly.service.SessionService;

@Controller
public class AccountController {

    @Autowired
    AccountDAO dao;


    @Autowired
    OrderDetailDAO orderDetailDao;
    
    @Autowired
    SessionService session;

    @Autowired
    MailerServiceImpl mail;

    static int codeForgot = 0;

    @GetMapping("/forgot-password")
    public String forgotPassword() {
        return "forgot-password";
    }
    @Autowired
OrderDAO orderDao;

@GetMapping("/account/lich-su-don-hang")
public String orderHistory(Model model) {
    Account user = session.get("user");
    if (user == null) {
        return "redirect:/sign-in";
    }
    List<Order> orders = orderDao.findByAccountOrderByCreateDateDesc(user);
    model.addAttribute("orders", orders);
    return "lichsu-donhang";
}
@GetMapping("/order/delete/{id}")
public String deleteOrder(@PathVariable("id") Long id, HttpSession httpSession) {
    
    Account user = (Account) httpSession.getAttribute("user");
    
    if (user == null) {
        return "redirect:/sign-in";
    }
    
    Order order = orderDao.findById(id).orElse(null);
    
    if (order == null || !order.getAccount().getUsername().equals(user.getUsername())) {
        return "redirect:/account/lich-su-don-hang";
    }
    
    try {
        // Xóa chi tiết đơn hàng trước
        orderDetailDao.deleteByOrderId(id);
        
        // Sau đó xóa đơn hàng
        orderDao.delete(order);
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    return "redirect:/account/lich-su-don-hang";
}
// AccountController.java
@GetMapping("/account/logout-to-home")
public String logoutToHome(HttpServletRequest request) {
    HttpSession session = request.getSession(false);
    if (session != null) {
        session.invalidate();
    }
    return "redirect:/"; 
}
    @PostMapping("/forgot-password")
    public String forgotPassword_find(Model model,
            @RequestParam("username") String username) {

        if (username.isEmpty()) {
            model.addAttribute(
                    "error_forgot_username",
                    "Vui lòng nhập tên đăng nhập!");
            return "forgot-password";
        }

        Account acc = dao.findByUsername(username).orElse(null);

        if (acc == null) {
            model.addAttribute("username", username);
            model.addAttribute(
                    "error_forgot_username",
                    "Tên đăng nhập không tồn tại!");
            return "forgot-password";
        }

        codeForgot = 100000 + (int) (Math.random() * 900000);

        String email = acc.getEmail();

        String emailContent =
                "<div style='font-family: Arial, sans-serif; font-size: 14px; color: #333;'>"
                        + "<h2 style='color: #007bff;'>🔒 Yêu cầu đặt lại mật khẩu</h2>"
                        + "<p>Xin chào <strong>" + username + "</strong>,</p>"
                        + "<p>Bạn vừa yêu cầu đặt lại mật khẩu cho tài khoản của mình.</p>"
                        + "<p>Vui lòng sử dụng mã xác thực dưới đây để tiếp tục quá trình:</p>"
                        + "<h3 style='color:red;font-size:20px;'>"
                        + codeForgot
                        + "</h3>"
                        + "<p>Hoặc nhấn vào đường link sau để đặt lại mật khẩu:</p>"
                        + "<p><a href='http://localhost:8080/reset-password/"
                        + username
                        + "/"
                        + codeForgot
                        + "' style='color:#28a745;font-weight:bold;'>"
                        + "Đặt lại mật khẩu"
                        + "</a></p>"
                        + "<p>Nếu bạn không yêu cầu, hãy bỏ qua email này.</p>"
                        + "<hr>"
                        + "<p style='color:#777;'>Trân trọng,<br>Hệ thống hỗ trợ khách hàng</p>"
                        + "</div>";

        mail.queue(
                email,
                "🔒 Đặt lại mật khẩu",
                emailContent);

        model.addAttribute(
                "success_forgot_username",
                "Mã xác thực đã được gửi đến email của bạn!");

        return "forgot-password";
    }

    @GetMapping("/reset-password/{username}/{otp}")
    public String resetPassword(
            Model model,
            @PathVariable("username") String username,
            @PathVariable("otp") Integer otp) {

        Account acc = dao.findByUsername(username).orElse(null);

        if (acc == null) {
            return "forgot-password";
        }

        if (!otp.equals(codeForgot)) {
            return "forgot-password";
        }

        model.addAttribute("username", username);
        return "reset-password";
    }

    @PostMapping("/reset-password/{username}")
    public String resetPassword_reset(
            Model model,
            @PathVariable("username") String username,
            @RequestParam("password") String password,
            @RequestParam("confirm") String confirm) {

        Account acc = dao.findByUsername(username).orElse(null);

        if (acc == null) {
            return "forgot-password";
        }

        if (password.isEmpty()) {
            model.addAttribute(
                    "error_resetPassword_password",
                    "Password empty!");
        }
        else if (confirm.isEmpty()) {
            model.addAttribute(
                    "error_resetPassword_confirm",
                    "Confirm password empty!");
        }
        else if (!password.equals(confirm)) {
            model.addAttribute(
                    "error_resetPassword_confirm",
                    "Confirm password invalid!");
        }
        else {
            acc.setPassword(password);
            dao.save(acc);

            model.addAttribute(
                    "success_resetPassword",
                    "Reset password success!");
        }

        model.addAttribute("username", username);
        return "reset-password";
    }

    @GetMapping("/account/index")
    public String index() {
        return "profile-account";
    }

    @GetMapping("/account/logout")
    public String logout() {
        session.remove("user");
        session.remove("totalCart");
        session.remove("numberCart");
        return "signin";
    }

    @PostMapping("/account/change-password")
    public String change_password(
            Model model,
            @RequestParam("oldPass") String oldPass,
            @RequestParam("newPass") String newPass,
            @RequestParam("confirm-newPass") String confirm) {

        Account user = session.get("user");

        if (user == null) {
            return "redirect:/sign-in";
        }

        if (!user.getPassword().equals(oldPass)) {
            model.addAttribute(
                    "error_changePassword",
                    "Old password invalid!");
            return "profile-account";
        }

        if (!newPass.equals(confirm)) {
            model.addAttribute(
                    "error_changePassword",
                    "Confirm password invalid!");
            return "profile-account";
        }

        user.setPassword(newPass);
        dao.save(user);

        session.set("user", user);

        model.addAttribute(
                "success_changePassword",
                "Change password success!");

        return "profile-account";
    }
}