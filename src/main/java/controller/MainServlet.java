package controller;

import dao.UserDAO;
import dao.PaymentDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
<<<<<<< HEAD
import java.io.BufferedReader;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import model.User;
import model.Payment;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
=======
import java.util.List;
import java.util.Scanner;
import model.User;
import org.json.JSONArray;
import org.json.JSONObject;
>>>>>>> 90e75cb285a43ef1da25ced5dd4484be0c7172b1

@WebServlet(name = "MainServlet", urlPatterns = {"/main"})
public class MainServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
<<<<<<< HEAD
        try {
            String action = request.getParameter("action");
            if (action == null) {
=======
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        switch (action) {
            case "feed":
                handleFeed(request, response);
                break;
            case "navigation":
                handleNavigation(request, response);
                break;
            case "login":
                handleLoginGet(request, response);
                break;
            case "logout":
                handleLogout(request, response);
                break;
            case "register":
                handleRegisterGet(request, response);
                break;
            case "post":
                handlePostGet(request, response);
                break;
            case "recipe":
                handleRecipePage(request, response);
                break;
            case "recipeOverview":
                handleRecipeOverview(request, response);
                break;
            case "recipeDetail":
                handleRecipeDetail(request, response);
                break;
            case "adminPanel":
                handleAdminPanel(request, response);
                break;
            case "getUsers":
                handleGetUsers(request, response);
                break;
            case "updateAccountType":
                handleUpdateAccountType(request, response);
                break;
            default:
>>>>>>> 90e75cb285a43ef1da25ced5dd4484be0c7172b1
                response.sendRedirect("index.jsp");
                return;
            }
            switch (action) {
                case "feed":
                    handleFeed(request, response);
                    break;
                case "navigation":
                    handleNavigation(request, response);
                    break;
                case "login":
                    handleLoginGet(request, response);
                    break;
                case "logout":
                    handleLogout(request, response);
                    break;
                case "register":
                    handleRegisterGet(request, response);
                    break;
                case "post":
                    handlePostGet(request, response);
                    break;
                case "recipe":
                    handleRecipePage(request, response);
                    break;
                case "recipeOverview":
                    handleRecipeOverview(request, response);
                    break;
                case "recipeDetail":
                    handleRecipeDetail(request, response);
                    break;
                case "createPayment":
                    handleCreatePayment(request, response);
                    break;
                case "checkPayment":
                    handleCheckPayment(request, response);
                    break;
                case "paymentCallback":
                    handlePaymentCallback(request, response);
                    break;
                default:
                    response.sendRedirect("index.jsp");
            }
        } catch (NamingException ex) {
            Logger.getLogger(MainServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(MainServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        switch (action) {
            case "login":
                handleLoginPost(request, response);
                break;
            case "register":
                handleRegisterPost(request, response);
                break;
            case "post":
                handlePostPost(request, response);
                break;
            default:
                doGet(request, response);
        }
    }

    // Logic từ FeedServlet
    private void handleFeed(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FeedServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // Logic từ NavigationServlet
    private void handleNavigation(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String navAction = request.getParameter("navAction");
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        String username = (String) session.getAttribute("username");
        if (navAction == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        switch (navAction) {
            case "recipe":
                handleRecipeNavigation(request, response);
                break;
            case "profile":
                response.sendRedirect("profile.jsp");
                break;
            case "dashboard":
                handleDashboardRedirect(response, role);
                break;
            case "posts":
                response.sendRedirect("posts.jsp");
                break;
            case "users":
                if ("admin".equals(role) || "manager".equals(role)) {
                    response.sendRedirect("user-management.jsp");
                } else {
                    response.sendRedirect("error.jsp?message=Unauthorized access");
                }
                break;
            case "settings":
                response.sendRedirect("settings.jsp");
                break;
            case "logout":
                response.sendRedirect("main?action=logout");
                break;
            default:
                response.sendRedirect("index.jsp");
        }
    }
    private void handleRecipeNavigation(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String category = request.getParameter("category");
        String recipe = request.getParameter("recipe");
        if (category != null && recipe != null) {
            request.getRequestDispatcher("view/recipe/" + category + "/" + recipe + ".jsp").forward(request, response);
        } else if (category != null) {
            request.getRequestDispatcher("view/recipe/" + category + "/index.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("view/recipe/coffee/htmcoldbrew.jsp").forward(request, response);
        }
    }
    private void handleDashboardRedirect(HttpServletResponse response, String role) throws IOException {
        if ("admin".equals(role)) {
            response.sendRedirect("admin/dashboard.jsp");
        } else if ("manager".equals(role)) {
            response.sendRedirect("manager/dashboard.jsp");
        } else {
            response.sendRedirect("user/dashboard.jsp");
        }
    }

    // Logic từ LoginHandle
    private void handleLoginGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect("indexLogin.jsp");
            return;
        }
        response.sendRedirect("login.jsp");
    }
    private void handleLoginPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
                request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
                return;
            }
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("user") != null) {
                response.sendRedirect("indexLogin.jsp");
                return;
            }
            UserDAO userDAO = new UserDAO();
            User user = userDAO.checkLogin(username, password);
            if (user != null) {
                session = request.getSession(true);
                session.setAttribute("user", username);
                session.setAttribute("userInfo", user);
                session.setAttribute("accountType", user.getAccountType());
                session.setMaxInactiveInterval(30 * 60);
                response.sendRedirect("indexLogin.jsp");
            } else {
                request.setAttribute("error", "Sai username hoặc password!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            System.err.println("Login error: " + e.getMessage());
            request.setAttribute("error", "Có lỗi xảy ra, vui lòng thử lại sau!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }

    // Logic từ LogoutServlet
    private void handleLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("index.jsp");
    }

    // Logic từ RegisterHandle
    private void handleRegisterGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    private void handleRegisterPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            if (!password.equals(confirmPassword)) {
                request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            UserDAO userDAO = new UserDAO();
            if (userDAO.checkUserExist(username)) {
                request.setAttribute("error", "Username đã tồn tại!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            User newUser = new User(username, password);
            boolean success = userDAO.registerUser(newUser);
            if (success) {
                HttpSession session = request.getSession();
                session.setAttribute("user", username);
                session.setAttribute("userInfo", newUser);
                response.sendRedirect("indexLogin.jsp");
            } else {
                request.setAttribute("error", "Có lỗi xảy ra trong quá trình đăng ký!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.err.println("Registration error: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    // Logic từ PostServlet (hiện tại chưa có xử lý gì)
    private void handlePostGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xử lý GET cho post nếu cần
    }
    private void handlePostPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xử lý POST cho post nếu cần
    }

    // Xử lý truy cập trang công thức động
    private void handleRecipePage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String type = request.getParameter("type");
        String name = request.getParameter("name");
        if (type != null && name != null) {
            // Phân quyền truy cập công thức
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            String accountType = (String) session.getAttribute("accountType");
            String path = "view/recipe/" + type + "/" + name + ".jsp";
            if ("Free".equalsIgnoreCase(accountType)) {
                request.setAttribute("showLockOverlay", true);
            }
            request.getRequestDispatcher(path).forward(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    // Trang tổng hợp công thức cho từng nhóm
    private void handleRecipeOverview(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String type = request.getParameter("type");
        if (type != null) {
            String path = "view/recipe/" + type + "/index.jsp";
            request.getRequestDispatcher(path).forward(request, response);
        } else {
            response.sendRedirect("indexLogin.jsp");
        }
    }

    private void handleRecipeDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getParameter("path");
        HttpSession session = request.getSession(false);
        boolean loggedIn = (session != null && session.getAttribute("user") != null);
        if (path != null && path.endsWith(".jsp")) {
            if (!loggedIn) {
                response.sendRedirect("login.jsp");
                return;
            }
            String username = (String) session.getAttribute("user");
            String accountType = (String) session.getAttribute("accountType");
            if (!"admin".equalsIgnoreCase(username) && accountType != null && accountType.trim().equalsIgnoreCase("free")) {
                request.setAttribute("showLockOverlay", true);
            }
            request.getRequestDispatcher(path).forward(request, response);
        } else {
            if (loggedIn) {
                response.sendRedirect("indexLogin.jsp");
            } else {
                response.sendRedirect("login.jsp");
            }
        }
    }

    private void handleCreatePayment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NamingException, SQLException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String username = (String) session.getAttribute("user");
        String transactionId = "TXN" + System.currentTimeMillis();
        double amount = 30000.0; // 30 USD = 30000 VND (simplified)
        String description = "Nâng cấp tài khoản Premium - How to Cook Recipes";
        
        System.out.println("Creating payment for user: " + username);
        System.out.println("Transaction ID: " + transactionId);
        
        Payment payment = new Payment(transactionId, username, amount, description);
        
        // Thêm thông tin ngân hàng mặc định
        payment.setBankCode("VCB");
        payment.setBankName("Vietcombank");
        payment.setAccountNumber("1234567890");
        payment.setAccountName("HOW TO COOK RECIPES");
        
        // Tạo QR data cho Vietcombank
        String qrData = String.format("970436|VCB|%s|%s|%.0f|%s", 
            payment.getAccountName(), 
            payment.getAccountNumber(), 
            payment.getAmount(), 
            payment.getDescription());
        payment.setQrData(qrData);
        
        System.out.println("QR Data: " + qrData);
        
        try {
            PaymentDAO paymentDAO = new PaymentDAO();
            boolean result = paymentDAO.createPayment(payment);
            
            System.out.println("Payment creation result: " + result);
            
            if (result) {
                // Lưu transactionId vào session để sử dụng ở trang payment.jsp
                session.setAttribute("currentTransactionId", transactionId);
                System.out.println("Payment created successfully, redirecting to payment.jsp");
                response.sendRedirect("payment.jsp");
            } else {
                System.out.println("Payment creation failed");
                response.sendRedirect("BuyPremium.jsp?error=payment_creation_failed");
            }
        } catch (Exception e) {
            System.err.println("Error creating payment: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("BuyPremium.jsp?error=payment_creation_failed&message=" + e.getMessage());
        }
    }
    
    private void handleCheckPayment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NamingException, SQLException {
        String transactionId = request.getParameter("transactionId");
        
        if (transactionId == null || transactionId.trim().isEmpty()) {
            sendJsonResponse(response, "error", "Transaction ID is required");
            return;
        }
        
        PaymentDAO paymentDAO = new PaymentDAO();
        Payment payment = paymentDAO.getPaymentByTransactionId(transactionId);
        
        if (payment == null) {
            sendJsonResponse(response, "error", "Payment not found");
            return;
        }
        
        // Kiểm tra nếu payment đã hết hạn
        if (payment.isExpired() && payment.isPending()) {
            paymentDAO.updatePaymentStatus(transactionId, "EXPIRED");
            payment.setStatus("EXPIRED");
        }
        
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("status", payment.getStatus());
        jsonResponse.addProperty("transactionId", payment.getTransactionId());
        jsonResponse.addProperty("amount", payment.getAmount());
        jsonResponse.addProperty("formattedAmount", payment.getFormattedAmount());
        jsonResponse.addProperty("description", payment.getDescription());
        jsonResponse.addProperty("createdAt", payment.getFormattedCreatedAt());
        jsonResponse.addProperty("expiryTime", payment.getFormattedExpiryTime());
        jsonResponse.addProperty("bankCode", payment.getBankCode());
        jsonResponse.addProperty("bankName", payment.getBankName());
        jsonResponse.addProperty("accountNumber", payment.getAccountNumber());
        jsonResponse.addProperty("accountName", payment.getAccountName());
        jsonResponse.addProperty("isExpired", payment.isExpired());
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
    }
    
    private void handlePaymentCallback(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Đọc dữ liệu từ request body
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        
        String callbackData = sb.toString();
        System.out.println("Payment callback received: " + callbackData);
        
        try {
            // Parse JSON callback data
            Gson gson = new Gson();
            JsonObject callback = gson.fromJson(callbackData, JsonObject.class);
            
            String transactionId = callback.get("transactionId").getAsString();
            String status = callback.get("status").getAsString();
            String bankCode = callback.get("bankCode").getAsString();
            String bankName = callback.get("bankName").getAsString();
            
            PaymentDAO paymentDAO = new PaymentDAO();
            Payment payment = paymentDAO.getPaymentByTransactionId(transactionId);
            
            if (payment != null && payment.isPending()) {
                if ("SUCCESS".equals(status)) {
                    // Cập nhật trạng thái thanh toán
                    paymentDAO.updatePaymentStatus(transactionId, "SUCCESS");
                    
                    // Cập nhật thông tin ngân hàng
                    paymentDAO.updatePaymentWithBankInfo(transactionId, bankCode, bankName, 
                        payment.getAccountNumber(), payment.getAccountName(), payment.getQrData());
                    
                    // Nâng cấp tài khoản lên Premium
                    UserDAO userDAO = new UserDAO();
                    if (userDAO.upgradeToPremium(payment.getUsername())) {
                        sendJsonResponse(response, "success", "Payment processed successfully");
                    } else {
                        sendJsonResponse(response, "error", "Failed to upgrade account");
                    }
                } else if ("FAILED".equals(status)) {
                    paymentDAO.updatePaymentStatus(transactionId, "FAILED");
                    sendJsonResponse(response, "error", "Payment failed");
                }
            } else {
                sendJsonResponse(response, "error", "Invalid payment or already processed");
            }
            
        } catch (Exception e) {
            System.err.println("Error processing payment callback: " + e.getMessage());
            sendJsonResponse(response, "error", "Internal server error");
        }
    }
    
    private void sendJsonResponse(HttpServletResponse response, String status, String message) throws IOException {
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("status", status);
        jsonResponse.addProperty("message", message);
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
    }

    @Override
    public String getServletInfo() {
        return "Main unified servlet";
    }
    
    // Admin Panel Methods
    private void handleAdminPanel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("DEBUG: handleAdminPanel called");
        
        // Check if user is logged in
        HttpSession session = request.getSession(false);
        System.out.println("DEBUG: Session: " + session);
        
        if (session == null || session.getAttribute("user") == null) {
            System.out.println("DEBUG: User not logged in, redirecting to login");
            response.sendRedirect("indexLogin.jsp");
            return;
        }
        
        // Check if user is admin
        String username = (String) session.getAttribute("user");
        System.out.println("DEBUG: Username from session: " + username);
        
        if (!"admin".equals(username)) {
            System.out.println("DEBUG: User is not admin, redirecting to login");
            response.sendRedirect("indexLogin.jsp");
            return;
        }
        
        System.out.println("DEBUG: User is admin, proceeding");
        
        // Set admin info in request attributes
        request.setAttribute("adminUsername", username);
        
        // Load users data and pass to JSP
        try {
            UserDAO userDAO = new UserDAO();
            List<User> users = userDAO.getAllUsers();
            request.setAttribute("users", users);
            System.out.println("DEBUG: Loaded " + users.size() + " users for admin panel");
            
            // Debug: Print each user
            for (User user : users) {
                System.out.println("DEBUG: User - " + user.getUsername() + " : " + user.getAccountType());
            }
        } catch (Exception e) {
            System.err.println("Error loading users: " + e.getMessage());
            e.printStackTrace();
        }
        
        System.out.println("DEBUG: Forwarding to admin panel JSP");
        
        // Forward to admin panel JSP
        request.getRequestDispatcher("/admin/adminPanel.jsp").forward(request, response);
    }
    
    private void handleGetUsers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();
        
        try {
            // Check if user is admin
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Not logged in");
                out.print(jsonResponse.toString());
                return;
            }
            
            String username = (String) session.getAttribute("user");
            if (!"admin".equals(username)) {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Unauthorized access");
                out.print(jsonResponse.toString());
                return;
            }
            
            // Get all users
            UserDAO userDAO = new UserDAO();
            List<User> users = userDAO.getAllUsers();
            
            System.out.println("DEBUG: Found " + users.size() + " users");
            
            JSONArray usersArray = new JSONArray();
            for (User user : users) {
                JSONObject userObj = new JSONObject();
                userObj.put("username", user.getUsername());
                userObj.put("password", user.getPassword());
                userObj.put("accountType", user.getAccountType());
                usersArray.put(userObj);
                
                System.out.println("DEBUG: Added user: " + user.getUsername() + " - " + user.getAccountType());
            }
            
            jsonResponse.put("success", true);
            jsonResponse.put("users", usersArray);
            
        } catch (Exception e) {
            jsonResponse.put("success", false);
            jsonResponse.put("message", "Error: " + e.getMessage());
            e.printStackTrace();
        }
        
        out.print(jsonResponse.toString());
    }
    
    private void handleUpdateAccountType(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();
        
        try {
            // Check if user is admin
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Not logged in");
                out.print(jsonResponse.toString());
                return;
            }
            
            String adminUsername = (String) session.getAttribute("user");
            if (!"admin".equals(adminUsername)) {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Unauthorized access");
                out.print(jsonResponse.toString());
                return;
            }
            
            // Read JSON request body
            Scanner scanner = new Scanner(request.getReader());
            StringBuilder requestBody = new StringBuilder();
            while (scanner.hasNextLine()) {
                requestBody.append(scanner.nextLine());
            }
            scanner.close();
            
            JSONObject requestData = new JSONObject(requestBody.toString());
            String username = requestData.getString("username");
            String newAccountType = requestData.getString("newAccountType");
            
            System.out.println("DEBUG: Updating account type for user: " + username + " to: " + newAccountType);
            
            // Validate input
            if (username == null || username.trim().isEmpty() || 
                newAccountType == null || newAccountType.trim().isEmpty()) {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Invalid input parameters");
                out.print(jsonResponse.toString());
                return;
            }
            
            // Update account type
            UserDAO userDAO = new UserDAO();
            boolean success = userDAO.updateAccountType(username, newAccountType);
            
            System.out.println("DEBUG: Update result: " + success);
            
            if (success) {
                // Log the action
                logAccountUpdate(adminUsername, username, newAccountType);
                
                jsonResponse.put("success", true);
                jsonResponse.put("message", "Account type updated successfully");
            } else {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Failed to update account type");
            }
            
        } catch (Exception e) {
            jsonResponse.put("success", false);
            jsonResponse.put("message", "Error: " + e.getMessage());
            e.printStackTrace();
        }
        
        out.print(jsonResponse.toString());
    }
    
    private void logAccountUpdate(String adminUsername, String targetUsername, String newAccountType) {
        try {
            java.time.LocalDateTime now = java.time.LocalDateTime.now();
            java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String timestamp = now.format(formatter);
            
            String action = "upgrade".equals(newAccountType) ? "UPGRADED" : "DOWNGRADED";
            String logMessage = String.format(
                "[%s] ADMIN: %s %s account type for user: %s to: %s",
                timestamp, adminUsername, action, targetUsername, newAccountType
            );
            
            System.out.println("=== ACCOUNT UPDATE LOG ===");
            System.out.println(logMessage);
            System.out.println("==========================");
            
        } catch (Exception e) {
            System.err.println("Error logging account update: " + e.getMessage());
        }
    }
} 