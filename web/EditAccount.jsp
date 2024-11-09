
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
        <style>
            /* style.css */
            

            .profile-container {
                background-color: #ffffff;
                border-radius: 5px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                width: 800px;
                margin-left: 150px;
            }

            .header {
                display: flex;
                align-items: center;
                gap: 15px;
                margin-bottom: 20px;
            }

            .header h2 {
                margin: 0;
                font-weight: normal;
            }

            .profile-picture {
                border-radius: 50%;
                width: 80px;
                height: 80px;
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
            form .form-group input[type="date"],
            form .form-group input[type="email"],
            form .form-group input[type="tel"],
            form .form-group select {
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: 100%;
            }

            form .form-group input[type="radio"] {
                margin: 0 5px 0 0;
            }

            form .form-group button {
                padding: 5px 10px;
                margin-right: 5px;
                color: white;
                border: none;
                border-radius: 4px;
                background-color: #60ABEC;
                cursor: pointer;
            }

            form .form-group button:hover {
                background-color: #ddd;
            }

            .submit-btn {
                text-align: center;
                margin-top: 15px;
            }

            .submit-btn button {
                padding: 10px 20px;
                color: #ffffff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .submit-btn button:hover {
                background-color: #0056b3;
            }
            .sex-group {
                display: flex;
                flex-direction: column;
            }

            .radio-group {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .radio-group label {
                margin: 0 5px;
            }


        </style>
        <!-- My CSS -->
        <link rel="stylesheet" href="css/style_dashboard.css">
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
                    <div class="header">
                        <h2>Profile</h2>
                        <a href="usermanagement" style="margin-left: 600px">Back</a>
                    </div>
                    <form method="post">
                        <c:set var="u" value="${user}" scope="request" />
                        <div class="form-row">
                            <div class="form-group">
                                <label for="id">Id</label>
                                <input type="text" id="id" name="id" value="${u.id}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" id="username" name="username" value="${u.username}" readonly="">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="fullname">Fullname</label>
                                <input type="text" id="fullname" name="fullname" value="${u.getFullName()}">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" id="password" name="password" value="********">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group sex-group">
                                <label>Gender</label>
                                <div class="radio-group">
                                    <input type="radio" id="male" name="sex" value="Male">
                                    <label for="male">Male</label>
                                    <input type="radio" id="female" name="sex" value="Female" checked>
                                    <label for="female">Female</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" name="email" value="${u.getEmail()}" readonly="">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="dob">Dob</label>
                                <input type="date" id="dob" name="dob" value="2004-06-03">
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone</label>
                                <input type="tel" id="phone" name="phone" value="${u.getPhone()}">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="address">Address</label>
                                <input type="text" id="address" name="address" value="${u.getAddress()}">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Status</label>
                                <c:if test="${u.isActived==true}">
                                    <input type="text" readonly="" value="Active">
                                    <button type="submit" formaction="deactiveacc">Deactivate</button>
                                </c:if>
                                <c:if test="${u.isActived==false}">
                                    <input type="text" readonly="" value="Inactive">
                                    <button type="submit" formaction="activeacc">Active</button>
                                </c:if>
                                
                            </div>
                            <div class="form-group">
                                <label for="role">Role</label>
                                <select id="role" name="role">
                                    <option value="customer" <c:if test="${u.role=='customer'}">selected</c:if>>Customer</option>
                                    <option value="admin" <c:if test="${u.role=='admin'}">selected</c:if>>Admin</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group submit-btn">
                            <button type="submit" formaction="submitEdit">Submit</button>
                        </div>
                    </form>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->
        <script src="script.js"></script>
    </body>
</html>


