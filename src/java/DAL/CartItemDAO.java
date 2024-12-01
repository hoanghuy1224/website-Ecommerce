package DAL;


import Model.CartItem;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartItemDAO extends DBContext {
    public List<CartItem> getCartItems(int cartId) {
        List<CartItem> items = new ArrayList<>();
        String sql = "SELECT * FROM CartItem WHERE cart_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, cartId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CartItem item = new CartItem();
                item.setId(rs.getInt("id"));
                item.setCartId(rs.getInt("cart_id"));
                item.setProductId(rs.getInt("product_id"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getDouble("price"));
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }

    public void addCartItem(CartItem item) {
        String sql = "INSERT INTO CartItem (cart_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, item.getCartId());
            st.setInt(2, item.getProductId());
            st.setInt(3, item.getQuantity());
            st.setDouble(4, item.getPrice());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCartItem(int itemId, int quantity) {
        String sql = "UPDATE CartItem SET quantity = ? WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, quantity);
            st.setInt(2, itemId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCartItem(int itemId) {
        String sql = "DELETE FROM CartItem WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, itemId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
