package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Post;
import dao.DBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import jakarta.servlet.http.HttpSession;
import java.util.Collections;

@WebServlet("/community")
public class CommunityServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(CommunityServlet.class.getName());
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Check if user is logged in
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("user");
        LOGGER.info("Session ID: " + session.getId());
        LOGGER.info("Current username from session: " + username);
        LOGGER.info("All session attributes: " + Collections.list(session.getAttributeNames()));
        
        if (username == null) {
            LOGGER.info("No user in session, redirecting to login");
            response.sendRedirect("login.jsp");
            return;
        }
        addSamplePost(username);

        try (Connection conn = DBContext.getConnection()) {
            LOGGER.info("Successfully connected to database");
            
            // First check if the user exists
            String checkUserSql = "SELECT COUNT(*) FROM Users WHERE username = ?";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkUserSql)) {
                checkStmt.setString(1, username);
                try (ResultSet rs = checkStmt.executeQuery()) {
                    if (rs.next()) {
                        LOGGER.info("User exists in database: " + (rs.getInt(1) > 0));
                    }
                }
            }
            
            String sql = "SELECT p.*, u.username FROM Posts p " +
                        "JOIN Users u ON p.username = u.username " +
                        "ORDER BY p.created_at DESC";
            
            LOGGER.info("Executing SQL: " + sql);
            
            try (PreparedStatement pstmt = conn.prepareStatement(sql);
                 ResultSet rs = pstmt.executeQuery()) {
                
                List<Post> posts = new ArrayList<>();
                while (rs.next()) {
                    Post post = new Post();
                    post.setPostId(rs.getInt("post_id"));
                    post.setUsername(rs.getString("username"));
                    post.setContent(rs.getString("content"));
                    post.setImageUrl(rs.getString("image_url"));
                    post.setCreatedAt(rs.getTimestamp("created_at"));
                    posts.add(post);
                    LOGGER.info("Found post: " + post.getContent());
                }
                
                LOGGER.info("Total posts found: " + posts.size());
                request.setAttribute("posts", posts);
                request.getRequestDispatcher("community.jsp").forward(request, response);
            }
        } catch (SQLException | NamingException e) {
            LOGGER.log(Level.SEVERE, "Error loading posts", e);
            request.setAttribute("error", "Error loading posts: " + e.getMessage());
            request.getRequestDispatcher("community.jsp").forward(request, response);
        }
    }

    private void addSamplePost(String username) {
        try (Connection conn = DBContext.getConnection()) {
            // Check if any posts exist
            String checkSql = "SELECT COUNT(*) FROM Posts";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkSql);
                 ResultSet rs = checkStmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) == 0) {
                    // No posts exist, add a sample post
                    String insertSql = "INSERT INTO Posts (username, content, created_at) VALUES (?, ?, CURRENT_TIMESTAMP)";
                    try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                        insertStmt.setString(1, username);
                        insertStmt.setString(2, "Welcome to our coffee community! Share your favorite coffee recipes and experiences here.");
                        insertStmt.executeUpdate();
                    }
                }
            }
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
    }
} 