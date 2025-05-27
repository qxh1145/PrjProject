package controller;

import dal.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.User;

@WebServlet(name = "RegisterHandle", urlPatterns = {"/RegisterHandle"})
public class RegisterHandle extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy thông tin từ form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Kiểm tra mật khẩu
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Kiểm tra username đã tồn tại chưa
        UserDAO userDAO = new UserDAO();
        if (userDAO.checkUserExist(username)) {
            request.setAttribute("error", "Username đã tồn tại!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Tạo user mới và lưu vào database
        User newUser = new User(username, password);
        if (userDAO.registerUser(newUser)) {
            // Nếu đăng ký thành công
            HttpSession session = request.getSession();
            session.setAttribute("user", username);
            response.sendRedirect("indexLogin.jsp");
        } else {
            request.setAttribute("error", "Có lỗi xảy ra trong quá trình đăng ký!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}