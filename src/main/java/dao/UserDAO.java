package dao;

import dao.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    public boolean checkUserExist(String username) {
        String sql = "SELECT * FROM Users WHERE username = ?";
        try (Connection conn = db.getConnection();
             PreparedStatement st = conn.prepareStatement(sql)) {
            
            st.setString(1, username);
            
            try (ResultSet rs = st.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
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
    
    /**
     * Gets all users from the database
     * @return List of all users
     */
    public java.util.List<User> getAllUsers() {
        java.util.List<User> users = new java.util.ArrayList<>();
        String sql = "SELECT username, password, account_type FROM Users ORDER BY username";
        
        try (Connection conn = db.getConnection();
             PreparedStatement st = conn.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {
            
            while (rs.next()) {
                User user = new User(
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("account_type")
                );
                users.add(user);
            }
        } catch (Exception e) {
            System.err.println("Error getting all users: " + e.getMessage());
            e.printStackTrace();
        }
        return users;
    }
    
    /**
     * Updates the account type of a user
     * @param username the username to update
     * @param newAccountType the new account type
     * @return true if update successful, false otherwise
     */
    public boolean updateAccountType(String username, String newAccountType) {
        String sql = "UPDATE Users SET account_type = ? WHERE username = ?";
        try (Connection conn = db.getConnection();
             PreparedStatement st = conn.prepareStatement(sql)) {
            
            st.setString(1, newAccountType);
            st.setString(2, username);
            
            System.out.println("DEBUG: Executing SQL: UPDATE Users SET account_type = '" + newAccountType + "' WHERE username = '" + username + "'");
            
            int rowsAffected = st.executeUpdate();
            System.out.println("DEBUG: Rows affected: " + rowsAffected);
            
            return rowsAffected > 0;
        } catch (Exception e) {
            System.err.println("Error updating account type: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
} 