package DAL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    protected Connection connection;
    
    public DBContext() {    
        try {
            String url = "jdbc:sqlserver://DESKTOP-ATI6PBQ:1433;databaseName=Trading2024;encrypt=true;TrustServerCertificate=true;characterEncoding=UTF-8;";
            String username = "sa";
            String password = "123";
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            System.err.println("Driver class not found: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("SQL Exception: " + e.getMessage());
        }
    }
    
    public static void main(String[] args) {
        DBContext dbContext = new DBContext();
        if (dbContext.connection != null) {
            System.out.println("ket noi thanh cong");
        } else {
            System.out.println("ket noi that bai!");
        }
    }
}

