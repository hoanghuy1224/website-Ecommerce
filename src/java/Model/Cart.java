package Model;

import java.util.Date;

public class Cart {
    private int id;
    private int userId;
    private Date createdAt;

    public Cart() {}

    public Cart(int id, int userId, Date createdAt) {
        this.id = id;
        this.userId = userId;
        this.createdAt = createdAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}
