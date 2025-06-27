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
import java.io.PrintWriter;
import model.User;

@WebServlet(name = "MainServlet", urlPatterns = {"/main"})
public class MainServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
            default:
                response.sendRedirect("index.jsp");
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

    @Override
    public String getServletInfo() {
        return "Main unified servlet";
    }
} 