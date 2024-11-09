<%-- 
    Document   : UpdateItem
    Created on : Oct 27, 2024, 6:37:01 PM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="css/style_dashboard.css">

    </head>
    <body>
        <%@include file="sidebardashboard.jsp" %>
        <!-- CONTENT -->
        <section id="content">
            <%@include file="headerdashboard.jsp" %>
            <main>
                <div class="container">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="updateitem" method="post">
                                <div class="modal-header">
                                    <h4 class="modal-title">Update Product</h4>
                                    <a href="itemmanager" class="btn btn-link">Back</a>
                                </div>
                                <div class="modal-body">					
                                    <div class="form-group">
                                        <label>ID</label>
                                        <input value="${update.id}" name="id" type="text" class="form-control" readonly required>
                                    </div>
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input value="${update.name}" name="name" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Description</label>
                                        <input value="${update.description}" name="description" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Image</label>
                                        <input value="${update.image}" name="image" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Quantity</label>
                                        <input value="${update.quantity}" name="quantity" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Cost</label>
                                        <input value="${update.cost}" name="cost" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Category</label>
                                        <select name="category" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${categoryList}" var="o">
                                                <option value="${o.id}" ${o.id == update.category.id ? 'selected' : ''}>${o.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">           
                                    <input type="submit" class="btn btn-success" value="Update">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </main>
        </section>
        <script src="script.js"></script>
    </body>
</html>
