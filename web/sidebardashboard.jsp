<%-- 
    Document   : sidebar
    Created on : Oct 30, 2024, 10:31:28 AM
    Author     : kiennn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String currentPage = request.getRequestURI(); %>
        <section id="sidebar">
            <a class="brand">
                <img src="images/logoblue.png" alt="alt"/>
            </a>
            <ul class="side-menu top">
                <li class="<%= currentPage.equals("/SWP391PickleballField/Chart.jsp") ? "active" : "" %>">
                    <a href="dashboard">
                        <i class='bx bxs-doughnut-chart' ></i>
                        <span class="text">Dashboard</span>
                    </a>
                </li>
                <li class="<%= currentPage.equals("/SWP391PickleballField/OrderManager.jsp") ? "active" : "" %>">
                    <a href="ordermanager">
                        <i class='bx bxs-dashboard' ></i>
                        <span class="text">Order List</span>
                    </a>
                </li>
                <li class="<%= currentPage.equals("/SWP391PickleballField/UserManagement.jsp") ? "active" : "" %>">
                    <a href="usermanagement">
                        <i class='bx bxs-user' ></i>
                        <span class="text">Quản lí người dùng</span>
                    </a>
                </li>
                <li class="<%= currentPage.equals("/SWP391PickleballField/EmployeeManagement.jsp") ? "active" : "" %>">
                    <a href="employeemanagement">
                        <i class='bx bx-body' ></i>
                        <span class="text">Quản lí nhân viên</span>
                    </a>
                </li>
                <li class="<%= currentPage.equals("/SWP391PickleballField/ItemManager.jsp") ? "active" : "" %>">
                    <a href="itemmanager">
                        <i class='bx bxs-box' ></i>
                        <span class="text">Quản lí sản phẩm</span>
                    </a>
                </li>
                <li class="<%= currentPage.equals("/SWP391PickleballField/CategoryManager.jsp") ? "active" : "" %>">
                    <a href="categorymanager">
                        <i class='bx bx-list-ol' ></i>
                        <span class="text">Quản lí danh mục</span>
                    </a>
                </li>
                <li class="<%= currentPage.equals("/SWP391PickleballField/VoucherManagement.jsp") ? "active" : "" %>">
                    <a href="vouchermanager">
                        <i class='bx bxs-discount' ></i>
                        <span class="text">Quản lí Voucher</span>
                    </a>
                </li>
                <li class="<%= currentPage.equals("/SWP391PickleballField/FieldManagement.jsp") ? "active" : "" %>">
                    <a href="fieldmanagement">
                        <i class='bx bxs-grid-alt' ></i>
                        <span class="text">Quản lí sân</span>
                    </a>
                </li>
                <li class="<%= currentPage.equals("/SWP391PickleballField/BaseManagement.jsp") ? "active" : "" %>">
                    <a href="basemanagement">
                        <i class='bx bx-folder' ></i>
                        <span class="text">Quản lí cơ sở</span>
                    </a>
                </li>
                <li>
                    <a href="ShowRank">
                        <i class='bx bx-card' ></i>
                        <span class="text">Quản lí xếp hạng</span>
                    </a>
                </li>
                <li>
                    <a href="managepvp">
                        <i class='bx bxs-group' ></i>
                        <span class="text">Quản lí thi đấu</span>
                    </a>
                </li>
                <li class="<%= currentPage.equals("/SWP391PickleballField/MangeProduct.jsp") ? "active" : "" %>">
                    <a href="manageproduct">
                        <i class='bx bx-coffee' ></i>
                        <span class="text">Quản lí sản phẩm đổi thưởng</span>
                    </a>
                </li>
                <li class="<%= currentPage.equals("/SWP391PickleballField/ListOrderAdmin.jsp") ? "active" : "" %>">
                    <a href="order-list">
                        <i class='bx bx-money' ></i>
                        <span class="text">Quản lí đổi thưởng</span>
                    </a>
                </li>
                <li class="<%= currentPage.equals("/SWP391PickleballField/NewsController.jsp") ? "active" : "" %>">
                    <a href="managenews">
                        <i class='bx bxs-news' ></i>
                        <span class="text">Báo mới</span>
                    </a>
                </li>

            </ul>
            <ul class="side-menu">
                <li>
                    <a href="#">
                        <i class='bx bxs-cog' ></i>
                        <span class="text">Settings</span>
                    </a>
                </li>
                <li>
                    <a href="logout" class="logout">
                        <i class='bx bxs-log-out-circle' ></i>
                        <span class="text">Logout</span>
                    </a>
                </li>
            </ul>
        </section>
    </body>
    <script src="script.js"></script>
</html>
