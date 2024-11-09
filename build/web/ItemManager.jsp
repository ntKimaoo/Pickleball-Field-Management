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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
            <!-- NAVBAR -->
            <%@include file="headerdashboard.jsp" %>
            <!-- NAVBAR -->

            <!-- MAIN -->
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Item List</h1>
                    </div>
                    <a href="#additem" class="btn-download" data-toggle="modal">
                        <i class='bx bxs-cloud-download' ></i>
                        <span class="text">Add New Item</span>
                    </a>
                </div>

                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <form>
                                <label>Category:</label>
                                <select name="cid" onchange="this.form.submit()">
                                    <option value="">All Categories</option> 
                                    <c:forEach items="${categoryList}" var="c">
                                        <c:if test="${c.status}"> 
                                            <option value="${c.id}" ${param.cid == c.id ? 'selected' : ''}>${c.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>                     
                                <label>Status:</label>
                                <select name="itemStatus" onchange="this.form.submit()">
                                    <option value="" >All Statuses</option>
                                    <option value="true" ${param.itemStatus == 'true' ? 'selected' : ''}>Active</option>
                                    <option value="false" ${param.itemStatus == 'false' ? 'selected' : ''}>Inactive</option>
                                </select>
                                <button type="button" onclick="clearAll()">Clear Filter</button>
                            </form>
                        </div>

                        <table>
                            <thead> 
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Quantity</th>
                                    <th>Cost</th>
                                    <th>Category</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${itemList != null && itemList.isEmpty()}">
                                        <tr>
                                            <td colspan="9">Không có sản phẩm bạn đang tìm kiếm !</td>
                                        </tr>
                                    </c:when>
                                    <c:when test="${itemList != null}">
                                        <c:forEach var="o" items="${itemList}">
                                            <tr>
                                                <td>${o.id}</td>
                                                <td>${o.name}</td>
                                                <td><img src="${o.image}" style="max-width: 100px; max-height: 100px; object-fit: cover;"></td>                                          
                                                <td>${o.quantity}</td>
                                                <td>${o.cost}</td>        
                                                <td>${o.category.name}</td>  
                                                <td>${o.status ? "Active" : "Inactive"}</td>
                                                <td>
                                                    <c:if test="${o.status==true}">
                                                        <a href="itemmanager?iid=${o.id}&changeStatus=${o.status}&cid=${param.cid}&itemStatus=${param.itemStatus}">Deactive</a>
                                                    </c:if>
                                                    <c:if test="${o.status==false}">
                                                        <a href="itemmanager?iid=${o.id}&changeStatus=${o.status}&cid=${param.cid}&itemStatus=${param.itemStatus}">Active</a>
                                                    </c:if>
                                                    <a href="updateitem?id=${o.id}">Edit</a>
                                                </td>                  
                                            </tr>
                                        </c:forEach>   
                                    </c:when>       
                                </c:choose>
                            </tbody>
                        </table>

                        <div id="additem" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="additem" method="post">
                                        <div class="modal-header">						
                                            <h4 class="modal-title">Add New Item </h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        </div>
                                        <div class="modal-body">					
                                            <div class="form-group">
                                                <label>Name</label>
                                                <input name="name" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Description</label>
                                                <input name="description" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Image</label>
                                                <input name="image" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Quantity</label>
                                                <input name="quantity" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Cost</label>
                                                <input name="cost" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Category</label>
                                                <select name="category" class="form-select" aria-label="Default select example" required>
                                                    <option value="" disabled selected>-- Select Category --</option>
                                                    <c:forEach items="${categoryList}" var="o">
                                                        <c:if test="${o.status}">
                                                            <option value="${o.id}">${o.name}</option>
                                                        </c:if>                                                        
                                                    </c:forEach>
                                                </select>
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
                                <a class="page-link" href="itemmanager?page=${page - 1}">Previous</a>
                            </li>
                        </c:if>
                        <c:forEach begin="1" end="${totalPage}" var="i">
                            <li class="page-item ${i == page ? 'active' : ''}">
                                <a class="page-link" href="itemmanager?page=${i}">${i}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${page < totalPage}">
                            <li class="page-item">
                                <a class="page-link" href="itemmanager?page=${page + 1}">Next</a>
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
                document.querySelector('select[name="cid"]').selectedIndex = 0;
                document.querySelector('select[name="itemStatus"]').selectedIndex = 0;
                document.querySelector('form').submit();
            }
        </script>
        <script src="script.js"></script>
    </body>
</html>
