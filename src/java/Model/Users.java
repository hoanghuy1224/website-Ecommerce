package Model;

import java.sql.Timestamp; 

public class Users {
    private int id;
    private String username;
    private String password; 
    private String email;
    private Timestamp created_at; 
    private String role;

    public Users() {
    }

    public Users(int id, String username, String password, String email, Timestamp created_at, String role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.created_at = created_at;
        this.role = role;
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
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
