<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 24px;
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input, select, button {
            font-size: 16px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[readonly] {
            background-color: #e9e9e9;
        }

        button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .error {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Thanh toán đơn hàng của bạn!</h1>

        <c:if test="${not empty param.error}">
            <div class="error">${param.error}</div>
        </c:if>

        <form action="CheckoutServlet" method="post">
            <label>Tổng tiền: </label>
            <input type="text" name="total_amount" value="${totalAmount}" readonly />
            <label>Phương thức thanh toán:</label>
            <select name="payment_method">
                <option value="COD">Thanh toán khi nhận hàng</option>
                <option value="Credit Card">Thanh toán bằng thẻ tín dụng</option>
            </select>

            <button type="submit">Đặt hàng</button>
        </form>
    </div>
</body>
</html>
