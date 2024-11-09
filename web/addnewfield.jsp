<%-- 
    Document   : dashboard
    Created on : Sep 28, 2024, 9:56:26 PM
    Author     : kiennn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="css/style_dashboard.css">
        <style>
            /* style.css */
            * {
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }



            .profile-container {
                background-color: #ffffff;
                border-radius: 5px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                width: 700px;
                margin-left: 200px;
                margin-top: 50px;
            }

            .header h2 {
                margin: 0;
                font-weight: normal;
                text-align: center;
                margin-bottom: 20px;
            }

            form .form-row {
                display: flex;
                justify-content: space-between;
                gap: 10px;
                margin-bottom: 15px;
            }

            form .form-group {
                display: flex;
                flex-direction: column;
                flex: 1;
            }

            form .form-group label {
                margin-bottom: 5px;
            }

            form .form-group input[type="text"],
            form .form-group input[type="password"],
            form .form-group input[type="email"],
            form .form-group input[type="tel"],
            form .form-group select {
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: 100%;
            }

            .submit-btn {
                text-align: center;
                margin-top: 15px;
            }

            .submit-btn button {
                padding: 10px 20px;
                background-color: #007bff;
                color: #ffffff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .submit-btn button:hover {
                background-color: #0056b3;
            }
        </style>
        <title>ADMIN DASHBOARD</title>
    </head>
    <body>



         <%@include file="sidebardashboard.jsp" %>
        <!-- CONTENT -->
        <section id="content">
            <!-- NAVBAR -->
            <%@include file="headerdashboard.jsp" %>

            <!-- MAIN -->
            <main>

                <div class="profile-container">
                    <div class="header" style="display: flex; justify-content: space-between">
                        <h2>Add New Field</h2>
                        <a href="fieldmanagement" style="">Back</a>
                    </div>
                    <form action="addnewfield" method="post">
                        <div class="form-row">
                            <div class="form-group">
                                <label for="username">Base</label>
                                <select id="statusSelect" name="base">
                                    <option value="">All</option>
                                    <c:if test="${listbase!=null}"><c:forEach var="s" items="${listbase}">
                                        <option value="${s.getId()}" <c:if test="${s.getId() == base}">selected</c:if>>
                                            ${s.getAddress()}</option>
                                        </c:forEach></c:if>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="password">Cost</label>
                                <input type="text" name="cost" placeholder="" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="address">Image</label>
                                <input type="text"name="image" placeholder="" required>
                            </div>
                        </div>
                        Vip only: <input type="checkbox" name="vip" value="yes">
                        <div class="form-group submit-btn">
                            <button type="submit">Add</button>
                        </div>
                    </form>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->

        <script src="script.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </body>
</html>
