package model;
import dao.CommentDAO;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
/**
 * Service class for Comment operations
 */
public class CommentService {
    
    private CommentDAO commentDAO = new CommentDAO();
    
    /**
     * Add a comment to a recipe
     */
    public boolean addRecipeComment(String username, int recipeId, String commentText) {
        try {
            Comment comment = new Comment(username, commentText, recipeId);
            return commentDAO.addRecipeComment(comment);
        } catch (SQLException | NamingException e) {
            throw new RuntimeException("Error adding recipe comment", e);
        }
    }
    
    /**
     * Add a reply to a recipe comment
     */
    public boolean addRecipeCommentReply(String username, int recipeId, String commentText, int parentCommentId) {
        try {
            Comment comment = new Comment(username, commentText, recipeId, parentCommentId);
            return commentDAO.addRecipeComment(comment);
        } catch (SQLException | NamingException e) {
            throw new RuntimeException("Error adding recipe comment reply", e);
        }
    }
    
    /**
     * Add a comment to a post
     */
    public boolean addPostComment(String username, int postId, String commentText) {
        try {
            Comment comment = new Comment(username, commentText);
            comment.setPostId(postId);
            return commentDAO.addPostComment(comment);
        } catch (SQLException | NamingException e) {
            throw new RuntimeException("Error adding post comment", e);
        }
    }
    
    /**
     * Add a reply to a post comment
     */
    public boolean addPostCommentReply(String username, int postId, String commentText, int parentCommentId) {
        try {
            Comment comment = new Comment(username, commentText);
            comment.setPostId(postId);
            comment.setParentCommentId(parentCommentId);
            return commentDAO.addPostComment(comment);
        } catch (SQLException | NamingException e) {
            throw new RuntimeException("Error adding post comment reply", e);
        }
    }
    
    /**
     * Get all comments for a recipe
     */
    public List getRecipeComments(int recipeId) {
        try {
            return commentDAO.getRecipeComments(recipeId);
        } catch (SQLException | NamingException e) {
            throw new RuntimeException("Error getting recipe comments", e);
        }
    }
    
    /**
     * Get all comments for a post
     */
    public List getPostComments(int postId) {
        try {
            return commentDAO.getPostComments(postId);
        } catch (SQLException | NamingException e) {
            throw new RuntimeException("Error getting post comments", e);
        }
    }
    
    /**
     * Get comment count for a recipe
     */
    public int getRecipeCommentCount(int recipeId) {
        try {
            return commentDAO.getRecipeCommentCount(recipeId);
        } catch (SQLException | NamingException e) {
            throw new RuntimeException("Error getting recipe comment count", e);
        }
    }
    
    /**
     * Get comment count for a post
     */
    public int getPostCommentCount(int postId) {
        try {
            return commentDAO.getPostCommentCount(postId);
        } catch (SQLException | NamingException e) {
            throw new RuntimeException("Error getting post comment count", e);
        }
    }
}