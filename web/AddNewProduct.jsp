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
            <%@include file="headerdashboard.jsp" %>

            <!-- MAIN -->
            <main>

                <div class="profile-container">
                    <div class="header" style="display: flex; justify-content: space-between">
                        <h2>Add New User</h2>
                        <a href="usermanagement" style="">Back</a>
                    </div>
                    <form action="add" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" >
                            </div>
                              
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" >
                            </div>

                            
                            <div class="form-group">
                                <label>Membership</label>
                                <select name="membership" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listCC}" var="o">
                                        <option value="${o.id}">${o.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">  
                            
                            <input type="submit" class="btn btn-success" value="Add">
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

