<%-- 
    Document   : news
    Created on : Oct 28, 2024, 7:56:44 AM
    Author     : kiennn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                height: 500px;
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
                height: 300px;
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
        <jsp:include page="header.jsp"></jsp:include>
            <div id="body-3" style="padding-bottom: 110px">
                <h1 style="text-align: center; margin-bottom: 30px;margin-top: 50px">Tin tức</h1>
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
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
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
</html>
