<%-- 
    Document   : newspaper
    Created on : Oct 28, 2024, 8:27:25 AM
    Author     : kiennn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.News" %>
<%@page import="dal.NewsDAO" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        *{
            text-align: left;
        }
        .news-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .news-item {
            position: relative;
            width: calc(25% - 80px);
            height: 375px;
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
            padding: 10px;
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
            padding: 80px;
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
    <body>
        <%@ include file="header.jsp" %>
        <div class="box" >
            <div style="display: ${empty param.id ? '' : 'none'};margin: 130px 0">
                <h1 style="margin-bottom: 20px; text-align: center;">Tin tức</h1>
                <div class="news-container">
                    <% 
                        List<News> allNews = (List<News>) request.getAttribute("allNews");
                        if (allNews != null) {
                            for (int i = allNews.size() - 1; i >= 0; i--) {
                                News n = allNews.get(i);
                    %>
                    <div class="news-item" onclick="viewNews('<%= n.getId() %>');">
                        <img src="<%= n.getImage() %>" alt="<%= n.getTitle() %>">
                        <h2><%= n.getTitle() %></h2>
                        <div class="news-content" style="display: none;">
                            <p><%= n.getContent() %></p>
                        </div>
                        <div class="news-time">
                            <p><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="<%=n.getCreated_at()%>"/></p>
                        </div>
                    </div>
                    <% 
                            }
                        }
                    %>
                </div>
            </div>
            <div id="selected" style="display: ${empty param.id ? 'none' : ''}" class="row">
                <div class="col-md-2"></div>
                <div class="col-md-6" style="margin: 130px 0">
                    <% 
                    NewsDAO nd = new NewsDAO();
                    String newsIdStr = request.getParameter("id");
                    if (newsIdStr != null) {
                        try {
                            int newsId = Integer.parseInt(newsIdStr);
                            News selectedNews = nd.getNewsById(newsId); 
                            if (selectedNews != null) {
                    %>
                    <div class="selected-news">
                        <h1><%= selectedNews.getTitle() %></h1>
                        <p><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="<%=selectedNews.getCreated_at()%>"/></p>
                        <img src="<%= selectedNews.getImage() %>" alt="<%= selectedNews.getTitle() %>">
                        <p><%= selectedNews.getContent() %></p>

                    </div>
                    <% 
                        }
                            } catch (NumberFormatException e) {
                                e.printStackTrace();
                            }
                        }
                    %>
                </div>
                <div class="col-md-4" style="margin: 130px 0">
                    <div class="news-list">
                        <% 
                            if (allNews != null) {
                                for (int i = allNews.size() - 1; i >= 0; i--) {
                                    News n = allNews.get(i);
                        %>
                        <div class="news-item-small" onclick="viewNews('<%= n.getId() %>');">
                            <img src="<%= n.getImage() %>" alt="<%= n.getTitle() %>">
                            <h2><%= n.getTitle() %></h2>

                        </div>
                        <% 
                                }
                            }
                        %>
                    </div>
                </div>

            </div>
        </div>
        <%@ include file="footer.jsp" %>
        <script>
            function viewNews(newsId) {
                window.location.href = 'news?id=' + newsId;
            }
        </script>
    </body>
</html>
