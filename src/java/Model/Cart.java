package Model;

import java.util.List;
import java.util.Date;

public class Cart {
    private int id;
    private int userId;
    private Date createdAt;
    private List<CartItem> items;  // Danh sách các sản phẩm trong giỏ hàng

    public Cart() {}

    public Cart(int id, int userId, Date createdAt, List<CartItem> items) {
        this.id = id;
        this.userId = userId;
        this.createdAt = createdAt;
        this.items = items;
    }

    // Getter và Setter cho các thuộc tính
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

    // Getter và Setter cho items
    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }

    // Phương thức tính tổng tiền
    public double getTotalAmount() {
        double totalAmount = 0.0;
        if (items != null) {
            for (CartItem item : items) {
                totalAmount += item.getPrice() * item.getQuantity(); 
            }
        }
        return totalAmount;
    }
}
