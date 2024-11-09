<%-- 
    Document   : dashboard
    Created on : Sep 28, 2024, 9:56:26 PM
    Author     : kiennn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dal.BaseDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">                
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

                <div class="head-title">
                    <div class="left">
                        <h1>Category List</h1>
                    </div>
                    <a href="#addCategory" class="btn-download" data-toggle="modal">
                        <i class='bx bxs-cloud-download' ></i>
                        <span class="text">Add New Category</span>
                    </a>
                </div>

                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <form>
                                <label>Status:</label>
                                <select name="categoryStatus" onchange="this.form.submit()">
                                    <option value="">All Statuses</option>
                                    <option value="true" ${param.categoryStatus == 'true' ? 'selected' : ''}>Active</option>
                                    <option value="false" ${param.categoryStatus == 'false' ? 'selected' : ''}>Inactive</option>
                                </select>
                                <button type="button" onclick="clearAll()">Clear Filter</button>
                            </form>
                        </div>
                        <table>
                            <thead> 
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${categoryList != null}">
                                    <c:forEach var="o" items="${categoryList}">
                                        <tr>
                                            <td>${o.id}</td>
                                            <td>${o.name}</td>
                                            <td>${o.status ? "Active" : "Inactive"}</td>
                                            <td>
                                                <c:if test="${o.status == true}">
                                                    <a href="categorymanager?cid=${o.id}&status=${o.status}">Deactive</a>
                                                </c:if>
                                                <c:if test="${o.status == false}">
                                                    <a href="categorymanager?cid=${o.id}&status=${o.status}">Active</a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>



                        <div id="addCategory" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="addcategory" method="post">
                                        <div class="modal-header">						
                                            <h4 class="modal-title">Add Item Category</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        </div>
                                        <div class="modal-body">					
                                            <div class="form-group">
                                                <label>Name</label>
                                                <input name="name" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Status</label>
                                                <div>
                                                    <label>
                                                        <input type="radio" name="status" value="true" required>
                                                        Active
                                                    </label>
                                                    <label>
                                                        <input type="radio" name="status" value="false" required>
                                                        Inactive
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                            <input type="submit" class="btn btn-success" value="Add">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>  
                    </div>

                </div>
                <div style="text-align: center;">
                    <ul class="pagination" style="display: inline-block;">
                        <c:if test="${page > 1}">
                            <li class="page-item">
                                <a class="page-link" href="categorymanager?page=${page - 1}">Previous</a>
                            </li>
                        </c:if>
                        <c:forEach begin="1" end="${totalPage}" var="i">
                            <li class="page-item ${i == page ? 'active' : ''}">
                                <a class="page-link" href="categorymanager?page=${i}">${i}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${page < totalPage}">
                            <li class="page-item">
                                <a class="page-link" href="categorymanager?page=${page + 1}">Next</a>
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
                document.querySelector('select[name="categoryStatus"]').selectedIndex = 0;
                document.querySelector('form').submit();
            }
        </script>
        <script src="script.js"></script>
    </body>
</html>
