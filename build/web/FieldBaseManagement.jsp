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
            .pagination {
                display: flex;
                justify-content: center;
                list-style-type: none;
                padding: 0;
                margin: 20px 0;
            }

            .pagination li {
                margin: 0 5px;
            }

            .pagination a {
                display: block;
                padding: 8px 16px;
                text-decoration: none;
                color: #007bff;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .pagination a:hover {
                background-color: #f1f1f1;
            }

            .pagination a.active {
                background-color: #007bff;
                color: white;
                border: 1px solid #007bff;
            }

            .pagination a.disabled {
                color: #ccc;
                cursor: not-allowed;
                border-color: #ddd;
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
            <!-- NAVBAR -->
            <%@include file="headerdashboard.jsp" %>

            <!-- MAIN -->
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Field List</h1>
                    </div>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div style="display: flex; align-items: center; justify-content: space-between">
                            <div style="display: flex;">
                                <div class="head" style="margin-right: 20px">
                                    <form id="myform" action="searchfield" method="get">
                                        <select id="categorySelect" name="filter" onchange="submitForm()">
                                            <option value="" <c:if test="${filter==''}">selected</c:if>>All field</option>
                                            <option value="address" <c:if test="${filter=='address'}">selected</c:if>>Address</option>
                                            <option value="cost" <c:if test="${filter=='cost'}">selected</c:if>>Cost</option>     
                                        </select>
                                </div>
                                <div class="head" style="margin-right: 20px">
                                    <select id="statusSelect" name="status" onchange="submitForm()">
                                        <option value=""  <c:if test="${status==''}">selected</c:if>>All</option>
                                        <option value="online" <c:if test="${status=='online'}">selected</c:if>>Online</option>
                                        <option value="offline" <c:if test="${status=='offline'}">selected</c:if>>Offline</option>
                                        <option value="maintenance" <c:if test="${status=='maintenance'}">selected</c:if>>Maintaince</option>
                                    </select>
                                    </form>
                                </div>

                            </div>
                            <div class="head">
                                <a href="addnewfieldtobase.jsp?base=${id}" style="background-color: #00aced;color: white;padding: 3px;border-radius: 10px">
                                    <i class='bx bxs-cloud-download' ></i>
                                    <span>Add field</span>
                                </a>
                            </div>
                        </div>
                        <table>
                            <thead> 
                                <tr>
                                    <th>Id</th>
                                    <th>Base address</th>
                                    <th>Cost</th>
                                    <th>Vip</th>
                                    <th>Status</th>
                                    <th>Image</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${listfield != null}">
                                    <c:forEach var="s" items="${listfield}">
                                        <tr>
                                            <td>${s.getId()}</td>
                                            <td>${base}</td>
                                            <td>${s.getCost()}</td>
                                            <td>${s.isViponly()}</td>
                                            <td>${s.getStatus()}</td>
                                            <td>${s.getImage()}</td>
                                            <td><a href="editfield?id=${s.getId()}">Edit</a></td>
                                        </c:forEach>
                                    </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>           
                <div><!-- phan trang default -->
                    <c:if test="${filterRole==null&&filterStatus==null}">
                        <ul class="pagination">
                            <li>
                                <c:if test="${pageIndex==1}">
                                    <a class="disabled" aria-disabled="true">
                                        Previous</a>
                                    </c:if>
                                    <c:if test="${pageIndex>1}">
                                    <a href="usermanagement?index=${pageIndex-1}" aria-disabled="true">
                                        Previous</a>
                                    </c:if>
                            </li>
                            <c:forEach begin="1" end="${endP}" var="i">
                                <li><a class="${pageIndex==i ? "active":""}" href="usermanagement?index=${i}">${i}</a></li>
                                </c:forEach>
                            <li>
                                <c:if test="${pageIndex<endP}">
                                    <a class="page-link" href="usermanagement?index=${pageIndex+1}">Next</a>
                                </c:if>
                                <c:if test="${pageIndex==endP}">
                                    <a class="disabled">Next</a>
                                </c:if>
                            </li>
                        </ul>
                    </c:if>
                    <!-- phan trang role -->
                    <c:if test="${filterRole!=null&&filterStatus==null}">
                        <ul class="pagination">
                            <li>
                                <c:if test="${pageIndex==1}">
                                    <a class="disabled" aria-disabled="true">
                                        Previous</a>
                                    </c:if>
                                    <c:if test="${pageIndex>1}">
                                    <a href="filteruser?category=${filterRole}&index=${pageIndex-1}" aria-disabled="true">
                                        Previous</a>
                                    </c:if>
                            </li>
                            <c:forEach begin="1" end="${endP}" var="i">
                                <li><a class="${pageIndex==i ? "active":""}" href="filteruser?category=${filterRole}&index=${i}">${i}</a></li>
                                </c:forEach>
                            <li>
                                <c:if test="${pageIndex<endP}">
                                    <a class="page-link" href="filteruser?category=${filterRole}&index=${pageIndex+1}">Next</a>
                                </c:if>
                                <c:if test="${pageIndex==endP}">
                                    <a class="disabled">Next</a>
                                </c:if>
                            </li>
                        </ul>
                    </c:if>
                    <!-- phan trang status -->
                    <c:if test="${filterStatus!=null&&filterRole==null}">
                        <ul class="pagination">
                            <li>
                                <c:if test="${pageIndex==1}">
                                    <a class="disabled" aria-disabled="true">
                                        Previous</a>
                                    </c:if>
                                    <c:if test="${pageIndex>1}">
                                    <a href="filterStatus?status=${filterStatus}&index=${pageIndex-1}" aria-disabled="true">
                                        Previous</a>
                                    </c:if>
                            </li>
                            <c:forEach begin="1" end="${endP}" var="i">
                                <li><a class="${pageIndex==i ? "active":""}" href="filterStatus?status=${filterStatus}&index=${i}">${i}</a></li>
                                </c:forEach>
                            <li>
                                <c:if test="${pageIndex<endP}">
                                    <a class="page-link" href="filterStatus?status=${filterStatus}&index=${pageIndex+1}">Next</a>
                                </c:if>
                                <c:if test="${pageIndex==endP}">
                                    <a class="disabled">Next</a>
                                </c:if>
                            </li>
                        </ul>
                    </c:if>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->
        <script src="script.js"></script>
        <script>
                                            function submitForm() {
                                                document.getElementById('myform').submit();
                                            }</script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </body>
</html>
