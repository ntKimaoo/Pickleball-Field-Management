<%-- 
    Document   : OrderManager
    Created on : Nov 2, 2024, 8:59:34 PM
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
                        <div class="head">
                            <form>
                                <label>Status:</label>
                                <select name="orderStatus" onchange="this.form.submit()">
                                    <option value="">All Statuses</option>
                                    <option value="true" ${param.orderStatus == 'true' ? 'selected' : ''}>Paid</option>
                                    <option value="false" ${param.orderStatus == 'false' ? 'selected' : ''}>Unpaid</option>
                                </select>   

                                <label>Sort Total Amount:</label>
                                <select name="sortOrderTotal" onchange="this.form.submit()">
                                    <option value="">All Total Amount</option> <!-- Default option -->
                                    <option value="asc" ${param.sortOrderTotal == 'asc' ? 'selected' : ''}>ASC</option>
                                    <option value="desc" ${param.sortOrderTotal == 'desc' ? 'selected' : ''}>DESC</option>
                                </select>                                                         
                            </form>
                            <button type="button" onclick="clearAll()">Clear Filter</button>


                        </div>
                        <table>
                            <thead> 
                                <tr>
                                    <th>OrderID</th>
                                    <th>CustomerID</th>
                                    <th>Order date</th>
                                    <th>Total amount</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${order ne null}">
                                    <c:forEach var="o" items="${order}">
                                        <tr>
                                            <td>${o.getId()}</td>
                                            <td>${o.getCustomer_id()}</td>
                                            <td>${o.getCreatedDate()}</td>
                                            <td><fmt:formatNumber value="${o.getTotalPrice()}" type="number" />K vnd</td>
                                            <td>${o.isStatus() ? "Paid" : "UnPaid"}</td>
                                            <td>
                                                <a href="ordermanager?sid=${o.getId()}&changeStatus=${o.isStatus()}">ChangeStatus</a>
                                                <a href="orderdetailmanager?id=${o.getId()}">Detail</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>
                    </div>                   
                </div>
                <div style="text-align: center;">
                    <ul class="pagination" style="display: inline-block;">
                        <c:if test="${page > 1}">
                            <li class="page-item">
                                <a class="page-link" href="ordermanager?page=${page - 1}">Previous</a>
                            </li>
                        </c:if>
                        <c:forEach begin="1" end="${totalPage}" var="i">
                            <li class="page-item ${i == page ? 'active' : ''}">
                                <a class="page-link" href="ordermanager?page=${i}">${i}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${page < totalPage}">
                            <li class="page-item">
                                <a class="page-link" href="ordermanager?page=${page + 1}">Next</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->
        <script>
            function clearAll() {
                document.querySelector('select[name="sortOrderTotal"]').selectedIndex = 0;
                document.querySelector('select[name="orderStatus"]').selectedIndex = 0;
                document.querySelector('form').submit();
            }
        </script>
        <script src="script.js"></script>
    </body>
</html>
