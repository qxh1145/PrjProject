package controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;
import dao.DBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

@WebServlet("/CreatePostServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1 MB
    maxFileSize = 1024 * 1024 * 10,  // 10 MB
    maxRequestSize = 1024 * 1024 * 15 // 15 MB
) 
public class CreatePostServlet extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get the logged-in username from session
        String username = (String) request.getSession().getAttribute("user");
        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        

        String content = request.getParameter("content");
        Part imagePart = request.getPart("image");
        String imageUrl = null;

        // Handle image upload if present
        if (imagePart != null && imagePart.getSize() > 0) {
            String fileName = UUID.randomUUID().toString() + getFileExtension(imagePart);
            String uploadPath = getUploadPath();
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            
            imagePart.write(uploadPath + File.separator + fileName);
            imageUrl = UPLOAD_DIRECTORY + "/" + fileName;
        }

        // Validate that either content or image is present
        if ((content == null || content.trim().isEmpty()) && imageUrl == null) {
            request.setAttribute("error", "Post must contain either text or an image");
            request.getRequestDispatcher("community.jsp").forward(request, response);
            return;
        }

        // Save post to database
        try (Connection conn = DBContext.getConnection()) {
            String sql = "INSERT INTO Posts (username, content, image_url) VALUES (?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, username);
                pstmt.setString(2, content);
                pstmt.setString(3, imageUrl);
                pstmt.executeUpdate();
            }
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error creating post: " + e.getMessage());
            request.getRequestDispatcher("community.jsp").forward(request, response);
            return;
        }

        // Redirect back to community page
        response.sendRedirect("community.jsp");
    }

    private String getUploadPath() {
        return getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
    }

    private String getFileExtension(Part part) {
        String submittedFileName = part.getSubmittedFileName();
        return submittedFileName.substring(submittedFileName.lastIndexOf("."));
    }
} 