<%@page import="Model.CartItem"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Category" %>
<%@page import="Model.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>Eflyer</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- bootstrap css -->
        <link rel="stylesheet" type="text/css" href="Home/css/bootstrap.min.css">
        <!-- style css -->
        <link rel="stylesheet" type="text/css" href="Home/css/style.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="Home/css/responsive.css">
        <!-- fevicon -->
        <link rel="icon" href="Home/images/fevicon.png" type="image/gif" />
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="Home/css/jquery.mCustomScrollbar.min.css">
        <!-- Tweaks for older IEs-->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <!-- fonts -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
        <!-- font awesome -->
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--  -->
        <!-- owl stylesheets -->
        <link href="https://fonts.googleapis.com/css?family=Great+Vibes|Poppins:400,700&display=swap&subset=latin-ext" rel="stylesheet">
        <link rel="stylesheet" href="../Home/css/owl.carousel.min.css">
        <link rel="stylesoeet" href="../Home/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
        <style>
            /* General styles */
            body {
                font-family: 'Poppins', sans-serif;
                background-color: #f8f9fa;
                margin: 0;
                padding: 0;
            }

            .container {
                margin-top: 30px;
            }

            h1 {
                text-align: center;
                color: #f26522;
                font-size: 32px;
                margin-bottom: 20px;
            }

            /* Alert Message */
            .alert {
                margin-top: 20px;
                padding: 15px;
                border-radius: 5px;
                background-color: #f44336;
                color: white;
                font-size: 16px;
                text-align: center;
            }

            .alert-danger {
                background-color: #f44336;
            }

            /* Giỏ hàng */
            table {
                width: 100%;
                margin-top: 30px;
                border-collapse: collapse;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            th, td {
                padding: 15px;
                text-align: center;
                border: 1px solid #ddd;
                font-size: 16px;
            }

            th {
                background-color: #f26522;
                color: white;
                font-weight: bold;
            }

            td {
                background-color: #fafafa;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            a {
                text-decoration: none;
                color: #f26522;
            }

            a:hover {
                color: #d4530b;
            }

            button {
                background-color: #f26522;
                color: white;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            button:hover {
                background-color: #d4530b;
            }

            /* Footer */
            .footer_section {
                background-color: #333;
                color: white;
                padding: 40px 0;
                text-align: center;
            }

            .footer_section a {
                color: #f26522;
                text-decoration: none;
            }

            .footer_section a:hover {
                color: #d4530b;
            }

            .footer_menu ul {
                list-style: none;
                padding: 0;
                text-align: center;
            }

            .footer_menu ul li {
                display: inline;
                margin: 10px;
            }

            .footer_menu ul li a {
                color: #ffffff;
                text-decoration: none;
            }

            .footer_menu ul li a:hover {
                color: #f26522;
            }

            /* Thanh tìm kiếm */
            .input-group {
                width: 80%;
                margin: 20px auto;
                padding: 10px;
                border-radius: 5px;
            }

            .input-group input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .input-group-append button {
                background-color: #f26522;
                color: white;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
            }

            .input-group-append button:hover {
                background-color: #d4530b;
            }

            /* Tổng tiền */
            h3 {
                color: #f26522;
                font-size: 24px;
                margin-top: 20px;
                text-align: right;
            }

            a.checkout {
                background-color: #f26522;
                color: white;
                padding: 10px 20px;
                border-radius: 5px;
                display: inline-block;
                text-align: center;
                margin-top: 10px;
                text-decoration: none;
                font-size: 18px;
            }

            a.checkout:hover {
                background-color: #d4530b;
            }

        </style>
    </head>
    <body>
        <div>
            <%-- Hiển thị thông báo lỗi nếu có --%>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">
                    ${error}
                </div>
            </c:if>

            <h1>Giỏ hàng của bạn</h1>
            <table border="1">
                <tr>
                    <th>STT</th>
                    <th>Sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Giá</th>
                    <th>Tổng</th>
                    <th>Hành động</th>
                </tr>
                <%
                    // Lấy danh sách sản phẩm trong giỏ hàng
                    List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
                    int index = 1;
                    double total = 0;
                    for (CartItem item : cartItems) {
                        double itemTotal = item.getPrice() * item.getQuantity();
                        total += itemTotal;
                %>
                <tr>
                    <td><%= index++%></td>
                    <td><%= item.getProductId()%></td>
                    <td><%= item.getQuantity()%></td>
                    <td><%= item.getPrice()%> VND</td>
                    <td><%= itemTotal%> VND</td>
                    <td>
                        <a href="deleteCartItem?id=<%= item.getId()%>">Xóa</a>
                    </td>
                </tr>
                <% }%>
            </table>

            <h3>Tổng tiền: <%= total%> VND</h3>
            <a href="CheckoutServlet" class="checkout">Thanh toán</a>
            <a href="/tradingjdbc_demo/listhome" class="back-home">Quay lại trang chủ</a>
        </div>
    </body>

</html>