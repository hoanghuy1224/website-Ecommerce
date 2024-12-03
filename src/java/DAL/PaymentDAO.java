package DAL;

import Model.Payment;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class PaymentDAO extends DBContext{
    // Add a Payment
    public void addPayment(Payment payment) throws SQLException {
        String query = "INSERT INTO Payment (order_id, payment_date, amount, payment_method, transaction_id) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, payment.getOrderId());
            ps.setString(2, payment.getPaymentDate());
            ps.setDouble(3, payment.getAmount());
            ps.setString(4, payment.getPaymentMethod());
            ps.setString(5, payment.getTransactionId());
            ps.executeUpdate();
        }
    }

    // Get Payment by Order ID
    public Payment getPaymentByOrderId(int orderId) throws SQLException {
        String query = "SELECT * FROM Payment WHERE order_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, orderId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Payment payment = new Payment();
                    payment.setId(rs.getInt("id"));
                    payment.setOrderId(rs.getInt("order_id"));
                    payment.setPaymentDate(rs.getString("payment_date"));
                    payment.setAmount(rs.getDouble("amount"));
                    payment.setPaymentMethod(rs.getString("payment_method"));
                    payment.setTransactionId(rs.getString("transaction_id"));
                    return payment;
                }
            }
        }
        return null;
    }
}
