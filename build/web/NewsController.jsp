<%-- 
    Document   : dashboard
    Created on : Sep 28, 2024, 9:56:26 PM
    Author     : kiennn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="Model.News" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <style>
            :root {
                --tripoveMainColor: rgb(71, 143, 192);
            }

            table.entity {
                border-collapse: collapse;
                border: 1px solid #ddd;
                font-family: Arial, sans-serif;
            }

            table.entity thead {
                background-color: #f2f2f2;
            }

            table.entity th,
            table.entity td {
                border: 1px solid #ddd;
                padding: 6px;
                text-align: center;
                padding-top: 10px;
                padding-bottom: 10px;
                word-wrap: break-word;
                font-size: 14px;
            }

            table.entity th {
                background-color: var(--tripoveMainColor);
                color: white;
            }

            table.entity td img {
                height: 80px;
                width: 80px;
                object-fit: cover;
            }

            table.entity td a {
                text-decoration: none;
                margin-right: 10px;
            }

            table.entity td a:hover {
                text-decoration: underline;
            }
            #left-column{
                text-align: center;
            }
            #left-column table{
                display: inline-block;
                margin: 0 auto;
            }
            #right-column{
                font-size: 14px;
            }

            #right-column form{
                width: 900px;
                margin: auto;
            }

            .entity-update {
                padding: 8px;
                border-radius: 6px;
                border-color: white;
                color: white;
                background-color: #04aa6d;
                cursor: pointer
            }

            .entity-delete {
                padding: 8px;
                border-radius: 6px;
                border-color: white;
                color: white;
                background-color: #f44336;
                cursor: pointer
            }

            .entity-detail {
                padding: 8px;
                border-radius: 6px;
                border-color: white;
                color: white;
                background-color: #f7d017;
                cursor: pointer
            }

            .filterController{
                font-size: 14px;
                float:left
            }

            .filterController button{
                padding: 6px;
            }

            .filterElm{
                margin-right: 15px;
                padding: 0 3px
            }

            .box {
                margin: 100px auto;
                box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.1), 0 0 1px 0 rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                padding: 35px !important;
                font-size: 16px;
                width: max-content;
            }

        </style>
        <link rel="stylesheet" href="css/style_dashboard.css">
        <script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
        <script src="https://cdn.cksource.com/ckfinder/3.5.2/ckfinder.js"></script>
        <title>ADMIN DASHBOARD</title>
    </head>
    <body>
        <%@include file="sidebardashboard.jsp" %>
        <!-- CONTENT -->
        <section id="content">
            <%@include file="headerdashboard.jsp" %>
            <!-- MAIN -->
            <div id="main-content">
                <div class="row" style="padding: 50px 0; margin: 0">

                    <div class="col-md-6" id="left-column">
                        <table class="entity">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Image</th>
                                    <th>Created at</th>
                                    <th>Updated at</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${allNews}" var="n">
                                    <tr>                                    
                                        <td>${n.getTitle()}</td>
                                        <td><img src="${n.getImage()}" alt="alt"/></td>

                                        <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${n.getCreated_at()}"/></td>
                                <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${n.getUpdated_at()}"/></td>
                                <td>
                                    <a style="text-decoration: none" class="entity-update" href="managenews?action=update&id=${n.getId()}">Update</a>
                                    <a style="text-decoration: none" class="entity-delete" href="managenews?action=delete&id=${n.getId()}" onclick="doDelete('${n.getId()}')">Delete</a>
                                </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-6" id="right-column">

                        <form action="managenews" method="post">
                            <input type="hidden" value="${param.id}" name="id"/>
                            <div>
                                <strong>Title:</strong>
                                <input style="width: 100%;padding: 5px" type="text" value="${requestScope.currentNews.title}" name="title"/>
                            </div>
                            <div>
                                <strong>Image:</strong>
                                <input type="file" value="" name="image"/>
                            </div>
                            <div id="content-update">
                                <strong>Content:</strong>
                                <textarea id="editor" name="editor">${requestScope.currentNews.content}</textarea>
                            </div>
                            <input type="hidden" name="created_at" value="${requestScope.currentNews.created_at}"/>
                            <input
                                type="submit"
                                class="entity-update"
                                value="Cập nhật/Thêm mới"
                                />
                            <a class="entity-delete" href="managenews">Huỷ</a>
                        </form>
                    </div>
                </div>
            </div>


            <!-- MAIN -->
        </section>
        <!-- CONTENT -->

        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Bạn có muốn xoá bài viết này? ")) {
                    window.location = "newsController?action=delete&id=" + id;
                }
            }

            // Initialize CKEditor
            CKEDITOR.replace('editor', {
                filebrowserBrowseUrl: '/ckfinder/ckfinder.html',
                filebrowserUploadUrl: '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
                filebrowserImageUploadUrl: '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
                filebrowserFlashUploadUrl: '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash'
            });

            // Optional: CKFinder standalone
            CKFinder.setupCKEditor(null, {
                basePath: '/ckfinder/',
                connectorPath: '/ckfinder/core/connector/java/connector.java'
            });
        </script>
        <script src="script.js"></script>
    </body>
</html>
