package Controller.Home;

import DAL.CartItemDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DeleteCart", urlPatterns = {"/deleteCartItem"})
public class DeleteCartItem extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            CartItemDAO cartItemDAO = new CartItemDAO();
            cartItemDAO.deleteCartItem(id);

            response.sendRedirect("cart");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("cart?error=Không thể xóa sản phẩm.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
