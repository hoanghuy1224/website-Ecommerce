<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Order, Model.OrderItem, Model.Payment, DAL.OrderDAO, DAL.OrderItemDAO, DAL.PaymentDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Confirmation</title>
        <link rel="stylesheet" href="styles.css"> <!-- Đường dẫn tới file CSS -->

        <style>
            /* Reset cơ bản */
            body, h1, h2, p, ul, ol, table {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            /* Tổng thể trang */
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f7f7f7;
                color: #333;
                line-height: 1.6;
            }

            .container {
                max-width: 800px;
                margin: 30px auto;
                background: #fff;
                padding: 20px 30px;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            /* Tiêu đề */
            h1 {
                font-size: 2rem;
                color: #007bff;
                text-align: center;
                margin-bottom: 10px;
            }

            h2 {
                font-size: 1.5rem;
                margin-bottom: 15px;
                border-bottom: 2px solid #007bff;
                padding-bottom: 5px;
                color: #333;
            }

            /* Bảng */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            table th, table td {
                padding: 10px;
                text-align: center;
                border: 1px solid #ddd;
            }

            table th {
                background-color: #007bff;
                color: #fff;
                font-weight: bold;
            }

            table tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            table tr:hover {
                background-color: #f1f1f1;
            }

            /* Thông báo lỗi */
            .error {
                text-align: center;
                color: #d9534f;
                font-weight: bold;
                margin: 20px 0;
            }

            /* Nút bấm */
            .btn {
                display: inline-block;
                background-color: #007bff;
                color: #fff;
                text-decoration: none;
                font-size: 1rem;
                padding: 10px 20px;
                border-radius: 5px;
                margin-top: 20px;
                text-align: center;
            }

            .btn:hover {
                background-color: #0056b3;
            }

            /* Các khối */
            .order-summary, .order-items, .payment-details {
                margin-bottom: 20px;
                padding: 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #f9f9f9;
            }

            /* Liên kết trở về */
            .back-to-home {
                text-align: center;
            }

            .back-to-home .btn {
                display: inline-block;
                padding: 10px 25px;
                margin-top: 20px;
                background: #28a745;
                color: white;
                border-radius: 5px;
                font-size: 1rem;
            }

            .back-to-home .btn:hover {
                background-color: #218838;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <h1>Đặt hàng thành công</h1>

            <%
                String orderIdStr = request.getParameter("orderId");
                if (orderIdStr == null || orderIdStr.isEmpty()) {
            %>
            <p class="error">Không tìm thấy đơn hàng. Vui lòng thử lại.</p>
            <%
            } else {
                try {
                    int orderId = Integer.parseInt(orderIdStr); // Lấy Order ID từ URL

                    OrderDAO orderDAO = new OrderDAO();
                    OrderItemDAO orderItemDAO = new OrderItemDAO();
                    PaymentDAO paymentDAO = new PaymentDAO();

                    // Lấy thông tin đơn hàng
                    Order order = orderDAO.getOrderById(orderId);

                    if (order == null) {
            %>
            <p class="error">Không tìm thấy đơn hàng. Vui lòng thử lại.</p>
            <%
            } else {
                // Lấy danh sách sản phẩm trong đơn hàng
                List<OrderItem> orderItems = orderItemDAO.getOrderItemsByOrderId(orderId);

                // Lấy thông tin thanh toán
                Payment payment = paymentDAO.getPaymentByOrderId(orderId);

%>
            <div class="order-summary">
                <h2>Chi tiết đơn hàng</h2>
                <p><strong>ID Đơn hàng:</strong> <%= order.getId()%></p>
                <p><strong>ID Người mua:</strong> <%= order.getUserId()%></p>
                <p><strong>Ngày đặt hàng:</strong> <%= order.getOrderDate()%></p>
                <p><strong>Trạng thái:</strong> <%= order.getStatus()%></p>
                <p><strong>Tổng tiền:</strong> $<%= order.getTotalAmount()%></p>
            </div>

            <div class="order-items">
                <h2>Các mặt hàng trong đơn hàng của bạn</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (OrderItem item : orderItems) {
                                double itemTotal = item.getPrice() * item.getQuantity();
                        %>
                        <tr>
                            <td><%= item.getProductId()%></td>
                            <td><%= item.getQuantity()%></td>
                            <td>$<%= item.getPrice()%></td>
                            <td>$<%= itemTotal%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>

            <div class="payment-details">
                <h2>Chi tiết thanh toán</h2>
                <p><strong>Ngày thanh toán:</strong> <%= payment.getPaymentDate()%></p>
                <p><strong>Phương thức thanh toán:</strong> <%= payment.getPaymentMethod()%></p>
                <p><strong>Mã giao dịch:</strong> <%= payment.getTransactionId()%></p>
                <p><strong>Tổng tiền:</strong> $<%= payment.getAmount()%></p>
            </div>

            <% }
            } catch (NumberFormatException e) {
            %>
            <p class="error">Mã đơn hàng không hợp lệ. Vui lòng kiểm tra lại.</p>
            <%
            } catch (Exception e) {
            %>
            <p class="error">Đã xảy ra lỗi khi lấy thông tin chi tiết đơn hàng của bạn: <%= e.getMessage()%></p>
            <%
                    }
                }
            %>

            <div class="back-to-home">
                <a href="/tradingjdbc_demo/listhome" class="btn">Quay lại trang chủ</a>
            </div>
        </div>
    </body>

</html>
