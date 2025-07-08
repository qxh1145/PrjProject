package dao;

import model.Comment;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * Data Access Object for Comment operations
 */
public class CommentDAO {
    
    public DataSource getDataSource() throws NamingException {
        Context context = new InitialContext();
        return (DataSource) context.lookup("java:comp/env/jdbc/ProjectPrjDB");
    }
    
    /**
     * Add a new comment to a recipe
     */
    public boolean addRecipeComment(Comment comment) throws SQLException, NamingException {
        String sql = "INSERT INTO Comments (username, recipe_id, comment_text, parent_comment_id) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = getDataSource().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, comment.getUsername());
            stmt.setInt(2, comment.getRecipeId());
            stmt.setString(3, comment.getCommentText());
            if (comment.getParentCommentId() != null) {
                stmt.setInt(4, comment.getParentCommentId());
            } else {
                stmt.setNull(4, Types.INTEGER);
            }
            
            return stmt.executeUpdate() > 0;
        }
    }
    
    /**
     * Add a new comment to a post
     */
    public boolean addPostComment(Comment comment) throws SQLException, NamingException {
        String sql = "INSERT INTO Comments (username, post_id, comment_text, parent_comment_id) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = getDataSource().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, comment.getUsername());
            stmt.setInt(2, comment.getPostId());
            stmt.setString(3, comment.getCommentText());
            if (comment.getParentCommentId() != null) {
                stmt.setInt(4, comment.getParentCommentId());
            } else {
                stmt.setNull(4, Types.INTEGER);
            }
            
            return stmt.executeUpdate() > 0;
        }
    }
    
    /**
     * Get all comments for a specific recipe
     */
    public List<Comment> getRecipeComments(int recipeId) throws SQLException, NamingException {
        String sql = "SELECT c.comment_id, c.username, c.comment_text, c.created_at, c.parent_comment_id, " +
                    "u.account_type FROM Comments c " +
                    "JOIN Users u ON c.username = u.username " +
                    "WHERE c.recipe_id = ? AND c.is_deleted = 0 " +
                    "ORDER BY c.created_at ASC";
        
        List<Comment> comments = new ArrayList<>();
        
        try (Connection conn = getDataSource().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, recipeId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setCommentId(rs.getInt("comment_id"));
                comment.setUsername(rs.getString("username"));
                comment.setCommentText(rs.getString("comment_text"));
                comment.setCreatedAt(rs.getTimestamp("created_at"));
                comment.setRecipeId(recipeId);
                
                int parentId = rs.getInt("parent_comment_id");
                if (!rs.wasNull()) {
                    comment.setParentCommentId(parentId);
                }
                
                comments.add(comment);
            }
        }
        
        return comments;
    }
    
    /**
     * Get all comments for a specific post
     */
    public List<Comment> getPostComments(int postId) throws SQLException, NamingException {
        String sql = "SELECT c.comment_id, c.username, c.comment_text, c.created_at, c.parent_comment_id, " +
                    "u.account_type FROM Comments c " +
                    "JOIN Users u ON c.username = u.username " +
                    "WHERE c.post_id = ? AND c.is_deleted = 0 " +
                    "ORDER BY c.created_at ASC";
        
        List<Comment> comments = new ArrayList<>();
        
        try (Connection conn = getDataSource().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, postId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setCommentId(rs.getInt("comment_id"));
                comment.setUsername(rs.getString("username"));
                comment.setCommentText(rs.getString("comment_text"));
                comment.setCreatedAt(rs.getTimestamp("created_at"));
                comment.setPostId(postId);
                
                int parentId = rs.getInt("parent_comment_id");
                if (!rs.wasNull()) {
                    comment.setParentCommentId(parentId);
                }
                
                comments.add(comment);
            }
        }
        
        return comments;
    }
    
    /**
     * Get comment count for a recipe
     */
    public int getRecipeCommentCount(int recipeId) throws SQLException, NamingException {
        String sql = "SELECT COUNT(*) as comment_count FROM Comments WHERE recipe_id = ? AND is_deleted = 0";
        
        try (Connection conn = getDataSource().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, recipeId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt("comment_count");
            }
        }
        
        return 0;
    }
    
    /**
     * Get comment count for a post
     */
    public int getPostCommentCount(int postId) throws SQLException, NamingException {
        String sql = "SELECT COUNT(*) as comment_count FROM Comments WHERE post_id = ? AND is_deleted = 0";
        
        try (Connection conn = getDataSource().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, postId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt("comment_count");
            }
        }
        
        return 0;
    }
    
    /**
     * Delete a comment (soft delete)
     */
    public boolean deleteComment(int commentId, String username) throws SQLException, NamingException {
        String sql = "UPDATE Comments SET is_deleted = 1 WHERE comment_id = ? AND username = ?";
        
        try (Connection conn = getDataSource().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, commentId);
            stmt.setString(2, username);
            
            return stmt.executeUpdate() > 0;
        }
    }
    
    /**
     * Get a specific comment by ID
     */
    public Comment getCommentById(int commentId) throws SQLException, NamingException {
        String sql = "SELECT c.comment_id, c.username, c.comment_text, c.created_at, c.recipe_id, " +
                    "c.post_id, c.parent_comment_id FROM Comments c " +
                    "WHERE c.comment_id = ? AND c.is_deleted = 0";
        
        try (Connection conn = getDataSource().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, commentId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                Comment comment = new Comment();
                comment.setCommentId(rs.getInt("comment_id"));
                comment.setUsername(rs.getString("username"));
                comment.setCommentText(rs.getString("comment_text"));
                comment.setCreatedAt(rs.getTimestamp("created_at"));
                
                int recipeId = rs.getInt("recipe_id");
                if (!rs.wasNull()) {
                    comment.setRecipeId(recipeId);
                }
                
                int postId = rs.getInt("post_id");
                if (!rs.wasNull()) {
                    comment.setPostId(postId);
                }
                
                int parentId = rs.getInt("parent_comment_id");
                if (!rs.wasNull()) {
                    comment.setParentCommentId(parentId);
                }
                
                return comment;
            }
        }
        
        return null;
    }
    
    /**
     * Update a comment
     */
    public boolean updateComment(int commentId, String newText, String username) throws SQLException, NamingException {
        String sql = "UPDATE Comments SET comment_text = ? WHERE comment_id = ? AND username = ? AND is_deleted = 0";
        
        try (Connection conn = getDataSource().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, newText);
            stmt.setInt(2, commentId);
            stmt.setString(3, username);
            
            return stmt.executeUpdate() > 0;
        }
    }
    public static void main(String[] args) {
    CommentDAO dao = new CommentDAO();
    try {
        DataSource ds = dao.getDataSource();
        try (Connection conn = ds.getConnection()) {
            if (conn != null && !conn.isClosed()) {
                System.out.println("✅ Database connection successful via JNDI!");
            } else {
                System.out.println("❌ Failed to establish database connection.");
            }
        }
    } catch (NamingException e) {
        System.out.println("❌ JNDI lookup failed: " + e.getMessage());
    } catch (SQLException e) {
        System.out.println("❌ SQL error: " + e.getMessage());
    }
}

}

