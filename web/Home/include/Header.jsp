<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
