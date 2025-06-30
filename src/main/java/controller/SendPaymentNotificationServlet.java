package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

@WebServlet("/sendPaymentNotification")
public class SendPaymentNotificationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String emailTo = "your-email@gmail.com"; // TODO: Thay bằng email của bạn
        String subject = "[RecipeHub] User " + username + " đã xác nhận thanh toán";
        String content = "User: " + username + " vừa xác nhận đã chuyển khoản mua Premium lúc " + new Date();

        response.setContentType("text/plain;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            sendEmail(emailTo, subject, content);
            out.print("success");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("fail");
        }
    }

    private void sendEmail(String to, String subject, String content) throws Exception {
        String from = "quandeptraixuhue@gmail.com"; // TODO: Thay bằng email gửi
        String pass = "oxek wybs gxfu xzgk";    // TODO: Thay bằng app password (không phải mật khẩu thường)

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, pass);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject(subject);
        message.setText(content);

        Transport.send(message);
    }
} 