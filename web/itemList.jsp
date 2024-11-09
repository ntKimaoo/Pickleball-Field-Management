<%-- 
    Document   : shop
    Created on : Jun 24, 2024, 1:09:07 PM
    Author     : kiennn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">


    <!-- molla/category-4cols.html  22 Nov 2019 10:02:52 GMT -->
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="keywords" content="HTML5 Template">
        <meta name="description" content="Molla - Bootstrap eCommerce Template">
        <meta name="author" content="p-themes">

        <!-- Plugins CSS File -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <!-- Main CSS File -->
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/plugins/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="assets/css/plugins/magnific-popup/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/plugins/nouislider/nouislider.css">

        <style>
            .rd-navbar-top-panel {
                background-color: #000;
            }

            .rd-navbar.rd-navbar-fixed,
            .rd-navbar.rd-navbar-static {
                background-color: #000 !important;
            }


            .rd-navbar-wrap {
                background-color: #000 !important;
            }

            .rd-navbar-menu-wrap {
                background-color: #000 !important;
            }


            .rd-navbar a {
                color: #fff !important;
            }
            .rd-navbar a:hover,
            .rd-navbar a:focus {
                color: #f0f0f0 !important;
            }
            body {
                background-color: #fff !important;
                color: #000;
            }

        </style>
    </head>

    <body>
        <div class="page-wrapper">
            <div class="rd-navbar-wrap">
                <nav class="rd-navbar container rd-navbar-floated rd-navbar-dark" data-md-device-layout="rd-navbar-fixed" data-lg-device-layout="rd-navbar-static" data-lg-auto-height="true" data-md-layout="rd-navbar-fixed" data-lg-layout="rd-navbar-static" data-lg-stick-up="true">
                    <div class="rd-navbar-inner">
                        <!-- RD Navbar Top Panel-->
                        <div class="rd-navbar-top-panel context-dark bg-danger">
                            <div class="left-side">
                                <address class="contact-info text-left"><a href="tel:+84989423251"><span class="icon mdi mdi-cellphone-android novi-icon"></span><span class="text-middle">0989 423 251</span></a></address>
                            </div>
                            <div class="center">
                                <address class="contact-info text-left"><a href="#"><span class="icon mdi mdi-map-marker-radius novi-icon"></span><span class="text-middle">Khu Cong Nghe Cao Hoa Lac, Thach That, Ha Noi</span></a></address>
                            </div>
                            <div class="right-side">
                                <ul class="list-inline list-inline-sm">
                                    <li class="list-inline-item"><a class="novi-icon fa fa-facebook" href="#"></a></li>
                                    <li class="list-inline-item"><a class="novi-icon fa fa-instagram" href="#"></a></li>
                                    <li class="list-inline-item"><a class="novi-icon fa fa-google-plus" href="#"></a></li>
                                    <li class="list-inline-item"><a class="novi-icon fa fa-youtube" href="#"></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- RD Navbar Panel -->
                        <div class="rd-navbar-panel">
                            <!-- RD Navbar Toggle-->
                            <button class="rd-navbar-toggle" data-rd-navbar-toggle=".rd-navbar, .rd-navbar-nav-wrap"><span></span></button>
                            <!-- RD Navbar Top Panel Toggle-->
                            <button class="rd-navbar-top-panel-toggle" data-rd-navbar-toggle=".rd-navbar, .rd-navbar-top-panel"><span></span></button>
                            <!--Navbar Brand-->
                            <div class="rd-navbar-brand"><a href="index.html"><img width='173' height='30' src='images/logo.png' alt=''/></a></div>
                        </div>
                        <div class="rd-navbar-menu-wrap">
                            <div class="rd-navbar-nav-wrap">
                                <div class="rd-navbar-mobile-scroll">
                                    <!--Navbar Brand Mobile-->
                                    <div class="rd-navbar-mobile-brand"><a href="index.html"><img width='173' height='30' src='images/logo.png' alt=''/></a></div>
                                    <!-- RD Navbar Nav-->
                                    <ul class="rd-navbar-nav">
                                        <li class="active"><a href="home"><span>Home</span></a></li>
                                        <li class="active"><a href="datsan"><span>ĐẶT SÂN</span></a></li>
                                        <li class="active"><a href="shop"><span>Shop</span></a></li>
                                        <li class="active"><a href="news"><span>Tin tức</span></a></li>
                                        <li class="active"><a href="profile"><span>Profile</span></a></li>

                                        <li class="active"><a href="logout"><span>Log out</span></a></li>
                                        <li class="active">
                                            <div class="dropdown cart-dropdown">
                                                <a href="cart" class="dropdown-toggle" role="button">
                                                    <i class="icon-shopping-cart"></i>
                                                    <span class="cart-count">${sessionScope.size}</span>
                                                </a>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>

            <main class="main">
                <div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
                    <div class="container">
                        <h1 class="page-title">Sản phẩm chính hãng<span>Mua sắm ngay</span></h1>
                    </div><!-- End .container -->
                </div><!-- End .page-header -->

                <div class="page-content">
                    <div class="container">
                        <div class="row">
                            <div class="${searchFound!=null ? "col-lg-12" : "col-lg-9"}">
                                <div class="toolbox" style="margin-top: 20px">
                                </div><!-- End .toolbox -->
                                <form name="do" action="" method="post">
                                    <div class="products mb-3">
                                        <div class="row justify-content-center">
                                            <c:forEach items="${itemList}" var="list">
                                                <c:if test="${list.status}">
                                                    <div class="col-6 col-md-4 col-lg-4 col-xl-3">
                                                        <div class="product product-7 text-center">
                                                            <figure class="product-media">
                                                                <span class="product-label label-new">New</span>
                                                                <a href="itemdetail?itemId=${list.id}">
                                                                    <img src="${list.image}" alt="Product image" class="product-image">
                                                                </a>

                                                                <div class="product-action">
                                                                    <c:if test="${sessionScope.user != null}">
                                                                        <a onclick="addtocart('${list.id}')" style="cursor: pointer" class="btn-product btn-cart"><span>add to cart</span></a> 
                                                                    </c:if>
                                                                    <c:if test="${sessionScope.user == null}">
                                                                        <a href="Login.jsp" style="cursor: pointer" class="btn-product btn-cart"><span>add to cart</span></a>   
                                                                    </c:if>

                                                                </div><!-- End .product-action -->
                                                            </figure><!-- End .product-media -->

                                                            <div class="product-body">
                                                                <h3 class="product-title"><a href="detail?itemId=${list.id}" style="font-family: sans-serif">${list.name}</a></h3><!-- End .product-title -->
                                                                <div class="product-price">
                                                                    <fmt:formatNumber value="${list.cost}" pattern="#,##0.###" />K vnd
                                                                </div><!-- End .product-price -->
                                                            </div><!-- End .product-body -->
                                                        </div><!-- End .product -->
                                                    </div><!-- End .col-sm-6 col-lg-4 col-xl-3 -->
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </form>
                                <c:if test="${itemList==null || itemList.size()==0}">
                                    <h3> Không có sản phẩm bạn đang tìm kiếm !</h3>
                                </c:if>      
                                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                    <ul class="pagination">
                                        <c:if test="${page > 1}">
                                            <li class="page-item">
                                                <a class="page-link" href="shop?page=${page - 1}">Previous</a>
                                            </li>
                                        </c:if>                                    
                                        <c:forEach begin="1" end="${totalPage}" var="i">
                                            <li class="page-item ${i == page?"active":""}"><a class="page-link" href="shop?page=${i}">${i}</a></li>
                                            </c:forEach>
                                            <c:if test="${page < totalPage}">
                                            <li class="page-item">
                                                <a class="page-link" href="shop?page=${page + 1}">Next</a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </nav>

                            </div><!-- End .col-lg-9 -->
                            <aside class="col-lg-3 order-lg-first">
                                <div class="sidebar sidebar-shop">
                                    <div style="margin-top: 20px;">
                                        <form action="search" method="post">
                                            <div class="header-search-wrapper">
                                                <label for="q" class="sr-only">Search</label>
                                                <input type="search" class="form-control" name="search" id="q" placeholder="Search in..." required>
                                            </div> 
                                        </form>
                                    </div> 
                                    <div class="widget widget-clean">
                                    </div><!-- End .widget widget-clean -->
                                    <div class="widget widget-collapsible">
                                        <h3 class="widget-title">
                                            <a data-toggle="collapse" href="#widget-1" role="button" aria-expanded="true" aria-controls="widget-1">
                                                Category
                                            </a>
                                        </h3><!-- End .widget-title -->

                                        <div class="collapse show" id="widget-1">
                                            <div class="widget-body">
                                                <div class="filter-items filter-items-count">
                                                    <div class="filter-item">
                                                        <div>
                                                            <a href="shop" >All Product</a>
                                                        </div><!-- End .custom-checkbox -->
                                                    </div><!-- End .filter-item -->
                                                    <c:forEach items="${categoryList}" var="listCate">
                                                        <c:if test="${listCate.status}">                                                           
                                                            <div class="filter-item">
                                                                <div>
                                                                    <a href="category?id=${listCate.id}" >${listCate.name}</a>
                                                                </div><!-- End .custom-checkbox -->
                                                            </div><!-- End .filter-item -->
                                                        </c:if>
                                                    </c:forEach>
                                                </div><!-- End .filter-items -->
                                            </div><!-- End .widget-body -->
                                        </div><!-- End .collapse -->
                                    </div><!-- End .widget -->
                                </div>
                            </aside><!-- End .col-lg-3 -->

                        </div><!-- End .row -->
                    </div><!-- End .container -->
                </div><!-- End .page-content -->
            </main><!-- End .main -->

        </div><!-- End .page-wrapper -->

        <!-- Plugins JS File -->
        <script type="text/javascript">
            function addtocart(id) {
                document.do.action = "addtocart?itemId=" + id;
                document.do.submit();
            }
        </script>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>
        <script src="js/core.min.js"></script>
        <script src="js/script.js"></script>
        <%@include file="footer.jsp"  %>

    </body>
    <!-- molla/category-4cols.html  22 Nov 2019 10:02:55 GMT -->
</html>