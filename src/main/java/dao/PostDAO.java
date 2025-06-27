/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import model.Post;

/**
 *
 * @author knigh
 */
public class PostDAO {
    
    public void createPost(Post post) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {            
            conn = DBContext.getConnection();
            String sql = "insert into Posts (username, content, image_url) values (?, ?, ?)";
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, post.getUsername());
            ps.setString(2, post.getContent());
            ps.setString(3, post.getImagePath());
            ps.executeUpdate();
            
            rs = ps.getGeneratedKeys();
            
            if (rs.next()) {
                post.setId(rs.getInt(1));
            }
        } finally {
            closeResources(conn, ps, rs);
        }
        
    }
    
    public List<Post> getAllPost() throws SQLException, NamingException {
        List<Post> postList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBContext.getConnection();
            String sql = "Select * from Posts order by create_at desc";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("id"));
                post.setUsername("username");
                post.setContent(rs.getString("content"));
                post.setImagePath(rs.getString("image_path"));
                post.setCreatedAt(rs.getTimestamp("create_at"));
                postList.add(post);
                
            }
        } finally {
            closeResources(conn, ps, rs);
        }
        return postList;
    }
    
    private void closeResources(Connection conn, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                DBContext.closeConnection(conn);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
