package model;

import java.sql.Timestamp;

/**
 * Comment model class representing a comment entity
 */
public class Comment {
    private int commentId;
    private String username;
    private String commentText;
    private Timestamp createdAt;
    private Integer recipeId;
    private Integer postId;
    private Integer parentCommentId;
    private boolean isDeleted;
    
    // Constructors
    public Comment() {
    }
    
    public Comment(String username, String commentText) {
        this.username = username;
        this.commentText = commentText;
        this.isDeleted = false;
    }
    
    public Comment(String username, String commentText, int recipeId) {
        this.username = username;
        this.commentText = commentText;
        this.recipeId = recipeId;
        this.isDeleted = false;
    }
    
    public Comment(String username, String commentText, int recipeId, Integer parentCommentId) {
        this.username = username;
        this.commentText = commentText;
        this.recipeId = recipeId;
        this.parentCommentId = parentCommentId;
        this.isDeleted = false;
    }
    
    // Getters and Setters
    public int getCommentId() {
        return commentId;
    }
    
    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getCommentText() {
        return commentText;
    }
    
    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }
    
    public Timestamp getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
    
    public Integer getRecipeId() {
        return recipeId;
    }
    
    public void setRecipeId(Integer recipeId) {
        this.recipeId = recipeId;
    }
    
    public Integer getPostId() {
        return postId;
    }
    
    public void setPostId(Integer postId) {
        this.postId = postId;
    }
    
    public Integer getParentCommentId() {
        return parentCommentId;
    }
    
    public void setParentCommentId(Integer parentCommentId) {
        this.parentCommentId = parentCommentId;
    }
    
    public boolean isDeleted() {
        return isDeleted;
    }
    
    public void setDeleted(boolean deleted) {
        isDeleted = deleted;
    }
    
    // Helper methods
    public boolean isReply() {
        return parentCommentId != null;
    }
    
    public boolean isRecipeComment() {
        return recipeId != null;
    }
    
    public boolean isPostComment() {
        return postId != null;
    }
    
    @Override
    public String toString() {
        return "Comment{" +
                "commentId=" + commentId +
                ", username='" + username + '\'' +
                ", commentText='" + commentText + '\'' +
                ", createdAt=" + createdAt +
                ", recipeId=" + recipeId +
                ", postId=" + postId +
                ", parentCommentId=" + parentCommentId +
                ", isDeleted=" + isDeleted +
                '}';
    }
}

