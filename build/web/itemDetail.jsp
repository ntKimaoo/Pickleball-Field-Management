<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">


    <!-- molla/product.html  22 Nov 2019 09:54:50 GMT -->
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="keywords" content="HTML5 Template">
        <meta name="description" content="Molla - Bootstrap eCommerce Template">
        <meta name="author" content="p-themes">

        <!-- Plugins CSS File -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/plugins/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="assets/css/plugins/magnific-popup/magnific-popup.css">
        <!-- Main CSS File -->
        <link rel="stylesheet" href="assets/css/style.css">
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
                <div class="page-content" style="margin-top: 30px">
                    <div class="container">
                        <div class="product-details-top">
                            <input type="hidden" value="${itemDetail.id}" name="itemId">
                            <div class="row" style="margin-top: 10px">
                                <div class="col-md-6">
                                    <div class="product-gallery product-gallery-vertical">
                                        <div class="row">
                                            <figure class="product-main-image">
                                                <img id="product-zoom" src="${itemDetail.image}" data-zoom-image="${itemDetail.image}" alt="product image">
                                            </figure><!-- End .product-main-image -->
                                        </div><!-- End .row -->
                                    </div><!-- End .product-gallery -->
                                </div><!-- End .col-md-6 -->

                                <div class="col-md-6">
                                    <div class="product-details">
                                        <form action="addtocart" method="get">
                                            <!-- Hidden field for item ID -->
                                            <input type="hidden" name="itemId" value="${itemDetail.id}">

                                            <h1 class="product-title">${itemDetail.name}</h1><!-- End .product-title -->
                                            <div class="product-price">
                                                ${itemDetail.cost}K VND
                                            </div><!-- End .product-price -->



                                            <!-- Field for quantity selection -->
                                            <div class="details-filter-row details-row-size">
                                                <label for="qty">Số lượng:</label>
                                                <div class="product-details-quantity">
                                                    <input name="numberOfItem" type="number" id="qty" class="form-control" value="1" 
                                                           min="1" max="${itemDetail.quantity}" step="1" required>
                                                </div>
                                            </div>




                                            <!-- Add to Cart button -->
                                            <div class="product-details-action">
                                                <c:if test="${sessionScope.user == null}">
                                                    <c:if test="${itemDetail.quantity > 0}">
                                                        <a href="login" class="btn-product btn-cart"><span>Add to Cart</span></a>
                                                    </c:if>
                                                    <c:if test="${itemDetail.quantity == 0}">
                                                        <button type="button" class="btn-product btn-cart" disabled=""><span>Sản phẩm tạm hết</span></button>
                                                    </c:if>
                                                </c:if>

                                                <c:if test="${sessionScope.user != null}">
                                                    <c:if test="${itemDetail.quantity > 0}">
                                                        <button type="submit" class="btn-product btn-cart"><span>Add to Cart</span></button>
                                                    </c:if>
                                                    <c:if test="${itemDetail.quantity == 0}">
                                                        <button type="button" class="btn-product btn-cart" disabled=""><span>Sản phẩm tạm hết</span></button>
                                                    </c:if>
                                                </c:if>


                                            </div>
                                        </form>
                                    </div><!-- End .product-details -->
                                    <div class="product-content" >
                                        <p style="font-family: monospace">${itemDetail.description} </p>
                                    </div><!-- End .product-content -->
                                </div><!-- End .col-md-6 -->
                            </div><!-- End .row -->
                        </div><!-- End .product-details-top -->


                        <h2 class="title text-center mb-4" style="font-family: sans-serif">Sản phẩm tương tự</h2><!-- End .title text-center -->

                        <div class="owl-carousel owl-simple carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                             data-owl-options='{
                             "nav": false, 
                             "dots": true,
                             "margin": 20,
                             "loop": false,
                             "responsive": {
                             "0": {
                             "items":1
                             },
                             "480": {
                             "items":2
                             },
                             "768": {
                             "items":3
                             },
                             "992": {
                             "items":4
                             },
                             "1200": {
                             "items":4,
                             "nav": true,
                             "dots": false
                             }
                             }
                             }'>
                            <c:forEach items="${last}" var="l">
                                <div class="product product-7 text-center">
                                    <figure class="product-media">
                                        <a href="itemdetail?itemId=${l.id}">
                                            <img src="${l.image}" alt="Product image" class="product-image">
                                        </a>
                                        <div class="product-action">
                                            <a href="addtocart?itemId=${l.id}" class="btn-product btn-cart"><span>add to cart</span></a>
                                        </div><!-- End .product-action -->
                                    </figure><!-- End .product-media -->

                                    <div class="product-body">
                                        <h3 class="product-title"><a href="itemdetail?itemId=${l.id}">${l.name}</a></h3><!-- End .product-title -->
                                        <div class="product-price">
                                            ${l.cost}K VND
                                        </div><!-- End .product-price -->
                                    </div><!-- End .product-body -->
                                </div><!-- End .product -->
                            </c:forEach>
                        </div><!-- End .owl-carousel -->
                    </div><!-- End .container -->
                </div><!-- End .page-content -->
            </main><!-- End .main -->


        </div><!-- End .page-wrapper -->





        <!-- Plugins JS File -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/jquery.hoverIntent.min.js"></script>
        <script src="assets/js/jquery.waypoints.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/jquery.elevateZoom.min.js"></script>
        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>
        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>
        <script src="js/core.min.js"></script>
        <script src="js/script.js"></script>
        <%@include file="footer.jsp"  %>
    </body>


    <!-- molla/product.html  22 Nov 2019 09:55:05 GMT -->
</html>

