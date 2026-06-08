package edu.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.dao.AccountDAO;
import edu.poly.entity.Account;
import edu.poly.mail.MailerServiceImpl;
import edu.poly.service.SessionService;

@Controller
public class AccountController {
	
	@Autowired
	AccountDAO dao;
	
	@Autowired
	SessionService session;
	
	@Autowired
	MailerServiceImpl mail;
	
	static int codeForgot = 0;
	
	@GetMapping("/forgot-password")
	public String forgotPassword() {
		return "forgot-password";
	}
	
	@PostMapping("/forgot-password")
	public String forgotPassword_find(Model model, @RequestParam("username") String username) {
	    if (username.isEmpty()) {
	        model.addAttribute("error_forgot_username", "Vui lòng nhập tên đăng nhập!");
	    } else if (!dao.existsById(username)) {
	        model.addAttribute("username", username);
	        model.addAttribute("error_forgot_username", "Tên đăng nhập không tồn tại!");
	    } else {
	        // Tạo mã xác thực OTP ngẫu nhiên 6 chữ số
	        codeForgot = 100000 + (int) (Math.random() * 900000); 
	        
	        // Lấy email từ tài khoản
	        String email = dao.findById(username).get().getEmail();
	        
	        // 🌟 Nội dung email chuyên nghiệp hơn
	        String emailContent = "<div style='font-family: Arial, sans-serif; font-size: 14px; color: #333;'>"
	                + "<h2 style='color: #007bff;'>🔒 Yêu cầu đặt lại mật khẩu</h2>"
	                + "<p>Xin chào <strong>" + username + "</strong>,</p>"
	                + "<p>Bạn vừa yêu cầu đặt lại mật khẩu cho tài khoản của mình.</p>"
	                + "<p>Vui lòng sử dụng mã xác thực dưới đây để tiếp tục quá trình:</p>"
	                + "<h3 style='color: red; font-size: 20px;'>" + codeForgot + "</h3>"
	                + "<p>Hoặc nhấn vào đường link sau để đặt lại mật khẩu:</p>"
	                + "<p><a href='http://localhost:8080/reset-password/" + username + "/" + codeForgot 
	                + "' style='color: #28a745; font-weight: bold;'>Đặt lại mật khẩu</a></p>"
	                + "<p>Nếu bạn không yêu cầu, hãy bỏ qua email này.</p>"
	                + "<hr>"
	                + "<p style='color: #777;'>Trân trọng, <br>Hệ thống hỗ trợ khách hàng</p>"
	                + "</div>";

	        // Gửi email qua hệ thống mail
	        mail.queue(email, "🔒 Đặt lại mật khẩu", emailContent);
	        
	        model.addAttribute("success_forgot_username", "Mã xác thực đã được gửi đến email của bạn!");
	    }
	    return "forgot-password";
	}

	
	@GetMapping("/reset-password/{username}/{otp}")
	public String resetPassword(Model model, @PathVariable("username") String username, @PathVariable("otp") Integer otp) {
		if(dao.existsById(username)) {
			if(otp == codeForgot) {
				model.addAttribute("username", username);
				return "reset-password";
			}
			else 
				return "forgot-password";
		}
		return "forgot-password";
	}
	
	@PostMapping("/reset-password/{username}")
	public String resetPassword_reset(Model model, @PathVariable("username") String username, @RequestParam("password") String password, @RequestParam("confirm") String confirm) {
		if(dao.existsById(username)) {
			if(password.equals(""))
				model.addAttribute("error_resetPassword_password", "Password empty!");
			else if(confirm.equals(""))
				model.addAttribute("error_resetPassword_confirm", "Confirm password empty!");
			else if(!confirm.equals(password))
				model.addAttribute("error_resetPassword_confirm", "Confirm password invalid!");
			else {
				Account acc = dao.findById(username).get();
				acc.setPassword(password);
				dao.save(acc);
				model.addAttribute("success_resetPassword", "Reset password success!");
			}
			return "reset-password";
		}
		return "forgot-password";
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
	public String change_password(Model model, @RequestParam("oldPass") String oldPass, @RequestParam("newPass") String newPass, @RequestParam("confirm-newPass") String confirm) {
		Account user = session.get("user");
		if(user.getPassword().equals(oldPass)) {
			if(newPass.equals(confirm)) {
				user.setPassword(newPass);
				dao.save(user);
				model.addAttribute("success_changePassword", "Change password success!");
			}
			else 
				model.addAttribute("error_changePassword", "Confirm password invalid!");
		}
		else 
			model.addAttribute("error_changePassword", "Old password invalid!");
		return "profile-account";
	}
}
