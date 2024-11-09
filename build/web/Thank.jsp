<%-- 
    Document   : Thank
    Created on : Nov 4, 2024, 11:51:29 AM
    Author     : Admin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Fruitables - Vegetable Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

    </head>

    <body>   
        <div class="page text-center">
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
                                        <li class="active"><a href="about-coach.html"><span>ĐẶT SÂN</span></a></li>
                                        <li class="active"><a href="typography.html"><span>Typography</span></a></li>
                                        <li class="active"><a href="contacts.html"><span>Contact Us</span></a></li>
                                        <li class="active"><a href="profile"><span>Profile</span></a></li>

                                        <li class="active"><a href="logout"><span>Log out</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
            <!-- Page-->
            <div class="container-fluid py-5">
                <div class="container-fluid py-5 alert alert-success text-center mt-5" role="alert" >
                    <h3>List Products</h3>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Image</th>
                                <th scope="col">Name</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Total Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${carts}" var="C">
                                <tr>
                            <input type="hidden" name="itemId" value="${C.value.item.id}"/>
                            <th scope="row">${C.value.item.id}</th>
                            <td>${C.value.item.name}</td>
                            <td><img src="${C.value.item.image}" width="50"/></td>
                            <td>${C.value.item.cost}</td>
                            <td>${C.value.quantity}</td>
                            <td><fmt:formatNumber value="${C.value.item.cost*C.value.quantity}"/>K vnd</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <h3>Total Amount: <fmt:formatNumber value="${totalPrice}"/>K vnd</h3>
                    Order successfully, Thank you very much...
                    <div class="text-center mt-2">
                        <a class="btn btn-outline-primary" href="shop">Continue Shopping</a>
                    </div>
                </div>
            </div>
            <!-- Cart Page End -->            
        </div>

        <!-- Global Mailform Output-->
        <div class="snackbars" id="form-output-global"></div>
        <!-- Java script-->
        <script src="js/core.min.js"></script>
        <script src="js/script.js"></script>
        <%@include file="footer.jsp" %>
    </body>

</html>