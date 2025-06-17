package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "NavigationServlet", urlPatterns = {"/navigation"})
public class NavigationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        String username = (String) session.getAttribute("username");

        // Kiểm tra nếu cần đăng nhập

        if (action == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        switch (action) {
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
                response.sendRedirect("logout");
                break;

            default:
                response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    // Xử lý chuyển hướng đến công thức
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

    // Chuyển hướng dashboard theo role
    private void handleDashboardRedirect(HttpServletResponse response, String role) throws IOException {
        if ("admin".equals(role)) {
            response.sendRedirect("admin/dashboard.jsp");
        } else if ("manager".equals(role)) {
            response.sendRedirect("manager/dashboard.jsp");
        } else {
            response.sendRedirect("user/dashboard.jsp");
        }
    }

    // Xác định action nào cần đăng nhập
   
}
