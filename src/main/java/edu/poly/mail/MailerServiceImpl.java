package edu.poly.mail;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import edu.poly.model.MailInfo;

@Service
public class MailerServiceImpl implements MailerService {

    @Autowired(required = false)   // ← Sửa ở đây
    private JavaMailSender sender;

    private List<MailInfo> list = new ArrayList<>();

    @Override
    public void send(MailInfo mail) throws MessagingException {
        // Kiểm tra nếu mail sender chưa được config thì bỏ qua
        if (sender == null) {
            System.out.println("⚠️ Mail sender is not configured. Skipping email send to: " + mail.getTo());
            return;
        }

        MimeMessage message = sender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

        helper.setFrom(mail.getFrom());
        helper.setTo(mail.getTo());
        helper.setSubject(mail.getSubject());
        helper.setReplyTo(mail.getFrom());

        if (mail.getCc() != null && mail.getCc().length > 0) {
            helper.setCc(mail.getCc());
        }

        if (mail.getBcc() != null && mail.getBcc().length > 0) {
            helper.setBcc(mail.getBcc());
        }

        if (mail.getAttachments() != null && mail.getAttachments().length > 0) {
            for (String path : mail.getAttachments()) {
                File file = new File(path);
                helper.addAttachment(file.getName(), file);
            }
        }

        // 🌟 Nội dung email HTML chuyên nghiệp hơn
        String emailContent = "<div style='font-family: Arial, sans-serif; font-size: 14px; color: #333;'>"
                + "<h2 style='color: #007bff;'>Thông báo từ hệ thống</h2>"
                + "<p>Xin chào <strong>" + mail.getTo() + "</strong>,</p>"
                + "<p>Bạn nhận được email này vì có một yêu cầu liên quan đến tài khoản của bạn.</p>"
                + "<p style='font-size: 16px; font-weight: bold;'>" + mail.getBody() + "</p>"
                + "<p>Vui lòng làm theo hướng dẫn để hoàn tất quá trình.</p>"
                + "<hr style='margin: 20px 0;'>"
                + "<p style='color: #777;'>Trân trọng, <br>Hệ thống hỗ trợ khách hàng</p>"
                + "</div>";

        helper.setText(emailContent, true); // ✅ Kích hoạt HTML cho email

        sender.send(message);
    }

    @Override
    public void send(String to, String subject, String body) throws MessagingException {
        this.send(new MailInfo(to, subject, body));
    }

    @Override
    public void queue(MailInfo mail) {
        list.add(mail);
    }

    @Override
    public void queue(String to, String subject, String body) {
        queue(new MailInfo(to, subject, body));
    }

    // 🔄 Tự động gửi email từ hàng đợi mỗi 15 giây
    @Scheduled(fixedDelay = 15000)
    public void run() {
        while (!list.isEmpty()) {
            MailInfo mail = list.remove(0);
            try {
                this.send(mail);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}