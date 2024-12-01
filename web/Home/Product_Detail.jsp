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
        <link rel="stylesheet" href="../Home/css/owl.carousel.min.css">
        <link rel="stylesoeet" href="../Home/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">

        <style>
            .product_detail_section .row {
                display: flex;
                flex-wrap: wrap;
                align-items: stretch; /* Căn chỉnh các cột đồng đều */
            }

            .product_detail_section .col-sm-6 {
                flex: 1;
                margin: 15px;
            }

            /* CSS cho phần chi tiết sản phẩm */
            .product_detail_section {
                padding: 40px 0;
            }

            .product_detail_section h2 {
                text-align: center;
                font-size: 2rem;
                margin-bottom: 30px;
                color: #f26522;
            }

            .product_detail_section .container {
                max-width: 1200px;
                margin: 0 auto;
            }

            .product_detail_section .row {
                display: flex;
                flex-wrap: wrap;
                align-items: center;
            }

            .product_detail_section .col-sm-6 {
                flex: 1;
                margin: 15px;
            }

            .product_detail_section img {
                width: 100%;
                height: auto;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }

            .product_detail_section h1 {
                font-size: 2rem;
                color: #333;
                margin-bottom: 20px;
            }

            .product_detail_section p {
                font-size: 1.1rem;
                color: #555;
                line-height: 1.6;
            }

            .product_detail_section h2 {
                font-size: 1.5rem;
                color: #f26522;
                margin-bottom: 20px;
            }

            .product_detail_section .form-group {
                margin-bottom: 20px;
            }

            .product_detail_section label {
                font-size: 1rem;
                color: #333;
                margin-bottom: 10px;
                display: block;
            }

            .product_detail_section input[type="number"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .product_detail_section button {
                background-color: #f26522;
                border: none;
                color: #fff;
                padding: 10px 20px;
                font-size: 1rem;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .product_detail_section button:hover {
                background-color: #d9534f;
            }
            .product_detail_section h2 {
                font-size: 1.8rem; /* Điều chỉnh kích thước font cho phù hợp */
                color: #f26522; /* Màu sắc nổi bật */
                margin-bottom: 20px; /* Khoảng cách dưới */
                border-bottom: 2px solid #f26522; /* Thêm đường gạch dưới để tạo điểm nhấn */
                padding-bottom: 10px; /* Khoảng cách giữa text và đường gạch dưới */
                font-weight: bold; /* Đậm để nổi bật hơn */
            }

        </style>
    </head>
    <body>
        <script>

            let cartItems = []; // Lưu trữ các sản phẩm trong giỏ hàng

            function addToCart(product) {
                cartItems.push(product); // Thêm sản phẩm vào giỏ hàng
                updateCartCount(); // Cập nhật số lượng sản phẩm trong giỏ hàng
            }

            function updateCartCount() {
                let cartCount = cartItems.length; // Lấy số lượng sản phẩm trong giỏ hàng
                document.getElementById("cart-count").textContent = cartCount; // Cập nhật số lượng vào giao diện
            }

            document.getElementById("add-to-cart-button").addEventListener("click", function () {
                let product = {
                    id: 1,
                    name: "Product 1",
                    price: 100
                };
                addToCart(product); // Thêm sản phẩm vào giỏ và cập nhật số lượng
            });

        </script>
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
                            <c:forEach var="i" items="${requestScope.listdata1}">
                                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                                <a href="productdetail?categoryId=${i.id}">${i.name}</a>                            
                            </c:forEach>
                        </div>
                        <span class="toggle_icon" onclick="openNav()"><img src="Home/images/toggle-icon.png"></span>
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <a style= "text-decoration: none;  color: #f26522;" href="tradingjdbc_demo/productdetail">Tất cả danh mục</a>
                            </button>    
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a href="listhome">Tất cả danh mục</a>
                                <c:forEach var="i" items="${requestScope.listdata1}">                              
                                    <a class="dropdown-item" href="productdetail?categoryId=${i.id}">${i.name}</a>                                                   
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
                                    <li><a href="#">
                                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                            <span class="padding_10">giỏ hàng</span></a>
                                    </li>
                                    <li><a href="login">
                                            <i class="fa fa-user" aria-hidden="true"></i>
                                            <span class="padding_10">tài khoản</span></a>
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

        <!-- product detail section start -->
        <div class="product_detail_section layout_padding">
            <h2>Thông tin sản phẩm</h2>
            <div class="container">
            
                <c:if test="${not empty success}">
                    <div class="alert alert-success">
                        ${success}  <!-- Hiển thị thông báo thành công -->
                    </div>
                </c:if>

                <c:choose>
                    <c:when test="${not empty product}">
                        <div class="row">
                            <!-- Hình ảnh sản phẩm -->
                            <div class="col-sm-6">
                                <img src="Admin/image/${product.image}" alt="${product.name}" class="img-fluid">
                            </div>
                            <!-- Thông tin sản phẩm -->
                            <div class="col-sm-6">
                                <h1>${product.name}</h1>
                                <p>${product.description}</p>
                                <h2><fmt:formatNumber value="${product.price}" type="currency"/> VND</h2>
                                <form action="cart" method="post">
                                    <!-- ID sản phẩm -->
                                    <input type="hidden" name="productId" value="${product.id}">
                                    <!-- Giá sản phẩm -->
                                    <input type="hidden" name="price" value="${product.price}">
                                    <!-- Số lượng sản phẩm -->
                                    <div class="form-group">
                                        <label for="quantity">Số lượng:</label>
                                        <input type="number" id="quantity" name="quantity" value="1" min="1" class="form-control">
                                    </div>
                                    <!-- Nút thêm vào giỏ hàng -->
                                    <button type="submit" class="btn btn-primary" id="add-to-cart-button">Thêm vào giỏ hàng</button>
                                </form>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <p>Không tìm thấy sản phẩm.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <!-- product detail section end -->

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
                <p class="copyright_text">© 2024 sản phẩm được tạo bởi  <a href="">Huy Hoàng và Hoàng Long</a></p>
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
