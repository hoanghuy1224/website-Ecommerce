package Controller.Home;

import DAL.CartDAO;
import DAL.CartItemDAO;
import Model.CartItem;
import Model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

    private CartDAO cartDAO = new CartDAO();
    private CartItemDAO cartItemDAO = new CartItemDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // Lấy session nếu có, nếu không có thì trả về null
        Integer userId = null;

        if (session != null) {
            Object userIdObj = session.getAttribute("userId");
            if (userIdObj instanceof Integer) {
                userId = (Integer) userIdObj;
            }
        }

        if (userId == null) {
            response.sendRedirect("login");
            return;
        }

        // Lấy giỏ hàng của người dùng
        Cart cart = cartDAO.getCartByUserId(userId);
        if (cart == null) {
            cartDAO.createCart(userId);  // Tạo giỏ hàng mới nếu chưa có
            cart = cartDAO.getCartByUserId(userId); // Lấy lại giỏ hàng sau khi tạo
        }

        // Nếu giỏ hàng vẫn null sau khi tạo, báo lỗi
        if (cart == null) {
            request.setAttribute("error", "Không thể tạo giỏ hàng. Vui lòng thử lại.");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            return;
        }

        // Lấy các sản phẩm trong giỏ hàng
        List<CartItem> items = cartItemDAO.getCartItems(cart.getId());
        request.setAttribute("cartItems", items);

        // Forward dữ liệu đến trang Cart.jsp
        request.getRequestDispatcher("Home/Cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // Lấy session nếu có, nếu không có thì trả về null
        Integer userId = null;

        // Kiểm tra nếu session có tồn tại và lấy userId từ session
        if (session != null) {
            Object userIdObj = session.getAttribute("userId");
            if (userIdObj instanceof Integer) {
                userId = (Integer) userIdObj;
            }
        }

        if (userId == null) {
            response.sendRedirect("login");
            return;
        }

        // Lấy thông tin sản phẩm từ form
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));

        // Lấy giỏ hàng của người dùng
        Cart cart = cartDAO.getCartByUserId(userId);
        if (cart == null) {
            cartDAO.createCart(userId);  // Tạo giỏ hàng nếu chưa có
            cart = cartDAO.getCartByUserId(userId); // Lấy lại giỏ hàng sau khi tạo
        }

        // Nếu giỏ hàng vẫn null sau khi tạo, báo lỗi
        if (cart == null) {
            // Xử lý thông báo lỗi nếu không thể tạo giỏ hàng
            request.setAttribute("error", "Không thể tạo giỏ hàng. Vui lòng thử lại.");
            request.getRequestDispatcher("Home/Cart.jsp").forward(request, response);
            return;
        }

        // Tạo đối tượng CartItem và thêm vào giỏ hàng
        CartItem item = new CartItem();
        item.setCartId(cart.getId());
        item.setProductId(productId);
        item.setQuantity(quantity);
        item.setPrice(price);

        // Thêm sản phẩm vào giỏ hàng
        cartItemDAO.addCartItem(item);
        request.setAttribute("success", "thêm vào giỏ hàng thành công.");
        request.getRequestDispatcher("Home/Product_Detail.jsp").forward(request, response);
    }
}
