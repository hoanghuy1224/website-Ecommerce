<%-- 
    Document   : Update
    Created on : Aug 7, 2024, 1:19:17 PM
    Author     : hoang quang huy
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Category" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>update product</title>
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

            input[type="text"], textarea {
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
            }

            textarea {
                resize: vertical;
                height: 100px;
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
        </style>
    </head>
    <body>
        <div class="container">
            <h1>sửa sản phẩm</h1>
            <c:set var="c" value="${requestScope.category}"/>
            <form action="edit" method="post">
                <label for="id">ID</label>
                <input type="text" id="id" name="id" value="${c.id}" required>

                <label for="name">NAME</label>
                <input type="text" id="name" name="name" value="${c.name}" required>

                <label for="describe">DESCRIBE</label>
                <input type="text" id="describe" name="describe" value="${c.describe}" required>
                <button type="submit" class="btn-submit">UPDATE</button>
            </form>
        </div>
    </body>
</html>
