<%-- 
    Document   : Home
    Created on : Aug 12, 2024, 11:05:46 AM
    Author     : hoang quang huy
--%>

<%@page import="Model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Style.css"/>

        <title>JSP Page</title>
    </head>
    <body>


        <%@include file="Header.jsp" %>
        <!-- Thêm div chứa hình ảnh ở giữa trang -->
        <div class="image-container">
            <img src="Admin/image/banner.jpg" alt="Image description"/>
        </div>
        <%@include file="Footer.jsp" %>


    </body>
</html>
