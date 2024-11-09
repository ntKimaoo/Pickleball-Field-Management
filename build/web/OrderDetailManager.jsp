<%-- 
    Document   : OrderDetailManager
    Created on : Nov 2, 2024, 8:59:09 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
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
                <div class="table-data">
                    <div class="order">
                        <table>
                            <thead> 
                                <tr>
                                    <th>OrderDetailId</th>
                                    <th>ItemId</th>
                                    <th>ItemName</th>
                                    <th>ItemImage</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${orderlist ne null}">
                                    <c:forEach var="l" items="${itemlist}">
                                        <c:forEach var="o" items="${orderlist}">
                                            <c:if test="${l.getId()==o.getItem_id()}">
                                                <tr>
                                                    <td>${o.getId()}</td>
                                                    <td>${o.getItem_id()}</td>
                                                    <td>${l.getName()}</td>
                                                    <td><img src="${l.getImage()}"/> </td>
                                                    <td>${o.getQuantity() }</td>
                                                    <td><fmt:formatNumber value="${o.getPrice() * o.getQuantity()}" type="number" />K vnd</td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>
                    </div>                   
                </div>
                <div class="head-title" style="margin-top: 20px;">>
                    <div class="left"></div>
                    <a href="ordermanager" class="btn-download" data-toggle="modal">
                        <span class="text">Return OrderManager</span>
                    </a>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->

    </body>
</html>
