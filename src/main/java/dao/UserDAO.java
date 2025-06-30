package dao;

import dao.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import model.User;

/**
 * UserDAO class handles all database operations related to users
 * including login, registration and user existence checks
 */
public class UserDAO {
    private final DBContext db;
    
    public UserDAO() {
        db = new DBContext();
    }
    
    /**
     * Authenticates a user by checking username and password
     * @param username the username to check
     * @param password the password to check
     * @return User object if authentication successful, null otherwise
     */
    public User checkLogin(String username, String password) {
        String sql = "SELECT * FROM Users WHERE username = ? AND password = ?";
        try (Connection conn = db.getConnection();
             PreparedStatement st = conn.prepareStatement(sql)) {
            
            st.setString(1, username);
            st.setString(2, password);
            
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return new User(
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("account_type")
                    );
                }
            }
        } catch (Exception e) {
            System.err.println("Login error: " + e.getMessage());
        }
        return null;
    }
    
    /**
     * Checks if a username already exists in the database
     * @param username the username to check
     * @return true if username exists, false otherwise
     */
    public boolean checkUserExist(String username) throws NamingException {
        String sql = "SELECT * FROM Users WHERE username = ?";
        try (Connection conn = db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.err.println("Error checking user existence: " + e.getMessage());
            return false;
        }
    }
    
    /**
     * Registers a new user in the database
     * @param user the User object containing registration information
     * @return true if registration successful, false otherwise
     */
    public boolean registerUser(User user) {
        String sql = "INSERT INTO Users (username, password, account_type) VALUES (?, ?, ?)";
        try (Connection conn = db.getConnection();
             PreparedStatement st = conn.prepareStatement(sql)) {
            
            st.setString(1, user.getUsername());
            st.setString(2, user.getPassword());
            st.setString(3, user.getAccountType());
            
            return st.executeUpdate() > 0;
        } catch (Exception e) {
            System.err.println("Đăng kí thất bại: " + e.getMessage());
            return false;
        }
    }

    /**
     * Gets user information by username
     * @param username the username to get information for
     * @return User object if found, null otherwise
     */
    public User getUserInfo(String username) {
        String sql = "SELECT * FROM Users WHERE username = ?";
        try (Connection conn = db.getConnection();
             PreparedStatement st = conn.prepareStatement(sql)) {
            
            st.setString(1, username);
            
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return new User(
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("account_type")
                    );
                }
            }
        } catch (Exception e) {
            System.err.println("Error getting user info: " + e.getMessage());
        }
        return null;
    }

    public boolean upgradeToPremium(String username) throws NamingException {
        String sql = "UPDATE Users SET account_type = 'premium' WHERE username = ?";
        try (Connection conn = db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error upgrading user to premium: " + e.getMessage());
            return false;
        }
    }
} 