<%-- 
    Document   : home
    Created on : Sep 16, 2024, 12:05:33 PM
    Author     : kiennn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <style>.ie-panel{
                display: none;
                background: #212121;
                padding: 10px 0;
                box-shadow: 3px 3px 5px 0 rgba(0,0,0,.3);
                clear: both;
                text-align:center;
                position: relative;
                z-index: 1;
            }
            html.ie-10 .ie-panel, html.lt-ie-10 .ie-panel {
                display: block;
            }</style>
        <style>

            .container2 {
                display: grid;
                grid-template-columns: repeat(3, 1fr); /* 3 mốc trên mỗi hàng */
                grid-gap: 20px; /* Khoảng cách giữa các mốc */
                width: 80%; /* Đảm bảo container chiếm khoảng 80% chiều rộng màn hình */
                max-width: 1000px; /* Giới hạn chiều rộng tối đa của container */
            }

            .item2 {
                background-color: #16203a;
                border-radius: 8px;
                padding: 20px;
                text-align: center;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                transition: transform 0.3s ease;
                border: 2px solid transparent; /* Mặc định viền trong suốt */
            }

            .item2:hover {
                transform: scale(1.05);
                border-color: yellow; /* Viền màu vàng khi hover */
            }

            .price {
                font-size: 22px;
                font-weight: bold;
                color: #ffffff;
            }

            button {
                background: none;
                border: none;
                color: white;
                font-size: 22px;
                cursor: pointer;
            }

            .pricing-container {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 20px;
                width: 80%; /* Adjust container width as needed */
            }

            .pricing-box {
                background-color: #1B1D26;
                border-radius: 10px;
                padding: 20px;
                flex-grow: 1; /* Ensures each box takes equal space */
                text-align: center;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }

            .pricing-box.featured {
                position: relative;
            }

            .pricing-box.featured::before {
                content: 'GIẢM GIÁ 10%'; /* Change for 6-month membership */
                position: absolute;
                top: 0;
                right: 0;
                background-color: #F5A623;
                padding: 5px 10px;
                border-radius: 0 10px 0 10px;
                font-weight: bold;
            }

            /* Thay đổi CSS cho hộp giá giảm giá 25% */
            .pricing-box.discount-25 {
                position: relative;
            }

            .pricing-box.discount-25::before {
                content: 'GIẢM GIÁ 25%'; /* Thay đổi nội dung thành 25% */
                position: absolute;
                top: 0;
                right: 0;
                background-color: #F5A623;
                padding: 5px 10px;
                border-radius: 0 10px 0 10px;
                font-weight: bold;
            }
            .pricing-box.discount-10 {
                position: relative;
            }

            .pricing-box.discount-10::before {
                content: 'GIẢM GIÁ 10%'; /* Thay đổi nội dung thành 25% */
                position: absolute;
                top: 0;
                right: 0;
                background-color: #F5A623;
                padding: 5px 10px;
                border-radius: 0 10px 0 10px;
                font-weight: bold;
            }


            .pricing-header {
                margin-bottom: 15px;
            }

            .pricing-header .icon {
                font-size: 40px;
                color: #B5A2FF;
            }

            .pricing-header h3 {
                margin: 10px 0;
                font-size: 20px;
                color: #FFFFFF;
            }

            .pricing-features {
                list-style: none;
                padding: 0;
                margin: 15px 0;
                flex-grow: 1;
            }

            .pricing-features li {
                padding: 8px 0;
                border-bottom: 1px solid #4E4D5D;
            }

            .price {
                font-size: 18px;
                color: #9C8AFF;
                margin: 15px 0;
            }

            .buy-button {
                background-color: #33304F;
                color: white;
                padding: 10px;
                width: 100%;
                border: none;
                border-radius: 5px;
                font-weight: bold;
                cursor: pointer;
            }

            .buy-button:hover {
                background-color: #4E4D5D;
            }
        </style>
    </head>
    <body>
        <!-- IE Panel-->

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
                                            <li><a href="home"><span>Home</span></a></li>
                                            <li><a href="datsan?baseid=1"><span>ĐẶT SÂN</span></a></li>
                                            <li><a href="shop"><span>Shop</span></a></li>
                                            <li><a href="contacts.jsp"><span>Contact Us</span></a></li>

                                            <li><a href="profile"><span>Profile</span></a></li>

                                            <li><a href="logout"><span>Log out</span></a></li>
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
                                            <div class="container2" style="margin-top: 150px ">
                                                <div class="pricing-box">
                                                    <div class="pricing-header">
                                                        <div class="icon">👤</div>
                                                        <h3>HỘI VIÊN 1 THÁNG</h3>
                                                    </div>
                                                    <ul class="pricing-features">
                                                        <li>Được quyền đổi thưởng </li>
                                                        <li>Đặc quyền đặt sân VIP</li>
                                                        <li>Hỗ trợ tìm đối</li>
                                                        
                                                    </ul>
                                                    <div class="price">99,000 cho 1 tháng</div>
                                                    <form action="vnpayajax" id="frmCreateOrder" method="post">
                                                        <input type="hidden" name="amount" value="99000">
                                                        <button type="submit" class="price">Mua</button>
                                                    </form>
                                                </div>
                                                <div class="pricing-box discount-10">
                                                    <div class="pricing-header">
                                                        <div class="icon">⭐</div>
                                                        <h3>HỘI VIÊN 6 THÁNG</h3>
                                                    </div>
                                                    <ul class="pricing-features">
                                                        <li>Được quyền đổi thưởng </li>
                                                        <li>Đặc quyền đặt sân VIP</li>
                                                        <li>Hỗ trợ tìm đối</li>
                                                      
                                                        
                                                    </ul>
                                                    <div class="price">540,000 cho 6 tháng</div>
                                                    <form action="vnpayajax" id="frmCreateOrder" method="post">
                                                        <input type="hidden" name="amount" value="540000">
                                                        <button type="submit" class="price">Mua</button>
                                                    </form>
                                                </div>
                                                <div class="pricing-box discount-25">
                                                    <div class="pricing-header">
                                                        <div class="icon">💖</div>
                                                        <h3>HỘI VIÊN 12 THÁNG</h3>
                                                    </div>
                                                    <ul class="pricing-features">
                                                        <li>Được quyền đổi thưởng </li>
                                                        <li>Đặc quyền đặt sân VIP</li>
                                                        <li>Hỗ trợ tìm đối</li>
                                                        
                                                    </ul>
                                                    <div class="price">900,000 cho 12 tháng</div>
                                                    <form action="vnpayajax" id="frmCreateOrder" method="post">
                                                        <input type="hidden" name="amount" value="900000">
                                                        <button type="submit" class="price">Mua</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>

                    <div class="swiper-pagination"></div>
                </div>
            </header>
            <!--Welcome-->

            <!-- Offers-->

            <!-- Page Footer-->
            <footer class="section-relative section-top-66 section-bottom-34 page-footer bg-gray-base context-dark novi-background" data-preset='{"title":"Footer","category":"footer","reload":true,"id":"footer"}'>
                <div class="container">
                    <div class="row justify-content-md-center text-xl-left">
                        <div class="col-md-12">
                            <div class="row justify-content-sm-center">
                                <div class="col-sm-10 col-md-3 text-left order-md-4 col-md-10 col-xl-3 offset-md-top-50 offset-xl-top-0 order-xl-2">
                                    <!-- Twitter Feed-->
                                    <p class="text-uppercase text-spacing-60 font-weight-bold text-center text-xl-left">Twitter Feed</p>
                                    <div class="offset-top-20">
                                        <div class="twitter" data-twitter-username="templatemonster" data-twitter-date-hours=" hours ago" data-twitter-date-minutes=" minutes ago">
                                            <div class="twitter-sm" data-twitter-type="tweet">
                                                <div class="twitter-date text-dark small"><span class="icon icon-xxs mdi mdi-twitter text-middle"></span> <span class="text-middle" data-date="text"></span>
                                                </div>
                                                <div class="twitter-text" data-tweet="text"></div>
                                                <div class="twitter-name font-weight-bold big" data-screen_name="text"></div>
                                            </div>
                                            <div class="twitter-sm" data-twitter-type="tweet">
                                                <div class="twitter-date text-dark small"><span class="icon icon-xxs mdi mdi-twitter text-middle"></span> <span class="text-middle" data-date="text"></span>
                                                </div>
                                                <div class="twitter-text" data-tweet="text"></div>
                                                <div class="twitter-name font-weight-bold big" data-screen_name="text"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-10 col-md-3 offset-top-66 order-md-3 col-md-10 col-xl-2 offset-xl-top-0 order-xl-3">
                                    <!-- Flickr Feed-->
                                    <p class="text-uppercase text-spacing-60 font-weight-bold">Gallery</p>
                                    <div class="offset-top-24">
                                        <div class="group-xs flickr widget-flickrfeed" data-lightgallery="group" data-flickr-tags="tm58888_landscapes"><a class="flickr-item thumbnail-classic" data-lightgallery="item" href="" data-image_c="href" data-size="800x800" data-type="flickr-item"><img width="82" height="82" data-title="alt" src="images/_blank.png" alt="" data-image_q="src"></a><a class="flickr-item thumbnail-classic" data-lightgallery="item" href="" data-image_c="href" data-size="800x800" data-type="flickr-item"><img width="82" height="82" data-title="alt" src="images/_blank.png" alt="" data-image_q="src"></a><a class="flickr-item thumbnail-classic" data-lightgallery="item" href="" data-image_c="href" data-size="800x800" data-type="flickr-item"><img width="82" height="82" data-title="alt" src="images/_blank.png" alt="" data-image_q="src"></a><a class="flickr-item thumbnail-classic" data-lightgallery="item" href="" data-image_c="href" data-size="800x800" data-type="flickr-item"><img width="82" height="82" data-title="alt" src="images/_blank.png" alt="" data-image_q="src"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-10 col-md-3 offset-top-66 order-md-2 offset-md-top-0 col-md-6 col-xl-4 order-xl-4">
                                    <div class="inset-xl-left-20">
                                        <p class="text-uppercase text-spacing-60 font-weight-bold">Contact</p>
                                        <p class="offset-top-20 text-left">
                                            Mọi thắc mắc vui lòng điền gửi email để phản hồi sớm nhất.
                                        </p>
                                        <div class="offset-top-30">
                                            <form class="rd-mailform" data-form-output="form-subscribe-footer" data-form-type="subscribe" method="post" action="bat/rd-mailform.php">
                                                <div class="form-group">
                                                    <div class="input-group input-group-sm"><span class="input-group-prepend"><span class="input-group-text input-group-icon"><span class="mdi mdi-email novi-icon"></span></span></span>
                                                        <input class="form-control" placeholder="Type your E-Mail" type="email" name="email" data-constraints="@Required @Email"><span class="input-group-append">
                                                            <button class="btn btn-sm btn-danger" type="submit">Subscribe</button></span>
                                                    </div>
                                                </div>
                                                <div class="form-output" id="form-subscribe-footer"></div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-10 col-md-3 offset-top-66 order-md-1 offset-md-top-0 col-md-6 col-xl-3 order-xl-1">
                                    <!-- Footer brand-->
                                    <div class="footer-brand"><a href="index.html"><img width='173' height='30' src='images/logo.png' alt=''/></a></div>
                                    <div class="offset-top-50 text-sm-center text-xl-left">
                                        <ul class="list-inline">
                                            <li class="list-inline-item"><a class="novi-icon icon fa fa-facebook icon-xxs icon-circle icon-darkest-filled" href="#"></a></li>
                                            <li class="list-inline-item"><a class="novi-icon icon fa fa-instagram icon-xxs icon-circle icon-darkest-filled" href="#"></a></li>
                                            <li class="list-inline-item"><a class="novi-icon icon fa fa-google-plus icon-xxs icon-circle icon-darkest-filled" href="#"></a></li>
                                        </ul>
                                    </div>
                                    <p class="text-darker offset-top-20">Hola Pickleball &copy; <span id="copyright-year"></span> .
                                        Design&nbsp;by&nbsp;<a href="https://www.templatemonster.com">KenHol</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
        <!-- Global Mailform Output-->
        <div class="snackbars" id="form-output-global"></div>
        <!-- Java script-->
        <script src="js/core.min.js"></script>
        <script src="js/script.js"></script>
    </body>
    <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
    <script>
        // Optional: You can handle the form submission via AJAX here if needed
        $("form").submit(function (event) {
            event.preventDefault(); // Prevent the default form submission
            var postData = $(this).serialize();
            var submitUrl = $(this).attr("action");

            $.ajax({
                type: "POST",
                url: submitUrl,
                data: postData,
                dataType: 'JSON',
                success: function (response) {
                    if (response.code === '00') {
                        if (window.vnpay) {
                            vnpay.open({width: 768, height: 600, url: response.data});
                        } else {
                            location.href = response.data;
                        }
                    } else {
                        alert(response.Message);
                    }
                }
            });
        });
    </script>
</html>
