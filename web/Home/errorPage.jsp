<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
</head>
<body>
     <h2>Ồ! Có lỗi xảy ra rồi.</h2>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">
                    ${error}
                </div>
            </c:if>  
    <p>Đã xảy ra sự cố khi xử lý yêu cầu của bạn. Vui lòng thử lại sau.</p>
    <a href="listhome">Quay lại trang chủ</a> 
</body>
</html>
