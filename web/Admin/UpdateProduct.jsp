<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f8f9fa;
            }

            .container {
                width: 100%;
                max-width: 600px;
                margin: 20px;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }

            h1 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }

            form {
                display: flex;
                flex-direction: column;
            }

            label {
                margin-bottom: 5px;
                font-weight: bold;
                color: #555;
            }

            input[type="text"],
            input[type="number"],
            input[type="file"],
            input[type="date"] {
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
            }

            select {
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
            }

            .btn-submit {
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                background-color: #007bff;
                color: white;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                align-self: center;
            }

            .btn-submit:hover {
                background-color: #0056b3;
            }

            .error-message {
                color: red;
                margin-bottom: 20px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Edit Product</h1>

            <c:if test="${not empty requestScope.error}">
                <div class="error-message">${requestScope.error}</div>
            </c:if>
            
            <c:set var="c" value="${requestScope.product}"/>

            <form action="/tradingjdbc_demo/editproduct" method="post" enctype="multipart/form-data">
                
                <input type="hidden" name="id" value="${c.id}">

                <label for="name">Name</label>
                <input type="text" id="name" name="name" value="${c.name}" required>

                <label for="description">Description</label>
                <input type="text" id="description" name="description" value="${c.description}" required>

                <label for="price">Price</label>
                <input type="number" step="0.01" id="price" name="price" value="${c.price}" required>

                <label for="image">Image</label>
                <input type="file" id="image" name="image" accept="image/*">

                <c:if test="${not empty c.image}">
                    <img src="Admin/image/${c.image}" alt="Product Image" style="max-width: 150px; margin-top: 10px;">
                </c:if>

                <label for="category_id">Category ID</label>
                <input type="number" id="category_id" name="category_id" value="${c.categoryId}" required>

                <button type="submit" class="btn-submit">Submit</button>
            </form>
        </div>
    </body>
</html>
