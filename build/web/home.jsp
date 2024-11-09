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
        <style>

            .news-container {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
                justify-content: center;
            }

            .news-item {
                position: relative;
                width: calc(25% - 80px);
                height: 400px;
                margin-bottom: 20px;
                padding: 10px;
                border: 1px solid #e0e0e0;
                border-radius: 10px;
                transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .news-item:hover {
                transform: scale(1.05);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
                cursor: pointer;
            }

            .news-item img {
                width: 100%;
                height: 220px;
                object-fit: cover;
                border-radius: 10px 10px 0 0;
            }

            .news-item h2 {
                margin-top: 10px;
                font-size: 18px;
                font-weight: bold;
                color: #333;
                padding: 9px 25px;
            }

            .news-content {
                background-color: #fff;
                padding: 20px;
                border-radius: 0 0 10px 10px;
                border-top: 1px solid #e0e0e0;
                display: none;
            }

            .news-content p {
                font-size: 14px;
                line-height: 1.6;
                color: #666;
            }

            .news-time {
                position: absolute;
                right: 16px;
                bottom: -5px;
                color: #999;
                font-size: 12px;

            }

            @media (max-width: 1024px) {
                .news-item {
                    width: calc(33.33% - 20px);
                }
            }

            @media (max-width: 768px) {
                .news-item {
                    width: calc(50% - 20px);
                }
            }

            @media (max-width: 480px) {
                .news-item {
                    width: 100%;
                }
            }

            #selected{
                background-color: rgb(252, 250, 246);
            }
            .selected-news {
                background-color: #fff;
                padding: 50px;
            }

            .selected-news h1 {
                font-size: 32px;
                margin-bottom: 15px;
                color: #333;
                line-height: 1.4;
            }

            .selected-news img {
                width: 100%;
                height: auto;
                margin-bottom: 20px;
                display: block;
                border-radius: 4px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .selected-news p {
                line-height: 1.8;
                color: #333;
                font-size: 18px;
                margin-bottom: 15px;
            }

            .selected-news .news-time {
                font-size: 14px;
                color: #888;
                margin-bottom: 10px;
            }

            .selected-news a {
                color: #007bff;
                text-decoration: none;
            }

            .selected-news a:hover {
                text-decoration: underline;
            }

            .news-item-small {
                display: flex;
                align-items: center;
                margin-bottom: 15px;
                border: 1px solid #e0e0e0;
                padding: 10px;
                cursor: pointer;
                transition: transform 0.2s ease-in-out;
                width: 330px;
                background-color: #fff
            }

            .news-item-small:hover {
                transform: scale(1.05);
            }

            .news-item-small img {
                height: 80px;
                width: 100px;
                margin-right: 10px;
                border-radius: 4px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                object-fit: cover;
            }

            .news-item-small h2 {
                font-size: 16px;
                margin-top: 0;
                margin-bottom: 5px;
                flex: 1;
            }

            .news-item-small .news-time {
                font-size: 14px;
                color: #888;
            }



        </style>
    </head>
    <body>
        <div class="page text-center">
            <!-- Page Head-->
            <jsp:include page="header.jsp"></jsp:include>
                <!--Welcome-->
                <section class="section-98 section-md-110 novi-background" data-preset='{"title":"Content block 1","category":"content","id":"content-block-1"}'>
                    <div class="container">
                        <h1>Welcome</h1>
                        <hr class="divider bg-red">
                        <div class="row justify-content-center grid-group-lg offset-top-98">
                            <div class="col-md-8 col-lg-4">
                                <!-- Icon Box Type 5-->
                                <div class="box-icon box-icon-bordered"><span class="novi-icon icon icon-outlined icon-sm icon-dark-filled mdi mdi-account-multiple"></span>
                                    <h4 class="text-danger offset-top-20">Tìm kiếm vị trí sân</h4>
                                    <p>Liên tục update, cập nhật nhanh nhất cho khách hàng.</p>
                                </div>
                            </div>
                            <div class="col-md-8 col-lg-4">
                                <!-- Icon Box Type 5-->
                                <div class="box-icon box-icon-bordered"><span class="novi-icon icon icon-outlined icon-xs icon-dark-filled mdi mdi-thumb-up"></span>
                                    <h4 class="text-danger offset-top-20">Đặt lịch online</h4>
                                    <p>Không cần đến trực tiếp sân, không cần qua zalo, mess,...</p>
                                </div>
                            </div>
                            <div class="col-md-8 col-lg-4">
                                <!-- Icon Box Type 5-->
                                <div class="box-icon box-icon-bordered"><span class="novi-icon icon icon-outlined icon-sm icon-dark-filled mdi mdi-dumbbell"></span>
                                    <h4 class="text-danger offset-top-20">Thi đấu có thưởng</h4>
                                    <p>Tìm kiếm, giao lưu có thưởng</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Offers-->
                <section data-preset='{"title":"Carousel 1","category":"content, carousel","reload":true,"id":"carousel-1"}'>
                    <div class="owl-carousel owl-carousel-default d-lg-none-owl-dots veil-owl-nav d-lg-owl-nav" data-items="1" data-sm-items="2" data-lg-items="3" data-xl-items="4" data-nav="true" data-dots="true" data-nav-class="[&quot;owl-prev mdi mdi-chevron-left&quot;, &quot;owl-next mdi mdi-chevron-right&quot;]">
                        <div>
                            <!-- Thumbnail Terry-->
                            <figure class="thumbnail-terry"><a href="#"><img width="480" height="480" src="images/c6.jpg" alt=""/></a>
                                <figcaption>
                                    <div>
                                        <h4 class="thumbnail-terry-title">Thuê sân</h4>
                                    </div>
                                    <p class="thumbnail-terry-desc offset-top-0"></p><a class="btn offset-top-10 offset-lg-top-0 btn-danger" href="#">free first lesson</a>
                                </figcaption>
                            </figure>
                        </div>
                        <div>
                            <!-- Thumbnail Terry-->
                            <figure class="thumbnail-terry"><a href="#"><img width="480" height="480" src="images/c5.jpg" alt=""/></a>
                                <figcaption>
                                    <div>
                                        <h4 class="thumbnail-terry-title">Thuê đồ tập</h4>
                                    </div>
                                    <p class="thumbnail-terry-desc offset-top-0"></p><a class="btn offset-top-10 offset-lg-top-0 btn-danger" href="#">free first lesson</a>
                                </figcaption>
                            </figure>
                        </div>
                        <div>
                            <!-- Thumbnail Terry-->
                            <figure class="thumbnail-terry"><a href="FindOpponent.jsp"><img width="480" height="480" src="images/c4.jpg" alt=""/></a>
                                <figcaption>
                                    <div>
                                        <h4 class="thumbnail-terry-title">Tìm đối 1vs1</h4>
                                    </div>
                                    <p class="thumbnail-terry-desc offset-top-0"></p><a class="btn offset-top-10 offset-lg-top-0 btn-danger" href="FindOpponent_1vs1.jsp">Tìm</a>
                                </figcaption>
                            </figure>
                        </div>
                        <div>
                            <!-- Thumbnail Terry-->
                            <figure class="thumbnail-terry"><a href="#"><img width="480" height="480" src="images/c2.jpg" alt=""/></a>
                                <figcaption>
                                    <div>
                                        <h4 class="thumbnail-terry-title">Trở thành vip member</h4>
                                    </div>
                                    <p class="thumbnail-terry-desc offset-top-0"></p><a class="btn offset-top-10 offset-lg-top-0 btn-danger" href="#">free first lesson</a>
                                </figcaption>
                            </figure>
                        </div>
                        <div>
                            <!-- Thumbnail Terry-->
                            <figure class="thumbnail-terry"><a href="#"><img width="480" height="480" src="images/c1.jpg" alt=""/></a>
                                <figcaption>
                                    <div>
                                        <h4 class="thumbnail-terry-title">Feedback</h4>
                                    </div>
                                    <p class="thumbnail-terry-desc offset-top-0"></p><a class="btn offset-top-10 offset-lg-top-0 btn-danger" href="#">free first lesson</a>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                </section>

                <section class="section-98 section-md-110 novi-background" data-preset='{"title":"Team","category":"content, team","reload":false,"id":"team"}'>
                    <div class="container">
                        <div id="body-3">
                            <h1 style="text-align: center; margin-bottom: 30px">Tin tức</h1>
                            <div class="news-container">
                            <c:forEach items="${newspapers}" var="n">
                                <div class="news-item" onclick="viewNews('${n.getId()}');">
                                    <img src="${n.getImage()}" alt="${n.getTitle()}">
                                    <h2>${n.getTitle()}</h2>
                                    <div class="news-time" style="margin-bottom: 20px">
                                        <p><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${n.getCreated_at()}"/></p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div><a class="offset-top-66 btn btn-danger" href="news">xem thêm</a>
                    </div>
                </div>
        </div>
    </section>
    <!-- Page Footer-->
            <jsp:include page="footer.jsp"></jsp:include>
    <!-- Global Mailform Output-->
    <div class="snackbars" id="form-output-global"></div>
    <!-- Java script-->
    <script src="js/core.min.js"></script>
    <script>
                                    AOS.init();

                                    window.addEventListener("load", () => {
                                        const loader = document.querySelector(".loader");
                                        loader.classList.add("loader-hidden");
                                        loader.addEventListener("transitionend", () => {
                                            document.body.removeChild(loader);
                                        });
                                    });


                                    const priceRange = document.getElementById('priceRange');
                                    const priceValue = document.getElementById('priceValue');

                                    function updatePrice() {
                                        priceValue.textContent = Number(priceRange.value).toLocaleString('vi-VN') + "đ";
                                    }
                                    priceRange.addEventListener('input', updatePrice);

                                    function viewNews(newsId) {
                                        window.location.href = 'news?id=' + newsId;
                                    }
    </script>
    <script src="js/script.js"></script>
</body>
</html>
