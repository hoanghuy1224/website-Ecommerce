package Controller.Home;

import DAL.CategoryDAO;
import DAL.ProductDAO;
import Model.Category;
import Model.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ListHomeServlet", urlPatterns = {"/listhome"})
public class ListHomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy dữ liệu từ bảng categories và load lên trang chủ
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> categories = categoryDAO.getAll();
        request.setAttribute("listdata", categories);

        // Lấy dữ liệu từ bảng product
        ProductDAO productDAO = new ProductDAO();
        String categoryIdParam = request.getParameter("categoryId");
        String searchQuery = request.getParameter("search");

        List<Product> products = new ArrayList<>();

        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            products = productDAO.SearchProduct(searchQuery.trim());
        } else if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
            try {
                int categoryId = Integer.parseInt(categoryIdParam);
                products = productDAO.getProductsByCategoryId(categoryId);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                products = productDAO.getAllProduct();
            }
        } else {
            products = productDAO.getAllProduct();
        }

        request.setAttribute("listproduct", products);

        // Lọc sản phẩm có category_id = 4 và 3
        List<Product> filterid4 = new ArrayList<>();
        for (Product product : products) {
            if (product.getCategoryId() == 4 || product.getCategoryId() == 3) {
                filterid4.add(product);
            }
        }
        request.setAttribute("filterid4", filterid4);

        // Lọc sản phẩm có category_id = 1
        List<Product> filterid1 = new ArrayList<>();
        for (Product product : products) {
            if (product.getCategoryId() == 1) {
                filterid1.add(product);
            }
        }
        request.setAttribute("filterid1", filterid1);

        // Lọc sản phẩm có category_id = 2
        List<Product> filterid2 = new ArrayList<>();
        for (Product product : products) {
            if (product.getCategoryId() == 2) {
                filterid2.add(product);
            }
        }
        request.setAttribute("filterid2", filterid2);

        // Chuyển hướng đến JSP
        request.getRequestDispatcher("Home/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
