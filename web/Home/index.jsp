<%@page import="Model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Category" %>
<%@page import="Model.Product" %>
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
        <link rel="stylesheet" href="Home/css/owl.carousel.min.css">
        <link rel="stylesoeet" href="Home/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
        <style>

        </style>
    </head>

    <body>

        <!-- banner bg main start -->
        <div class="banner_bg_main">
            <!-- header top section start -->
            <div class="container">
                <div class="header_section_top">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="custom_menu">
                                <ul>
                                    <li><a href="#">Sản phẩm bán chạy</a></li>
                                    <li><a href="#">Quà tặng</a></li>
                                    <li><a href="#">Bản phát hành mới</a></li>
                                    <li><a href="#">Ưu đãi hôm nay</a></li>
                                    <li><a href="#">dịch vụ khách hàng</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- header top section start -->
            <!-- logo section start -->
            <div class="logo_section">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="logo"><a href="listhome"><img src="Home/images/logo.png"></a></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- logo section end -->
            <!-- header section start -->
            <div class="header_section">
                <div class="container">
                    <div class="containt_main">
                        <div id="mySidenav" class="sidenav">
                            <c:forEach var="i" items="${requestScope.listdata}">
                                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                                <a href="listhome?categoryId=${i.id}">${i.name}</a>                            
                            </c:forEach>
                        </div>
                        <span class="toggle_icon" onclick="openNav()"><img src="Home/images/toggle-icon.png"></span>
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <a style= "text-decoration: none;  color: #f26522;" href="tradingjdbc_demo/listhome">Tất cả danh mục</a>
                            </button>    
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a href="listhome">Tất cả danh mục</a>
                                <c:forEach var="i" items="${requestScope.listdata}">                              
                                    <a class="dropdown-item" href="listhome?categoryId=${i.id}">${i.name}</a>                                                   
                                </c:forEach>
                            </div>
                        </div>

                        <div class="main">
                            <!-- Another variation with a button -->
                            <form action="listhome" method="get">
                                <div class="input-group">
                                    <input type="text" name="search" class="form-control" placeholder="Tìm kiếm sản phẩm">
                                    <div class="input-group-append">
                                        <button class="btn btn-secondary" type="submit" name="btnSearch" style="background-color: #f26522; border-color: #f26522;">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="header_box">
                            <div class="lang_box ">
                                <a href="LogoutServlet"  class="nav-link"  >
                                    đăng xuất
                                </a>

                            </div>
                            <div class="login_menu">
                                <ul>
                                    <li><a href="cart">
                                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                            <span class="padding_10">Giỏ hàng</span>
                                            <span id="cart-count" class="cart-count">0</span> <!-- Số lượng sản phẩm trong giỏ hàng -->
                                        </a>
                                    </li>
                                    <li><a href="login">
                                            <i class="fa fa-user" aria-hidden="true"></i>
                                            <span class="padding_10">Tài khoản</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!-- header section end -->
            <!-- banner section start -->
            <div class="banner_section layout_padding">
                <div class="container">
                    <div id="my_slider" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h1 class="banner_taital">Shop Long Hoang</br> Đẳng cấp vượt trội </h1>
                                        <div class="buynow_bt"><a href="#">mua ngay</a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h1 class="banner_taital">Shop Long Hoang</br> Đẳng cấp vượt trội </h1>
                                        <div class="buynow_bt"><a href="#">mua ngay</a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h1 class="banner_taital">Shop Long Hoang</br> Đẳng cấp vượt trội </h1>
                                        <div class="buynow_bt"><a href="#">mua ngay</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#my_slider" role="button" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a class="carousel-control-next" href="#my_slider" role="button" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>
                </div>
            </div>
            <!-- banner section end -->
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
        <!-- jewellery  section end -->
        <!-- footer section start -->
        <div class="footer_section layout_padding">
            <div class="container">
                <div class="footer_logo"><a href="index.html"><img src="Home/images/footer-logo.png"></a></div>
                <div class="input_bt">
                    <input type="text" class="mail_bt" placeholder=" Email của bạn" name="Email của bạn">
                    <span class="subscribe_bt" id="basic-addon2"><a href="#">Subscribe</a></span>
                </div>
                <div class="footer_menu">
                    <ul>
                        <li><a href="#">Sản phẩm bán chạy</a></li>
                        <li><a href="#">Quà tặng</a></li>
                        <li><a href="#">Bản phát hành mới </a></li>
                        <li><a href="#">Ưu đãi hôm nay</a></li>
                        <li><a href="#">Dịch vụ khách hàng</a></li>
                    </ul>
                </div>
                <div class="location_main">Liên hệ : <a href="#">033 925 0091</a></div>
            </div>
        </div>
        <!-- footer section end -->
        <!-- copyright section start -->
        <div class="copyright_section">
            <div class="container">
                <p class="copyright_text">© 2024 sản phẩm được tạo bởi  <a href="https://html.design">Huy Hoàng và Hoàng Long</a></p>
            </div>
        </div>
        <!-- copyright section end -->
        <!-- Javascript files-->
        <script src="Home/js/jquery.min.js"></script>
        <script src="Home/js/popper.min.js"></script>
        <script src="Home/js/bootstrap.bundle.min.js"></script>
        <script src="Home/js/jquery-3.0.0.min.js"></script>
        <script src="Home/js/plugin.js"></script>
        <!-- sidebar -->
        <script src="Home/js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="Home/js/custom.js"></script>
        <script>
                            function openNav() {
                                document.getElementById("mySidenav").style.width = "250px";
                            }

                            function closeNav() {
                                document.getElementById("mySidenav").style.width = "0";
                            }
        </script>
    </body>
</html>