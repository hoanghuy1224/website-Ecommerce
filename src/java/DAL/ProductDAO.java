package DAL;

import Model.Product;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product prd = new Product();
                prd.setId(rs.getInt("id"));
                prd.setName(rs.getString("name"));
                prd.setDescription(rs.getString("description"));
                prd.setPrice(rs.getDouble("price"));
                prd.setImage(rs.getString("image"));
                prd.setCategoryId(rs.getInt("category_id"));
                list.add(prd);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }
    // lấy sản phẩm theo category_id
    public List<Product> getProductsByCategoryId(int categoryId) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE category_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product prd = new Product();
                prd.setId(rs.getInt("id"));
                prd.setName(rs.getString("name"));
                prd.setDescription(rs.getString("description"));
                prd.setPrice(rs.getDouble("price"));
                prd.setImage(rs.getString("image"));
                prd.setCategoryId(rs.getInt("category_id"));
                list.add(prd);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }
    public Product getProductByID(int id) {
        String sql = "SELECT * FROM Product WHERE id = ?";
        try {
            try (PreparedStatement st = connection.prepareStatement(sql)) {
                st.setInt(1, id);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    Product c = new Product();
                    c.setId(rs.getInt("id"));
                    c.setName(rs.getString("name"));
                    c.setDescription(rs.getString("description"));
                    c.setPrice(rs.getDouble("price"));
                    c.setImage(rs.getString("image"));
                    c.setCategoryId(rs.getInt("category_id"));
                    return c;
                }
                rs.close();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insert(Product product) {
        String sql = "INSERT INTO Product (name, description, price, image, category_id) VALUES (?, ?, ?, ?, ?)";

        try {
            try (PreparedStatement prp = connection.prepareStatement(sql)) {
                prp.setString(1, product.getName());
                prp.setString(2, product.getDescription());
                prp.setDouble(3, product.getPrice());
                prp.setString(4, product.getImage());
                prp.setInt(5, product.getCategoryId());
                prp.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public void update(Product product) {
        String sql = "UPDATE Product SET name = ?, description = ?,price = ?, image = ?,category_id = ? WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, product.getName());
            pstmt.setString(2, product.getDescription());
            pstmt.setDouble(3, product.getPrice());
            pstmt.setString(4, product.getImage());
            pstmt.setInt(5, product.getCategoryId());
            pstmt.setInt(6, product.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void delete(int id) {
        String sql = "DELETE FROM Product WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);

            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Category with ID " + id + " was deleted successfully.");
            } else {
                System.out.println("No category found with ID " + id);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
   public List<Product> SearchProduct(String name) {
    List<Product> list = new ArrayList<>();
    
    String sql = "SELECT * FROM Product WHERE name LIKE ?";

    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setString(1, "%" + name + "%");
        
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Product prd = new Product();
                prd.setId(rs.getInt("id"));
                prd.setName(rs.getString("name"));
                prd.setDescription(rs.getString("description"));
                prd.setPrice(rs.getDouble("price"));
                prd.setImage(rs.getString("image"));
                prd.setCategoryId(rs.getInt("category_id"));
                list.add(prd);
            }
        }
    } catch (SQLException e) {
        System.out.println(e);
    }

    return list;
}

}
