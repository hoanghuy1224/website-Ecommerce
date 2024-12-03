package DAL;

import DAL.DBContext;
import Model.Order;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends DBContext {

    // Tạo đơn hàng mới
    public int createOrder(int userId, double totalAmount) {
        String sql = "INSERT INTO Orders (user_id, order_date, status, total_amount) OUTPUT INSERTED.id VALUES (?, GETDATE(), 'PENDING', ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            st.setDouble(2, totalAmount);

            // Trả về ID của đơn hàng vừa tạo
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    // Lấy danh sách đơn hàng theo userId
    public List<Order> getOrdersByUserId(int userId) throws SQLException {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders WHERE user_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getInt("id"));
                    order.setUserId(rs.getInt("user_id"));

                    // Lấy dữ liệu từ ResultSet và chuyển đổi thành Date
                    Date orderDate = rs.getDate("order_date");
                    order.setOrderDate(orderDate);

                    order.setStatus(rs.getString("status"));
                    order.setTotalAmount(rs.getDouble("total_amount"));
                    orders.add(order);
                }
            }
        }
        return orders;
    }
}
