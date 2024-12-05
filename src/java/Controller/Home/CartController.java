package Controller.Home;

import DAL.CartDAO;
import DAL.CartItemDAO;
import DAL.ProductDAO;
import Model.CartItem;
import Model.Cart;
import Model.Product;

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
    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy session nếu có, nếu không có thì trả về null
        HttpSession session = request.getSession(false);
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

        if (cart == null) {
            request.setAttribute("error", "Không thể tạo giỏ hàng. Vui lòng thử lại.");
            request.getRequestDispatcher("Home/errorPage.jsp").forward(request, response);
            return;
        }

        session.setAttribute("cart", cart);

        // Lấy các sản phẩm trong giỏ hàng
        List<CartItem> items = cartItemDAO.getCartItems(cart.getId());

        // Lấy thông tin sản phẩm cho từng CartItem
        for (CartItem item : items) {
            Product product = productDAO.getProductByID(item.getProductId()); // Lấy sản phẩm từ productDAO
            item.setProduct(product); // Gán thông tin sản phẩm vào CartItem
        }

        request.setAttribute("cartItems", items);

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

        request.setAttribute("success", "Thêm vào giỏ hàng thành công.");
        request.getRequestDispatcher("Home/Product_Detail.jsp").forward(request, response);
    }
}
