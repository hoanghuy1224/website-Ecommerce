
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Category" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Product</title>
        <style>
            /* CSS cho giao di?n và ?i?u ch?nh */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f8f9fa;
            }

            /* ??m b?o tiêu ?? c? ??nh ? trên cùng */
            .header {
                background-color: #343a40;
                color: white;
                padding: 10px 20px;
                text-align: center;
                position: fixed;
                width: 100%;
                top: 0;
                left: 0;
                z-index: 1000;
            }

            /* ?i?u ch?nh margin-top ?? n?i dung không b? che b?i tiêu ?? c? ??nh */
            .container {
                width: 95%;
                max-width: 1600px;
                margin: 80px auto 20px;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow-x: auto;
            }

            h1 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
                font-size: 16px;
                table-layout: fixed;
                word-wrap: break-word;
            }

            table, th, td {
                border: 1px solid #ddd;
            }

            th, td {
                padding: 15px;
                text-align: left;
                vertical-align: middle;
            }

            th {
                background-color: #343a40;
                color: white;
                text-transform: uppercase;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #e9ecef;
            }

            .btn {
                padding: 10px 20px;
                margin-right: 5px;
                border: none;
                border-radius: 4px;
                color: white;
                cursor: pointer;
                transition: background-color 0.3s ease;
                text-decoration: none;
            }

            .btn-edit {
                background-color: #007bff;
            }

            .btn-edit:hover {
                background-color: #0056b3;
            }

            .btn-delete {
                background-color: #dc3545;
            }

            .btn-delete:hover {
                background-color: #c82333;
            }

            .btn-insert {
                background-color: #28a745;
                margin-bottom: 20px;
            }

            .btn-insert:hover {
                background-color: #218838;
            }

            .btn-insert a {
                color: white;
                text-decoration: none;
            }

            .btn-insert a:hover {
                text-decoration: none;
            }

            .btn-edit a {
                color: white;
                text-decoration: none;
            }

            .btn-delete a {
                color: white;
                text-decoration: none;
            }

            img {
                width: 70px; /* Chiều rộng cố định cho hình ảnh */
                height: 70px; /* Chiều cao cố định cho hình ảnh */
                object-fit: cover; /* Đảm bảo hình ảnh lấp đầy khung mà không bị méo */
                border-radius: 5px;
            }

        </style>
    </head>
    <body>

        <jsp:include page="Header.jsp" />

        <div class="container">
            <button class="btn btn-insert"><a href="Admin/AddProduct.jsp">Add Product</a></button>
            <table>
                <thead>
                    <tr>
                        <th>id</th>
                        <th>Name</th>
                        <th>description</th>
                        <th>Price</th>
                        <th>Image</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="i" items="${datapr}">

                        <tr>
                            <td>${i.id}</td> 
                            <td>${i.name}</td>
                            <td>${i.description}</td>
                            <td>${i.price}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty i.image}">
                                        <img src="Admin/image/${i.image}" alt="Product Image"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="path/to/default-image.png" alt="Default Image"/>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td>
                                <button class="btn btn-edit"><a href="editproduct?id=${i.id}">Edit</a></button>
                                <button class="btn btn-delete"><a href="deleteprd?id=${i.id}">Delete</a></button>
                            </td>
                        </tr>
                    </c:forEach>


                </tbody>
            </table>
        </div>

        <!-- Include the Footer -->

    </body>
</html>
