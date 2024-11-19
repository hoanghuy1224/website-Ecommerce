package DAL;

import Model.Category;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoryDAO extends DBContext {

    // Đọc tất cả các bản ghi từ bảng categories
    public List<Category> getAll() {
        List<Category> categoryList = new ArrayList<>();
        String sql = "SELECT * FROM categories";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDescribe(rs.getString("describe"));
                categoryList.add(c);
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return categoryList;
    }

    public void insert(Category c) {
        String query = "INSERT INTO categories (id, name, describe) VALUES (?, ?, ?)";
        try {
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, c.getId());
            stm.setString(2, c.getName());
            stm.setString(3, c.getDescribe());
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        //  return 0;

    }

    public Category getCategoryByID(int id) {
        String sql = "SELECT * FROM categories WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDescribe(rs.getString("describe"));
                return c;
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void delete(int id) {
        String sql = "DELETE FROM categories WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);

            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Category with ID " + id + " was deleted successfully.");
            } else {
                System.out.println("No category found with ID " + id);
            }

        } catch (SQLException e) {
            e.printStackTrace(); 
           
        }
    }

    public void update(Category category) {
        String sql = "UPDATE categories SET name = ?, describe = ? WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, category.getName());
            pstmt.setString(2, category.getDescribe());
            pstmt.setInt(3, category.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

//    public static void main(String[] args) {
//        CategoryDAO c = new CategoryDAO();
//        List<Category> list = c.getAll();
//        if (!list.isEmpty()) { 
//            System.out.println("ten san pham la : " + list.get(0).getName()+" "+list.get(1).getDescribe());
//        } else {
//            System.out.println("Không tìm thấy danh mục nào.");
//        }
//    }
}
