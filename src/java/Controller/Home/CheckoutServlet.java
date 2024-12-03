package Controller.Home;

import DAL.CartDAO;
import DAL.CartItemDAO;
import DAL.OrderDAO;
import DAL.OrderItemDAO;
import DAL.PaymentDAO;
import Model.Cart;
import Model.CartItem;
import Model.Order;
import Model.OrderItem;
import Model.Payment;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CheckoutServlet", urlPatterns = {"/CheckoutServlet"})
public class CheckoutServlet extends HttpServlet {

    private OrderDAO orderDAO;
    private OrderItemDAO orderItemDAO;
    private PaymentDAO paymentDAO;
    private CartItemDAO cartItemDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAO();
        orderItemDAO = new OrderItemDAO();
        paymentDAO = new PaymentDAO();
        cartItemDAO = new CartItemDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            int userId = (int) session.getAttribute("userId");
            CartDAO cartDAO = new CartDAO();
            cart = cartDAO.getCartByUserId(userId);

            session.setAttribute("cart", cart);
        }

        List<CartItem> items = cartItemDAO.getCartItems(cart.getId());
        double totalAmount = items.stream()
                .mapToDouble(item -> item.getPrice() * item.getQuantity())
                .sum();

        request.setAttribute("totalAmount", totalAmount);
        request.getRequestDispatcher("Home/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        try {
            // Lấy thông tin từ session và request
            int userId = (int) session.getAttribute("userId");
            String paymentMethod = request.getParameter("payment_method");
            double totalAmount = Double.parseDouble(request.getParameter("total_amount"));

            // Lấy giỏ hàng từ session
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null || cart.getId() == 0) {
                throw new Exception("Giỏ hàng trống hoặc chưa khởi tạo.");
            }

            // Lấy danh sách sản phẩm trong giỏ hàng
            List<CartItem> cartItems = cartItemDAO.getCartItems(cart.getId());
            if (cartItems.isEmpty()) {
                throw new Exception("Giỏ hàng không có sản phẩm nào.");
            }

            // 1. Tạo đơn hàng mới
            Order order = new Order();
            order.setUserId(userId);
            order.setOrderDate(new Date()); // Lưu ngày hiện tại
            order.setStatus("Pending");
            order.setTotalAmount(totalAmount);

            int orderId = orderDAO.createOrder(userId, totalAmount);
            if (orderId <= 0) {
                throw new Exception("Không thể tạo đơn hàng.");
            }

            // 2. Lưu các mục giỏ hàng vào OrderItem
            for (CartItem cartItem : cartItems) {
                OrderItem orderItem = new OrderItem();
                orderItem.setOrderId(orderId); // Liên kết với Order
                orderItem.setProductId(cartItem.getProductId());
                orderItem.setQuantity(cartItem.getQuantity());
                orderItem.setPrice(cartItem.getPrice());

                orderItemDAO.addOrderItem(orderItem); // Lưu OrderItem vào cơ sở dữ liệu
            }

            // 3. Lưu thông tin thanh toán vào Payment
            Payment payment = new Payment();
            payment.setOrderId(orderId);

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            payment.setPaymentDate(sdf.format(new Date()));

            payment.setAmount(totalAmount);
            payment.setPaymentMethod(paymentMethod);
            payment.setTransactionId("TXN" + System.currentTimeMillis()); // Mã giao dịch giả lập

            paymentDAO.addPayment(payment);

            // 4. Xóa các mục giỏ hàng khỏi cơ sở dữ liệu
            cartItemDAO.deleteCartItems(cart.getId());

            // 5. Xóa giỏ hàng khỏi session
            session.removeAttribute("cart");

            // 6. Chuyển hướng tới trang xác nhận đơn hàng
            response.sendRedirect("Home/confirmation.jsp?orderId=" + orderId);

        } catch (Exception e) {
            e.printStackTrace();
            // Xử lý lỗi: Mã hóa thông báo lỗi và chuyển hướng lại trang checkout
            String errorMessage = e.getMessage();
            String encodedErrorMessage = URLEncoder.encode(errorMessage, "UTF-8"); // Mã hóa lỗi
            response.sendRedirect("Home/checkout.jsp?error=" + encodedErrorMessage);
        }
    }
}
