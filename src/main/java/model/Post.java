package model;

import java.sql.Timestamp;
import java.util.Date;

public class Post {
    private int id;
    private String username;
    private String content;
    private String imagePath;
    private Timestamp createdAt;

    public Post() {
    }

    public Post( String username, String content, String imagePath) {
        this.username = username;
        this.content = content;
        this.imagePath = imagePath;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        username = username;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
    
    
} 