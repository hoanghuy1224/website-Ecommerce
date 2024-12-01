package DAL;

import Model.Users;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsersDAO extends DBContext {

    public void insert(Users user) {
        String sql = "INSERT INTO Users (username, password, email, created_at, role) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement prp = connection.prepareStatement(sql)) {
            prp.setString(1, user.getUsername());
            prp.setString(2, user.getPassword()); 
            prp.setString(3, user.getEmail());
            prp.setTimestamp(4, user.getCreated_at()); 
            prp.setString(5, user.getRole());

            prp.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); 
        }
    }

    public Users getUserById(int id) {
        String sql = "SELECT * FROM Users WHERE id = ?";
        Users user = null;

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    user = new Users();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));
                    user.setEmail(rs.getString("email"));
                    user.setCreated_at(rs.getTimestamp("created_at"));
                    user.setRole(rs.getString("role"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public Users getUserByUsername(String username) {
        String sql = "SELECT * FROM Users WHERE username = ?";
        Users user = null;

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, username);
            
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    user = new Users();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));
                    user.setEmail(rs.getString("email"));
                    user.setCreated_at(rs.getTimestamp("created_at"));
                    user.setRole(rs.getString("role"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user; 
    }
}
