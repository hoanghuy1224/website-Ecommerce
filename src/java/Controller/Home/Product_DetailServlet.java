package Controller.Home;

import DAL.CategoryDAO;
import DAL.ProductDAO;
import Model.Category;
import Model.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Product_DetailServlet", urlPatterns = {"/productdetail"})
public class Product_DetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productIdParam = request.getParameter("id");

        if (productIdParam != null && !productIdParam.isEmpty()) {
            try {
                int productId = Integer.parseInt(productIdParam);
                ProductDAO productDAO = new ProductDAO();
                Product product = productDAO.getProductByID(productId);

                if (product != null) {
                    request.setAttribute("product", product);
                    // Lấy dữ liệu từ bảng categories và load lên trang chủ
                    CategoryDAO categoryDAO = new CategoryDAO();
                    List<Category> categories = categoryDAO.getAll();
                    request.setAttribute("listdata1", categories);

                    request.getRequestDispatcher("Home/Product_Detail.jsp").forward(request, response);
                } else {
                    response.sendRedirect("Home/Product_Detail.jsp");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("Home/Product_Detail.jsp");
            }
        } else {
            response.sendRedirect("Home/Product_Detail.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
