<%@page import="Model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Category" %>
<%@page import="Model.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


            <%@include file="include/Header.jsp" %>
            
             <%@include file="include/Banner.jsp" %>
        </div>
        <!-- banner bg main end -->
        <!-- fashion section start -->
        <div class="fashion_section">
            <div id="main_slider" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="container">
                            <h1 class="fashion_taital">Thiết bị thông minh </h1>
                            <div class="fashion_section_2">
                                <div class="row">
                                    <c:if test="${not empty listproduct}">
                                        <c:forEach var="product" items="${filterid4}">
                                            <div class="col-lg-4 col-sm-4">
                                                <div class="box_main">
                                                    <h4 class="shirt_text">${product.name}</h4>
                                                    <p class="price_text"> Giá <span style="color: #262626;">
                                                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" />
                                                        </span>
                                                    </p>
                                                    <div class="tshirt_img">
                                                        <img src="Admin/image/${product.image}" alt="${product.name}">
                                                    </div>
                                                    <div class="btn_main">
                                                        <div class="buy_bt"><a href="productdetail?id=${product.id}">Mua ngay</a></div>
                                                        <div class="seemore_bt"><a href="">See More</a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty listproduct}">
                                        <p>No products available.</p>
                                    </c:if>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="container">
                            <h1 class="fashion_taital">Thiêt bị thông minh</h1>
                            <div class="fashion_section_2">
                                <div class="row">
                                    <c:if test="${not empty listproduct}">
                                        <c:forEach var="product" items="${filterid4}">
                                            <div class="col-lg-4 col-sm-4">
                                                <div class="box_main">
                                                    <h4 class="shirt_text">${product.name}</h4>
                                                    <p class="price_text"> Giá <span style="color: #262626;">
                                                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" />
                                                        </span>
                                                    </p>
                                                    <div class="tshirt_img">
                                                        <img src="Admin/image/${product.image}" alt="${product.name}">
                                                    </div>
                                                    <div class="btn_main">
                                                        <div class="buy_bt"><a href="productdetail?id=${product.id}">Mua ngay</a></div>
                                                        <div class="seemore_bt"><a href="#">See More</a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty listproduct}">
                                        <p>No products available.</p>
                                    </c:if>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <a class="carousel-control-prev" href="#main_slider" role="button" data-slide="prev">
                    <i class="fa fa-angle-left"></i>
                </a>
                <a class="carousel-control-next" href="#main_slider" role="button" data-slide="next">
                    <i class="fa fa-angle-right"></i>
                </a>
            </div>
        </div>
        <!-- fashion section end -->
        <!-- electronic section start -->
        <div class="fashion_section">
            <div id="electronic_main_slider" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="container">
                            <h1 class="fashion_taital">Quần áo</h1>
                            <div class="fashion_section_2">
                                <div class="row">
                                    <c:if test="${not empty listproduct}">
                                        <c:forEach var="product" items="${filterid1}">
                                            <div class="col-lg-4 col-sm-4">
                                                <div class="box_main">
                                                    <h4 class="shirt_text">${product.name}</h4>
                                                    <p class="price_text"> Giá <span style="color: #262626;">
                                                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" />
                                                        </span>
                                                    </p>
                                                    <div class="tshirt_img">
                                                        <img src="Admin/image/${product.image}" alt="${product.name}">
                                                    </div>
                                                    <div class="btn_main">
                                                        <div class="buy_bt"><a href="productdetail?id=${product.id}">Mua ngay</a></div>
                                                        <div class="seemore_bt"><a href="#">See More</a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty listproduct}">
                                        <p>No products available.</p>
                                    </c:if>                                  
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="container">
                            <h1 class="fashion_taital">Quần áo</h1>
                            <div class="fashion_section_2">
                                <div class="row">
                                    <c:if test="${not empty listproduct}">
                                        <c:forEach var="product" items="${filterid1}">
                                            <div class="col-lg-4 col-sm-4">
                                                <div class="box_main">
                                                    <h4 class="shirt_text">${product.name}</h4>
                                                    <p class="price_text"> Giá <span style="color: #262626;">
                                                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" />
                                                        </span>
                                                    </p>
                                                    <div class="tshirt_img">
                                                        <img src="Admin/image/${product.image}" alt="${product.name}">
                                                    </div>
                                                    <div class="btn_main">
                                                        <div class="buy_bt"><a href="productdetail?id=${product.id}">Mua ngay</a></div>
                                                        <div class="seemore_bt"><a href="#">See More</a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty listproduct}">
                                        <p>No products available.</p>
                                    </c:if>                            

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="container">
                            <h1 class="fashion_taital">Quần áo </h1>
                            <div class="fashion_section_2">
                                <div class="row">
                                    <c:if test="${not empty listproduct}">
                                        <c:forEach var="product" items="${filterid1}">
                                            <div class="col-lg-4 col-sm-4">
                                                <div class="box_main">
                                                    <h4 class="shirt_text">${product.name}</h4>
                                                    <p class="price_text"> Giá <span style="color: #262626;">
                                                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" />
                                                        </span>
                                                    </p>
                                                    <div class="tshirt_img">
                                                        <img src="Admin/image/${product.image}" alt="${product.name}">
                                                    </div>
                                                    <div class="btn_main">
                                                        <div class="buy_bt"><a href="productdetail?id=${product.id}">Mua ngay</a></div>
                                                        <div class="seemore_bt"><a href="#">See More</a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty listproduct}">
                                        <p>No products available.</p>
                                    </c:if>                            

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#electronic_main_slider" role="button" data-slide="prev">
                    <i class="fa fa-angle-left"></i>
                </a>
                <a class="carousel-control-next" href="#electronic_main_slider" role="button" data-slide="next">
                    <i class="fa fa-angle-right"></i>
                </a>
            </div>
        </div>
        <!-- electronic section end -->
        <!-- jewellery  section start -->
        <div class="jewellery_section">
            <div id="jewellery_main_slider" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="container">
                            <h1 class="fashion_taital">Phụ kiện</h1>
                            <div class="fashion_section_2">
                                <div class="row">
                                    <c:if test="${not empty listproduct}">
                                        <c:forEach var="product" items="${filterid2}">
                                            <div class="col-lg-4 col-sm-4">
                                                <div class="box_main">
                                                    <h4 class="shirt_text">${product.name}</h4>
                                                    <p class="price_text"> Giá <span style="color: #262626;">
                                                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" />
                                                        </span>
                                                    </p>
                                                    <div class="tshirt_img">
                                                        <img src="Admin/image/${product.image}" alt="${product.name}">
                                                    </div>
                                                    <div class="btn_main">
                                                        <div class="buy_bt"><a href="productdetail?id=${product.id}">Mua ngay</a></div>
                                                        <div class="seemore_bt"><a href="#">See More</a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty listproduct}">
                                        <p>No products available.</p>
                                    </c:if>                            

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="container">
                            <h1 class="fashion_taital">Phụ kiện</h1>
                            <div class="fashion_section_2">
                                <div class="row">
                                    <c:if test="${not empty listproduct}">
                                        <c:forEach var="product" items="${filterid2}">
                                            <div class="col-lg-4 col-sm-4">
                                                <div class="box_main">
                                                    <h4 class="shirt_text">${product.name}</h4>
                                                    <p class="price_text"> Giá <span style="color: #262626;">
                                                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" />
                                                        </span>
                                                    </p>
                                                    <div class="tshirt_img">
                                                        <img src="Admin/image/${product.image}" alt="${product.name}">
                                                    </div>
                                                    <div class="btn_main">
                                                        <div class="buy_bt"><a href="productdetail?id=${product.id}">Mua ngay</a></div>
                                                        <div class="seemore_bt"><a href="#">See More</a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty listproduct}">
                                        <p>No products available.</p>
                                    </c:if>                            

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="container">
                            <h1 class="fashion_taital">Phụ kiện</h1>
                            <div class="fashion_section_2">
                                <div class="row">
                                    <c:if test="${not empty listproduct}">
                                        <c:forEach var="product" items="${filterid2}">
                                            <div class="col-lg-4 col-sm-4">
                                                <div class="box_main">
                                                    <h4 class="shirt_text">${product.name}</h4>
                                                    <p class="price_text"> Giá <span style="color: #262626;">
                                                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" />
                                                        </span>
                                                    </p>
                                                    <div class="tshirt_img">
                                                        <img src="Admin/image/${product.image}" alt="${product.name}">
                                                    </div>
                                                    <div class="btn_main">
                                                        <div class="buy_bt"><a href="productdetail?id=${product.id}">Mua ngay</a></div>
                                                        <div class="seemore_bt"><a href="#">See More</a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty listproduct}">
                                        <p>No products available.</p>
                                    </c:if>                            

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#jewellery_main_slider" role="button" data-slide="prev">
                    <i class="fa fa-angle-left"></i>
                </a>
                <a class="carousel-control-next" href="#jewellery_main_slider" role="button" data-slide="next">
                    <i class="fa fa-angle-right"></i>
                </a>
                <div class="loader_main">
                    <div class="loader"></div>
                </div>
            </div>
        </div>
     
<!--         footer section start 
         <%@include file="include/Footer.jsp" %>