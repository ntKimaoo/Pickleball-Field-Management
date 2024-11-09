<%-- 
    Document   : contacts
    Created on : Oct 28, 2024, 8:06:18 AM
    Author     : kiennn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String currentPage = request.getRequestURI(); %>
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
                                <div class="rd-navbar-brand"><a href="home"><img width='173' height='30' src='images/logo.png' alt=''/></a></div>
                            </div>
                            <div class="rd-navbar-menu-wrap">
                                <div class="rd-navbar-nav-wrap">
                                    <div class="rd-navbar-mobile-scroll">
                                        <!--Navbar Brand Mobile-->
                                        <div class="rd-navbar-mobile-brand"><a href="index.html"><img width='173' height='30' src='images/logo.png' alt=''/></a></div>
                                        <!-- RD Navbar Nav-->
                                        <ul class="rd-navbar-nav">
                                            <li class="<%= currentPage.equals("/SWP391_PickleballFieldManagement/home.jsp") ? "active" : "" %>"><a href="home"><span>Home</span></a></li>
                                            <li class="<%= currentPage.equals("/SWP391_PickleballFieldManagement/datsan.jsp") ? "active" : "" %>"><a href="about-coach.html"><span>ĐẶT SÂN</span></a></li>
                                            <li class="<%= currentPage.equals("/SWP391_PickleballFieldManagement/news.jsp") ? "active" : "" %>"><a href="news"><span>Tin tức</span></a></li>
                                            <li class="<%= currentPage.equals("/SWP391_PickleballFieldManagement/contacts.jsp") ? "active" : "" %>"><a href="contacts.jsp"><span>Contact Us</span></a></li>
                                                <c:if test="${sessionScope.user==null}">
                                                <li><a href="Login.jsp"><span>Login</span></a></li></c:if>
                                                <c:if test="${sessionScope.user!=null}">
                                                <li><a href="profile"><span>Profile</span></a></li></c:if>
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
                        <div class="swiper-slide" data-slide-bg="images/banner04.jpg" data-preview-bg="images/background-02-1920x750.jpg">
                            
                        </div>
                    </div>
                </div>
            </header>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
