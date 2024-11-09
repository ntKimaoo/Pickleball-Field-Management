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
    <!-- Global Mailform Output-->
    <div class="snackbars" id="form-output-global"></div>
    <!-- Java script-->
    <script src="js/core.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>
