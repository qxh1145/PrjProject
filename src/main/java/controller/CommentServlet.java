package controller;

import dao.CommentDAO;
import model.Comment;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.naming.NamingException;

/**
 * Servlet for handling comment operations
 */
@WebServlet("/comment")
public class CommentServlet extends HttpServlet {
    
    private CommentDAO commentDAO;
    private Gson gson;
    
    @Override
    public void init() throws ServletException {
        super.init();
        commentDAO = new CommentDAO();
        gson = new GsonBuilder()
                .setDateFormat("yyyy-MM-dd HH:mm:ss")
                .create();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        String action = request.getParameter("action");
        
        try {
            switch (action != null ? action : "") {
                case "getRecipeComments":
                    getRecipeComments(request, response);
                    break;
                case "getPostComments":
                    getPostComments(request, response);
                    break;
                case "getCommentCount":
                    getCommentCount(request, response);
                    break;
                default:
                    sendErrorResponse(response, "Invalid action");
            }
        } catch (Exception e) {
            sendErrorResponse(response, "Error processing request: " + e.getMessage());
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        String action = request.getParameter("action");
        
        try {
            switch (action != null ? action : "") {
                case "addRecipeComment":
                    addRecipeComment(request, response);
                    break;
                case "addPostComment":
                    addPostComment(request, response);
                    break;
                case "updateComment":
                    updateComment(request, response);
                    break;
                default:
                    sendErrorResponse(response, "Invalid action");
            }
        } catch (Exception e) {
            sendErrorResponse(response, "Error processing request: " + e.getMessage());
        }
    }
    
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        try {
            deleteComment(request, response);
        } catch (Exception e) {
            sendErrorResponse(response, "Error processing request: " + e.getMessage());
        }
    }
    
    /**
     * Get comments for a specific recipe
     */
    private void getRecipeComments(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, SQLException, NamingException {
        
        String recipeIdStr = request.getParameter("recipeId");
        
        if (recipeIdStr == null || recipeIdStr.trim().isEmpty()) {
            sendErrorResponse(response, "Recipe ID is required");
            return;
        }
        
        try {
            int recipeId = Integer.parseInt(recipeIdStr);
            List<Comment> comments = commentDAO.getRecipeComments(recipeId);
            
            Map<String, Object> responseData = new HashMap<>();
            responseData.put("success", true);
            responseData.put("comments", comments);
            responseData.put("count", comments.size());
            
            PrintWriter out = response.getWriter();
            out.print(gson.toJson(responseData));
            out.flush();
            
        } catch (NumberFormatException e) {
            sendErrorResponse(response, "Invalid recipe ID format");
        }
    }
    
    /**
     * Get comments for a specific post
     */
    private void getPostComments(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, SQLException, NamingException {
        
        String postIdStr = request.getParameter("postId");
        
        if (postIdStr == null || postIdStr.trim().isEmpty()) {
            sendErrorResponse(response, "Post ID is required");
            return;
        }
        
        try {
            int postId = Integer.parseInt(postIdStr);
            List<Comment> comments = commentDAO.getPostComments(postId);
            
            Map<String, Object> responseData = new HashMap<>();
            responseData.put("success", true);
            responseData.put("comments", comments);
            responseData.put("count", comments.size());
            
            PrintWriter out = response.getWriter();
            out.print(gson.toJson(responseData));
            out.flush();
            
        } catch (NumberFormatException e) {
            sendErrorResponse(response, "Invalid post ID format");
        }
    }
    
    /**
     * Get comment count for recipe or post
     */
    private void getCommentCount(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, SQLException, NamingException {
        
        String recipeIdStr = request.getParameter("recipeId");
        String postIdStr = request.getParameter("postId");
        
        int count = 0;
        
        if (recipeIdStr != null && !recipeIdStr.trim().isEmpty()) {
            try {
                int recipeId = Integer.parseInt(recipeIdStr);
                count = commentDAO.getRecipeCommentCount(recipeId);
            } catch (NumberFormatException e) {
                sendErrorResponse(response, "Invalid recipe ID format");
                return;
            }
        } else if (postIdStr != null && !postIdStr.trim().isEmpty()) {
            try {
                int postId = Integer.parseInt(postIdStr);
                count = commentDAO.getPostCommentCount(postId);
            } catch (NumberFormatException e) {
                sendErrorResponse(response, "Invalid post ID format");
                return;
            }
        } else {
            sendErrorResponse(response, "Either recipe ID or post ID is required");
            return;
        }
        
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("success", true);
        responseData.put("count", count);
        
        PrintWriter out = response.getWriter();
        out.print(gson.toJson(responseData));
        out.flush();
    }
    
    /**
     * Add a comment to a recipe
     */
    private void addRecipeComment(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, SQLException, NamingException {
        
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        
        if (username == null) {
            sendErrorResponse(response, "Please log in to comment");
            return;
        }
        
        String recipeIdStr = request.getParameter("recipeId");
        String commentText = request.getParameter("commentText");
        String parentCommentIdStr = request.getParameter("parentCommentId");
        
        if (recipeIdStr == null || commentText == null || 
            recipeIdStr.trim().isEmpty() || commentText.trim().isEmpty()) {
            sendErrorResponse(response, "Recipe ID and comment text are required");
            return;
        }
        
        try {
            int recipeId = Integer.parseInt(recipeIdStr);
            
            Comment comment = new Comment(username, commentText.trim(), recipeId);
            
            if (parentCommentIdStr != null && !parentCommentIdStr.trim().isEmpty()) {
                int parentCommentId = Integer.parseInt(parentCommentIdStr);
                comment.setParentCommentId(parentCommentId);
            }
            
            boolean success = commentDAO.addRecipeComment(comment);
            
            Map<String, Object> responseData = new HashMap<>();
            responseData.put("success", success);
            responseData.put("message", success ? "Comment added successfully" : "Failed to add comment");
            
            PrintWriter out = response.getWriter();
            out.print(gson.toJson(responseData));
            out.flush();
            
        } catch (NumberFormatException e) {
            sendErrorResponse(response, "Invalid ID format");
        }
    }
    
    /**
     * Add a comment to a post
     */
    private void addPostComment(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, SQLException, NamingException {
        
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        
        if (username == null) {
            sendErrorResponse(response, "Please log in to comment");
            return;
        }
        
        String postIdStr = request.getParameter("postId");
        String commentText = request.getParameter("commentText");
        String parentCommentIdStr = request.getParameter("parentCommentId");
        
        if (postIdStr == null || commentText == null || 
            postIdStr.trim().isEmpty() || commentText.trim().isEmpty()) {
            sendErrorResponse(response, "Post ID and comment text are required");
            return;
        }
        
        try {
            int postId = Integer.parseInt(postIdStr);
            
            Comment comment = new Comment(username, commentText.trim());
            comment.setPostId(postId);
            
            if (parentCommentIdStr != null && !parentCommentIdStr.trim().isEmpty()) {
                int parentCommentId = Integer.parseInt(parentCommentIdStr);
                comment.setParentCommentId(parentCommentId);
            }
            
            boolean success = commentDAO.addPostComment(comment);
            
            Map<String, Object> responseData = new HashMap<>();
            responseData.put("success", success);
            responseData.put("message", success ? "Comment added successfully" : "Failed to add comment");
            
            PrintWriter out = response.getWriter();
            out.print(gson.toJson(responseData));
            out.flush();
            
        } catch (NumberFormatException e) {
            sendErrorResponse(response, "Invalid ID format");
        }
    }
    
    /**
     * Update a comment
     */
    private void updateComment(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, SQLException, NamingException {
        
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        
        if (username == null) {
            sendErrorResponse(response, "Please log in to update comment");
            return;
        }
        
        String commentIdStr = request.getParameter("commentId");
        String newCommentText = request.getParameter("commentText");
        
        if (commentIdStr == null || newCommentText == null || 
            commentIdStr.trim().isEmpty() || newCommentText.trim().isEmpty()) {
            sendErrorResponse(response, "Comment ID and new comment text are required");
            return;
        }
        
        try {
            int commentId = Integer.parseInt(commentIdStr);
            
            boolean success = commentDAO.updateComment(commentId, newCommentText.trim(), username);
            
            Map<String, Object> responseData = new HashMap<>();
            responseData.put("success", success);
            responseData.put("message", success ? "Comment updated successfully" : "Failed to update comment or unauthorized");
            
            PrintWriter out = response.getWriter();
            out.print(gson.toJson(responseData));
            out.flush();
            
        } catch (NumberFormatException e) {
            sendErrorResponse(response, "Invalid comment ID format");
        }
    }
    
    /**
     * Delete a comment
     */
    private void deleteComment(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, SQLException, NamingException {
        
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        
        if (username == null) {
            sendErrorResponse(response, "Please log in to delete comment");
            return;
        }
        
        String commentIdStr = request.getParameter("commentId");
        
        if (commentIdStr == null || commentIdStr.trim().isEmpty()) {
            sendErrorResponse(response, "Comment ID is required");
            return;
        }
        
        try {
            int commentId = Integer.parseInt(commentIdStr);
            
            boolean success = commentDAO.deleteComment(commentId, username);
            
            Map<String, Object> responseData = new HashMap<>();
            responseData.put("success", success);
            responseData.put("message", success ? "Comment deleted successfully" : "Failed to delete comment or unauthorized");
            
            PrintWriter out = response.getWriter();
            out.print(gson.toJson(responseData));
            out.flush();
            
        } catch (NumberFormatException e) {
            sendErrorResponse(response, "Invalid comment ID format");
        }
    }
    
    /**
     * Send error response
     */
    private void sendErrorResponse(HttpServletResponse response, String message) throws IOException {
        Map<String, Object> errorResponse = new HashMap<>();
        errorResponse.put("success", false);
        errorResponse.put("error", message);
        
        PrintWriter out = response.getWriter();
        out.print(gson.toJson(errorResponse));
        out.flush();
    }
}

