package dao;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author knigh
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBContext {
    private static final String DB_NAME = "ProjectPrjDB";
    private static final String PORT_NUMBER = "1433";
    private static final String SERVER_NAME = "localhost";
    private static final String USERNAME = "sa";
    private static final String PASSWORD = "sa";
    
    public static Connection getConnection() throws SQLException, NamingException {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/ProjectFinal");
            return ds.getConnection();
        } catch (NamingException | SQLException e) {
            // Fallback to direct connection if JNDI fails
            try {
                String url = "jdbc:sqlserver://" + SERVER_NAME + ":" + PORT_NUMBER + ";databaseName=" + DB_NAME
                        + ";encrypt=true;trustServerCertificate=true;loginTimeout=30;connectRetryCount=3;connectRetryInterval=10";
                return DriverManager.getConnection(url, USERNAME, PASSWORD);
            } catch (SQLException ex) {
                System.err.println("Database connection error details:");
                System.err.println("Error Code: " + ex.getErrorCode());
                System.err.println("SQL State: " + ex.getSQLState());
                System.err.println("Message: " + ex.getMessage());
                throw ex;
            }
        }
    }
    
    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}