/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dao.PostDAO;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author knigh
 */
public class PostService {

    private PostDAO postDAO = new PostDAO();

    public void createPost(String username, String content, String imagePath) {
        try {
            Post post = new Post(username, content, imagePath);
            postDAO.createPost(post);
        } catch (SQLException | NamingException e) {
            throw new RuntimeException("error getting posts", e);
        }
    }

    public List<Post> getAllPost() {
        try {
            return postDAO.getAllPost();
        } catch (SQLException | NamingException e) {
            throw new RuntimeException("error getting posts", e);
        }
    }
}
