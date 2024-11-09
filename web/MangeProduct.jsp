<%-- 
    Document   : ManageProduct
    Created on : Nov 5, 2024, 1:21:13 AM
    Author     : TuấnAnh Hà
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Manage Products</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
         <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f6f9;
                margin: 0;
                padding: 20px;
                color: #333;
            }

            .btn {
                padding: 8px 16px;
                font-size: 14px;
                border-radius: 4px;
                text-decoration: none;
                color: #fff;
                display: inline-flex;
                align-items: center;
                gap: 5px;
            }

            .btn-success {
                background-color: #28a745;
                border: none;
                margin-bottom: 20px;
            }

            .btn-warning {
                background-color: #ffc107;
                border: none;
                color: #333;
            }

            .btn-danger {
                background-color: #dc3545;
                border: none;
            }

            .btn:hover {
                opacity: 0.9;
                cursor: pointer;
            }

            .btn i {
                font-size: 16px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                background-color: #fff;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            table th, table td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #dee2e6;
            }

            table thead th {
                background-color: #28a745;
                color: #fff;
                font-weight: bold;
            }

            table tbody tr:hover {
                background-color: #f1f1f1;
            }

            table img {
                max-width: 50px;
                height: auto;
                border-radius: 4px;
            }

            .pagination {
                display: flex;
                justify-content: center;
                padding: 10px 0;
                list-style: none;
            }

            .pagination li {
                margin: 0 5px;
            }

            .pagination a {
                color: #007bff;
                text-decoration: none;
                padding: 8px 12px;
                border: 1px solid #dee2e6;
                border-radius: 4px;
                transition: background-color 0.3s;
            }

            .pagination a:hover {
                background-color: #e9ecef;
            }

            .pagination .active a {
                background-color: #007bff;
                color: #fff;
                border-color: #007bff;
            }

            .clearfix {
                overflow: auto;
                padding-top: 20px;
            }

            /* CSS cho modal */
            .modal {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;
                z-index: 1000;
            }

            .modal.active {
                display: flex;
            }

            .modal-dialog {
                background-color: #fff;
                border-radius: 8px;
                width: 90%;
                max-width: 500px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
                overflow: hidden;
            }

            .modal-header, .modal-footer {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 15px;
                background-color: #f1f1f1;
            }

            .modal-header h4 {
                margin: 0;
                font-size: 18px;
            }

            .modal-body {
                padding: 20px;
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-group label {
                font-size: 14px;
                color: #555;
                display: block;
                margin-bottom: 5px;
            }

            .form-control, .form-select {
                width: 100%;
                padding: 10px;
                font-size: 14px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }

            .modal-footer .btn {
                padding: 8px 16px;
                border-radius: 4px;
                cursor: pointer;
            }

            .btn-default {
                background-color: #6c757d;
                color: #fff;
            }

            .btn-success {
                background-color: #28a745;
                color: #fff;
            }

        </style>
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/style_dashboard.css">
    </head>
    <body>
        <%@include file="sidebardashboard.jsp" %>
        <section id="content">

            <!-- Nút để thêm sản phẩm mới -->
            <a href="#" class="btn btn-success" onclick="openModal()">
            <i class="material-icons">&#xE147;</i> <span>Add New Product</span>
        </a>

        <!-- Bảng danh sách sản phẩm -->
        <table class="table table-hover text-nowrap">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Image</th>
                    <th scope="col">Cost</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Vòng lặp để hiển thị danh sách sản phẩm -->
                <c:forEach items="${listP}" var="o">
                    <tr>
                        <td>${o.id}</td>
                        <td>${o.name}</td>
                        <td><img src="${o.image}" alt="Product Image"></td>
                        <td>${o.price} $</td>
                        <td>
    <!-- Nút chỉnh sửa sản phẩm -->
    <a href="update?pid=${o.id}">
        <button type="button" class="btn btn-warning action-btn">
            <i class="material-icons" title="Edit">&#xE254;</i>
        </button>
    </a>
    <!-- Nút xóa sản phẩm -->
    <a href="delete?pid=${o.id}">
        <button type="button" class="btn btn-danger action-btn">
            <i class="material-icons" title="Delete">&#xE872;</i>
        </button>
    </a>
</td>

                    </tr>
                </c:forEach>
                <!-- Hiển thị khi không có sản phẩm nào -->
                <c:if test="${empty listP}">
                    <tr>
                        <td colspan="5" class="text-center">No products found.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>

        <!-- Phân trang -->
        <div class="clearfix">
            <ul class="pagination">
                <!-- Nút Previous -->
                <c:if test="${tag != 1}">
                    <li class="page-item">
                        <a href="manageproduct?index=${tag-1}" class="page-link">Previous</a>
                    </li>
                </c:if>

                <!-- Số trang -->
                <c:forEach begin="1" end="${endPage}" var="i">
                    <li class="${tag==i ? 'page-item active' : ''}">
                        <a href="manageproduct?index=${i}" class="page-link">${i}</a>
                    </li>
                </c:forEach>

                <!-- Nút Next -->
                <c:if test="${tag != endPage}">
                    <li class="page-item">
                        <a href="manageproduct?index=${tag+1}" class="page-link">Next</a>
                    </li>
                </c:if>
            </ul>
        </div>

        <!-- Modal thêm sản phẩm -->
        <div id="addEmployeeModal" class="modal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" onclick="closeModal()" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control">
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
                            <input type="button" class="btn btn-default" onclick="closeModal()" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            // Mở modal
            function openModal() {
                document.getElementById('addEmployeeModal').classList.add('active');
            }

            // Đóng modal
            function closeModal() {
                document.getElementById('addEmployeeModal').classList.remove('active');
            }

            // Đóng modal khi nhấn ngoài khung modal
            window.onclick = function(event) {
                var modal = document.getElementById('addEmployeeModal');
                if (event.target == modal) {
                    closeModal();
                }
            }
        </script>
        </section>
    </body>
</html>
