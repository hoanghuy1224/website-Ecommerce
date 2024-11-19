<%-- 
    Document   : List
    Created on : Aug 5, 2024, 11:35:54 AM
    Author     : hoang quang huy
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Category" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/Style.css"/>
        <title>list product</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 80vh;
                background-color: #f8f9fa;
            }

            h1 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }

            .container {
                width: 90%;
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow-x: auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
                font-size: 16px;
            }

            table, th, td {
                border: 1px solid #ddd;
            }

            th, td {
                padding: 12px;
                text-align: left;
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
                padding: 8px 16px;
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
            .btn-edit a{
                color: white;
                text-decoration: none;
            }
            .btn-delete a{
                color: white;
                text-decoration: none;
            }
        </style>
    </head>
    <body>

        <jsp:include page="Header.jsp" />

        <div class="container">
            <!--<h1>List Product</h1>-->
            <button class="btn btn-insert"><a href="Admin/Add.jsp">Add Product</a></button>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>DESCRIBE</th>
                        <th>SELECT</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="i" items="${data}">
                        <c:set var="id" value="${i.id}"/>
                        <tr>
                            <td>${id}</td>
                            <td>${i.name}</td>
                            <td>${i.describe}</td>
                            <td>
                                <button class="btn btn-edit"><a href="edit?id=${id}">Edit</a></button>
                                <button class="btn btn-delete"><a href="delete?id=${id}">Delete</a></button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

      

    </body>
</html>
