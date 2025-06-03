package controller;

import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.User;

@WebServlet(name = "LoginHandle", urlPatterns = {"/LoginHandle"})
public class LoginHandle extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if user is already logged in
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect("indexLogin.jsp");
            return;
        }
        // Redirect to login page if not logged in
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // Input validation
            if (username == null || username.trim().isEmpty() || 
                password == null || password.trim().isEmpty()) {
                request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
                return;
            }

            // Check if user is already logged in
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("user") != null) {
                response.sendRedirect("indexLogin.jsp");
                return;
            }

            // Attempt login
            UserDAO userDAO = new UserDAO();
            User user = userDAO.checkLogin(username, password);

            if (user != null) {
                // Create new session
                session = request.getSession(true);
                session.setAttribute("user", username);
                session.setAttribute("userInfo", user);
                session.setAttribute("accountType", user.getAccountType());
                
                // Set session timeout to 30 minutes
                session.setMaxInactiveInterval(30 * 60);
                
                response.sendRedirect("indexLogin.jsp");
            } else {
                request.setAttribute("error", "Sai username hoặc password!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            // Log the error
            System.err.println("Login error: " + e.getMessage());
            request.setAttribute("error", "Có lỗi xảy ra, vui lòng thử lại sau!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Login Handler Servlet";
    }
}