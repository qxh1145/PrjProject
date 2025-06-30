package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import org.json.JSONObject;

@WebServlet("/confirmPayment")
public class ConfirmPaymentServlet extends HttpServlet {
    private static final String ADMIN_EMAIL = "knightdragon184@gmail.com"; // Admin email address
    private static final String EMAIL_PASSWORD = "jmxv sigc bksl uspv"; // Gmail app password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();
        try {
            // Lấy username từ session
            String username = null;
            if (request.getSession(false) != null) {
                Object userObj = request.getSession(false).getAttribute("user");
                if (userObj != null) {
                    username = userObj.toString();
                }
            }
            // Lấy userEmail từ input
            String userEmail = request.getParameter("userEmail");
            System.out.println("userEmail: " + userEmail);
            String amount = request.getParameter("amount");
            String plan = request.getParameter("plan");
            String paymentMethod = request.getParameter("paymentMethod");
            String requestType = request.getParameter("requestType");

            boolean emailSent = sendConfirmationEmailToAdmin(username, userEmail, amount, plan, paymentMethod, requestType);
            if (emailSent) {
                jsonResponse.put("success", true);
                jsonResponse.put("message", "The account upgrade request has been sent successfully.");
            } else {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Failed to send the account upgrade request.");
            }
        } catch (Exception e) {
            jsonResponse.put("success", false);
            jsonResponse.put("message", "Error: " + e.getMessage());
            e.printStackTrace();
        }
        out.print(jsonResponse.toString());
    }

    private boolean sendConfirmationEmailToAdmin(String username, String userEmail, String amount, String plan, String paymentMethod, String requestType) {
        try {
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");

            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(ADMIN_EMAIL, EMAIL_PASSWORD);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(ADMIN_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(ADMIN_EMAIL));
            message.setSubject("ACCOUNT UPGRADE REQUEST - " + (username != null ? username : userEmail));

            String emailContent = String.format(
                "Hello Admin,\n\n" +
                "A user has confirmed successful payment and requested an account upgrade:\n\n" +
                "Username: %s\n" +
                "User email: %s\n" +
                "Plan: %s\n" +
                "Amount: %s\n" +
                "Payment method: %s\n" +
                "Confirmation time: %s\n\n" +
                "Please verify the payment and proceed to upgrade this user's account.\n\n" +
                "Best regards,\n" +
                "How to Cook Recipes System",
                username != null ? username : "(not logged in)", userEmail, "Lifetime", "100.000VND", "QR Code", new java.util.Date()
            );
            message.setText(emailContent);
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}
