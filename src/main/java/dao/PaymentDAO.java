package dao;

import model.Payment;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

public class PaymentDAO {
    
    public boolean createPayment(Payment payment) throws SQLException, NamingException {
        String sql = "INSERT INTO payments (transaction_id, username, amount, description, status, created_at, updated_at, expiry_time, bank_code, bank_name, qr_data, account_number, account_name, payment_method) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        System.out.println("Executing SQL: " + sql);
        System.out.println("Payment data: " + payment.toString());
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, payment.getTransactionId());
            ps.setString(2, payment.getUsername());
            ps.setDouble(3, payment.getAmount());
            ps.setString(4, payment.getDescription());
            ps.setString(5, payment.getStatus());
            ps.setTimestamp(6, Timestamp.valueOf(payment.getCreatedAt()));
            ps.setTimestamp(7, Timestamp.valueOf(payment.getUpdatedAt()));
            ps.setTimestamp(8, Timestamp.valueOf(payment.getExpiryTime()));
            ps.setString(9, payment.getBankCode());
            ps.setString(10, payment.getBankName());
            ps.setString(11, payment.getQrData());
            ps.setString(12, payment.getAccountNumber());
            ps.setString(13, payment.getAccountName());
            ps.setString(14, payment.getPaymentMethod());
            
            System.out.println("All parameters set, executing update...");
            int result = ps.executeUpdate();
            System.out.println("ExecuteUpdate result: " + result);
            
            return result > 0;
            
        } catch (SQLException e) {
            System.err.println("SQL Error creating payment: " + e.getMessage());
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            e.printStackTrace();
            throw e;
        } catch (NamingException e) {
            System.err.println("Naming Error creating payment: " + e.getMessage());
            e.printStackTrace();
            throw e;
        } catch (Exception e) {
            System.err.println("Unexpected Error creating payment: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    public Payment getPaymentByTransactionId(String transactionId) throws SQLException, NamingException {
        String sql = "SELECT * FROM payments WHERE transaction_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, transactionId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return mapResultSetToPayment(rs);
            }
            
        } catch (SQLException e) {
            System.err.println("Error getting payment: " + e.getMessage());
        }
        
        return null;
    }
    
    public boolean updatePaymentStatus(String transactionId, String status) throws SQLException, NamingException {
        String sql = "UPDATE payments SET status = ?, updated_at = ? WHERE transaction_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, status);
            ps.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now()));
            ps.setString(3, transactionId);
            
            return ps.executeUpdate() > 0;
            
        } catch (SQLException e) {
            System.err.println("Error updating payment status: " + e.getMessage());
            return false;
        }
    }
    
    public boolean updatePaymentWithBankInfo(String transactionId, String bankCode, String bankName, String accountNumber, String accountName, String qrData) throws SQLException, NamingException {
        String sql = "UPDATE payments SET bank_code = ?, bank_name = ?, account_number = ?, account_name = ?, qr_data = ?, updated_at = ? WHERE transaction_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, bankCode);
            ps.setString(2, bankName);
            ps.setString(3, accountNumber);
            ps.setString(4, accountName);
            ps.setString(5, qrData);
            ps.setTimestamp(6, Timestamp.valueOf(LocalDateTime.now()));
            ps.setString(7, transactionId);
            
            return ps.executeUpdate() > 0;
            
        } catch (SQLException e) {
            System.err.println("Error updating payment bank info: " + e.getMessage());
            return false;
        }
    }
    
    public List<Payment> getPaymentsByUsername(String username) throws NamingException {
        String sql = "SELECT * FROM payments WHERE username = ? ORDER BY created_at DESC";
        List<Payment> payments = new ArrayList<>();
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                payments.add(mapResultSetToPayment(rs));
            }
            
        } catch (SQLException e) {
            System.err.println("Error getting payments by username: " + e.getMessage());
        }
        
        return payments;
    }
    
    public List<Payment> getPendingPayments() throws NamingException {
        String sql = "SELECT * FROM payments WHERE status = 'PENDING' ORDER BY created_at DESC";
        List<Payment> payments = new ArrayList<>();
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                payments.add(mapResultSetToPayment(rs));
            }
            
        } catch (SQLException e) {
            System.err.println("Error getting pending payments: " + e.getMessage());
        }
        
        return payments;
    }
    
    public List<Payment> getExpiredPayments() throws NamingException {
        String sql = "SELECT * FROM payments WHERE status = 'PENDING' AND expiry_time < ?";
        List<Payment> payments = new ArrayList<>();
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setTimestamp(1, Timestamp.valueOf(LocalDateTime.now()));
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                payments.add(mapResultSetToPayment(rs));
            }
            
        } catch (SQLException e) {
            System.err.println("Error getting expired payments: " + e.getMessage());
        }
        
        return payments;
    }
    
    public boolean markExpiredPayments() throws NamingException {
        String sql = "UPDATE payments SET status = 'EXPIRED', updated_at = ? WHERE status = 'PENDING' AND expiry_time < ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setTimestamp(1, Timestamp.valueOf(LocalDateTime.now()));
            ps.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now()));
            
            return ps.executeUpdate() > 0;
            
        } catch (SQLException e) {
            System.err.println("Error marking expired payments: " + e.getMessage());
            return false;
        }
    }
    
    public boolean deletePayment(String transactionId) throws NamingException {
        String sql = "DELETE FROM payments WHERE transaction_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, transactionId);
            
            return ps.executeUpdate() > 0;
            
        } catch (SQLException e) {
            System.err.println("Error deleting payment: " + e.getMessage());
            return false;
        }
    }
    
    public int getTotalPaymentsByUsername(String username) throws NamingException {
        String sql = "SELECT COUNT(*) FROM payments WHERE username = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1);
            }
            
        } catch (SQLException e) {
            System.err.println("Error getting total payments: " + e.getMessage());
        }
        
        return 0;
    }
    
    public double getTotalAmountByUsername(String username) throws NamingException {
        String sql = "SELECT SUM(amount) FROM payments WHERE username = ? AND status = 'SUCCESS'";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return rs.getDouble(1);
            }
            
        } catch (SQLException e) {
            System.err.println("Error getting total amount: " + e.getMessage());
        }
        
        return 0.0;
    }
    
    private Payment mapResultSetToPayment(ResultSet rs) throws SQLException {
        Payment payment = new Payment();
        payment.setTransactionId(rs.getString("transaction_id"));
        payment.setUsername(rs.getString("username"));
        payment.setAmount(rs.getDouble("amount"));
        payment.setDescription(rs.getString("description"));
        payment.setStatus(rs.getString("status"));
        payment.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
        payment.setUpdatedAt(rs.getTimestamp("updated_at").toLocalDateTime());
        payment.setExpiryTime(rs.getTimestamp("expiry_time").toLocalDateTime());
        payment.setBankCode(rs.getString("bank_code"));
        payment.setBankName(rs.getString("bank_name"));
        payment.setQrData(rs.getString("qr_data"));
        payment.setAccountNumber(rs.getString("account_number"));
        payment.setAccountName(rs.getString("account_name"));
        payment.setPaymentMethod(rs.getString("payment_method"));
        return payment;
    }
} 