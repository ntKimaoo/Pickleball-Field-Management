<%-- 
    Document   : home
    Created on : Sep 16, 2024, 12:05:33 PM
    Author     : kiennn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html class="wow-animation" lang="en">
    <head>
        <title>Home</title>
        <meta charset="utf-8">
        <meta name="format-detection" content="telephone=no">
        <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="keywords" content="intense web design multipurpose template">
        <meta name="date" content="Dec 26">
        <link rel="icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Ubuntu:400,400italic,500,700,700italic">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <% String currentPage = request.getRequestURI(); %>
        <!-- Page-->
        <div class="page text-center">
            <!-- Page Head-->
            <header class="page-head slider-menu-position" data-preset='{"title":"Header with slider","category":"header, slider","reload":true,"id":"header-1"}'>
                <!-- RD Navbar Transparent-->
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
                                        <li class="list-inline-item"> 
                                            <c:if test="${user!=null}">
                                                <a href="GetPoint.jsp">Point: ${sessionScope.point}</a>
                                            </c:if></li>
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
                                <div class="rd-navbar-brand"><a href="home"><img width='173' height='30' src='images/logo.png' alt=''/></a></div>
                            </div>
                            <div class="rd-navbar-menu-wrap">
                                <div class="rd-navbar-nav-wrap">
                                    <div class="rd-navbar-mobile-scroll">
                                        <!-- RD Navbar Nav-->
                                        <ul class="rd-navbar-nav">
                                            <li class="<%= currentPage.equals("/SWP391PickleballField/home.jsp") ? "active" : "" %>"><a href="home"><span>Home</span></a></li>
                                            <li class="<%= currentPage.equals("/SWP391PickleballField/FieldBooking.jsp") ? "active" : "" %>"><a href="datsan?base=3"><span>ĐẶT SÂN</span></a></li>
                                            <li class="<%= currentPage.equals("/SWP391PickleballField/itemList.jsp") ? "active" : "" %>"><a href="shop"><span>SHOP</span></a></li>
                                            <li class="<%= currentPage.equals("/SWP391PickleballField/news.jsp") ? "active" : "" %>"><a href="news"><span>Tin tức</span></a></li>
                                            <li class="<%= currentPage.equals("/SWP391PickleballField/contacts.jsp") ? "active" : "" %>"><a href="loaditem"><span>Đổi Thưởng</span></a></li>
                                                <c:if test="${sessionScope.user==null}">
                                                <li><a href="login"><span>Login</span></a></li></c:if>
                                                <c:if test="${sessionScope.user!=null}">
                                                <li><a href="profile"><span>Profile</span></a></li></c:if>
                                                <c:if test="${sessionScope.user!=null}">
                                                <li><a href="Membership.jsp"><span>Membership</span></a></li></c:if>
                                                <c:if test="${sessionScope.user!=null}">
                                                <li><a href="logout"><span>Log out</span></a></li></c:if>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
                <!--Swiper-->
                <div class="swiper-container swiper-slider" data-loop="false" data-autoplay="5500" data-dragable="false">
                    <div class="swiper-wrapper text-center">
                        <div class="swiper-slide" data-slide-bg="images/banner02.jpg" data-preview-bg="images/background-01-1920x750.jpg">
                            <div class="swiper-caption swiper-parallax" data-speed="0.5" data-fade="true">
                                <div class="swiper-slide-caption">
                                    <div class="container">
                                        <div class="row justify-content-xl-center">
                                            <div class="col-xl-12">
                                                <div class="text-extra-big font-weight-bold font-italic text-uppercase" data-caption-animate="fadeInUp" data-caption-delay="300">No Pain No Gain</div>
                                            </div>
                                            <div class="col-xl-8 offset-top-10">
                                                <h5 class="hidden d-sm-block text-light" data-caption-animate="fadeInUp" data-caption-delay="500">
                                                    Bạn muốn một nơi để rèn luyện cơ thể, sức khỏe,...?<br/>
                                                    Đã có tôi lo!
                                                </h5>
                                                <div class="offset-top-20 offset-sm-top-50"><a class="btn btn-danger btn-anis-effect" href="#" data-waypoint-to="#welcome" data-caption-animate="fadeInUp" data-caption-delay="800"><span class="btn-text">đặt sân ngay bây giờ</span></a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide" data-slide-bg="images/banner01.png" data-preview-bg="images/background-02-1920x750.jpg">
                            <div class="swiper-caption swiper-parallax" data-speed="0.5" data-fade="true">
                                <div class="swiper-slide-caption">
                                    <div class="container">
                                        <div class="row justify-content-xl-center">
                                            <div class="col-xl-12">
                                                <div class="text-extra-big font-weight-bold font-italic text-uppercase" data-caption-animate="fadeInUp" data-caption-delay="300">never give up</div>
                                            </div>
                                            <div class="col-xl-8 offset-top-10">
                                                <h5 class="hidden d-sm-block text-light" data-caption-animate="fadeInUp" data-caption-delay="500">Mỗi người chơi Pickleball đều cần sự kiên trì và nỗ lực để vươn tới đỉnh cao. Chúng tôi có thể cung cấp cho bạn mọi thứ bạn cần để chinh phục sân đấu.</h5>
                                                <div class="offset-top-20 offset-sm-top-50"><a class="btn btn-danger btn-anis-effect" href="#" data-waypoint-to="#welcome" data-caption-animate="fadeInUp" data-caption-delay="800"><span class="btn-text">mua đồ ngay</span></a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide" data-slide-bg="images/banner03.jpg" data-preview-bg="images/background-03-1920x750.jpg">
                            <div class="swiper-caption swiper-parallax" data-speed="0.5" data-fade="true">
                                <div class="swiper-slide-caption">
                                    <div class="container">
                                        <div class="row justify-content-xl-center">
                                            <div class="col-xl-12">
                                                <div class="text-extra-big font-weight-bold font-italic text-uppercase" data-caption-animate="fadeInUp" data-caption-delay="300">You can go the distance</div>
                                            </div>
                                            <div class="col-xl-8 offset-top-10">
                                                <h5 class="hidden d-sm-block text-light" data-caption-animate="fadeInUp" data-caption-delay="500">Khách hàng của chúng tôi không chỉ nhận được đầy đủ trang thiết bị cần thiết cho buổi tập, mà còn được hỗ trợ tận tình để đạt được mục tiêu hàng đầu trong quá trình luyện tập.</h5>
                                                <div class="offset-top-20 offset-sm-top-50"><a class="btn btn-danger btn-anis-effect" href="#" data-waypoint-to="#welcome" data-caption-animate="fadeInUp" data-caption-delay="800"><span class="btn-text">thuê đồ</span></a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-button swiper-button-prev swiper-parallax mdi mdi-chevron-left"></div>
                    <div class="swiper-button swiper-button-next swiper-parallax mdi mdi-chevron-right"></div>
                    <div class="swiper-pagination"></div>
                </div>
            </header>
    </body>
</html>
